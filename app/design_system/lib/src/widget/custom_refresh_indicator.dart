import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show clampDouble;
import 'package:flutter/material.dart';

const double _kDragContainerExtentPercentage = 0.25;
const double _kDragSizeFactorLimit = 1.5;
const Duration _kIndicatorSnapDuration = Duration(milliseconds: 150);
const Duration _kIndicatorScaleDuration = Duration(milliseconds: 200);

typedef RefreshCallback = Future<void> Function();

enum _RefreshIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
}

enum _IndicatorType { material, adaptive }

class CustomRefreshIndicator extends StatefulWidget {
  const CustomRefreshIndicator({
    required this.child,
    required this.onRefresh,
    super.key,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.elevation = 0,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  }) : _indicatorType = _IndicatorType.material;

  const CustomRefreshIndicator.adaptive({
    required this.child,
    required this.onRefresh,
    super.key,
    this.displacement = 40.0,
    this.edgeOffset = 0.0,
    this.color,
    this.backgroundColor,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.semanticsLabel,
    this.semanticsValue,
    this.strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,
    this.elevation = 0,
    this.triggerMode = RefreshIndicatorTriggerMode.onEdge,
  }) : _indicatorType = _IndicatorType.adaptive;
  final Widget child;

  final double displacement;
  final double edgeOffset;
  final RefreshCallback onRefresh;
  final Color? color;
  final Color? backgroundColor;
  final ScrollNotificationPredicate notificationPredicate;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double strokeWidth;
  final double elevation;
  final _IndicatorType _indicatorType;
  final RefreshIndicatorTriggerMode triggerMode;

  @override
  CustomRefreshIndicatorState createState() => CustomRefreshIndicatorState();
}

class CustomRefreshIndicatorState extends State<CustomRefreshIndicator>
    with TickerProviderStateMixin<CustomRefreshIndicator> {
  late AnimationController _positionController;
  late AnimationController _scaleController;
  late Animation<double> _positionFactor;
  late Animation<double> _scaleFactor;
  late Animation<double> _value;
  late Animation<Color?> _valueColor;

  _RefreshIndicatorMode? _mode;
  late Future<void> _pendingRefreshFuture;
  bool? _isIndicatorAtTop;
  double? _dragOffset;
  late Color _effectiveValueColor =
      widget.color ?? Theme.of(context).colorScheme.primary;

  static final Animatable<double> _threeQuarterTween =
      Tween<double>(begin: 0, end: 0.75);
  static final Animatable<double> _kDragSizeFactorLimitTween =
      Tween<double>(begin: 0, end: _kDragSizeFactorLimit);
  static final Animatable<double> _oneToZeroTween =
      Tween<double>(begin: 1, end: 0);

  @override
  void initState() {
    super.initState();
    _positionController = AnimationController(vsync: this);
    _positionFactor = _positionController.drive(_kDragSizeFactorLimitTween);
    _value = _positionController.drive(
        _threeQuarterTween); // The "value" of the circular progress indicator during a drag.

    _scaleController = AnimationController(vsync: this);
    _scaleFactor = _scaleController.drive(_oneToZeroTween);
  }

  @override
  void didChangeDependencies() {
    _setupColorTween();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomRefreshIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      _setupColorTween();
    }
  }

  @override
  void dispose() {
    _positionController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _setupColorTween() {
    _effectiveValueColor =
        widget.color ?? Theme.of(context).colorScheme.primary;
    final color = _effectiveValueColor;
    if (color.alpha == 0x00) {
      _valueColor = AlwaysStoppedAnimation<Color>(color);
    } else {
      _valueColor = _positionController.drive(
        ColorTween(
          begin: color.withAlpha(0),
          end: color.withAlpha(color.alpha),
        ).chain(
          CurveTween(
            curve: const Interval(0, 1.0 / _kDragSizeFactorLimit),
          ),
        ),
      );
    }
  }

  bool _shouldStart(ScrollNotification notification) {
    return ((notification is ScrollStartNotification &&
                notification.dragDetails != null) ||
            (notification is ScrollUpdateNotification &&
                notification.dragDetails != null &&
                widget.triggerMode == RefreshIndicatorTriggerMode.anywhere)) &&
        ((notification.metrics.axisDirection == AxisDirection.up &&
                notification.metrics.extentAfter == 0.0) ||
            (notification.metrics.axisDirection == AxisDirection.down &&
                notification.metrics.extentBefore == 0.0)) &&
        _mode == null &&
        _start(notification.metrics.axisDirection);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (!widget.notificationPredicate(notification)) {
      return false;
    }
    if (_shouldStart(notification)) {
      setState(() {
        _mode = _RefreshIndicatorMode.drag;
      });
      return false;
    }
    bool? indicatorAtTopNow;
    switch (notification.metrics.axisDirection) {
      case AxisDirection.down:
      case AxisDirection.up:
        indicatorAtTopNow = true;
      case AxisDirection.left:
      case AxisDirection.right:
        indicatorAtTopNow = null;
    }
    if (indicatorAtTopNow != _isIndicatorAtTop) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        _dismiss(_RefreshIndicatorMode.canceled);
      }
    } else if (notification is ScrollUpdateNotification) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        if (notification.metrics.axisDirection == AxisDirection.down) {
          _dragOffset = _dragOffset! - notification.scrollDelta!;
        } else if (notification.metrics.axisDirection == AxisDirection.up) {
          _dragOffset = _dragOffset! + notification.scrollDelta!;
        }
        _checkDragOffset(notification.metrics.viewportDimension);
      }
      if (_mode == _RefreshIndicatorMode.armed &&
          notification.dragDetails == null) {
        _show();
      }
    } else if (notification is OverscrollNotification) {
      if (_mode == _RefreshIndicatorMode.drag ||
          _mode == _RefreshIndicatorMode.armed) {
        if (notification.metrics.axisDirection == AxisDirection.down) {
          _dragOffset = _dragOffset! - notification.overscroll;
        } else if (notification.metrics.axisDirection == AxisDirection.up) {
          _dragOffset = _dragOffset! + notification.overscroll;
        }
        _checkDragOffset(notification.metrics.viewportDimension);
      }
    } else if (notification is ScrollEndNotification) {
      switch (_mode) {
        case _RefreshIndicatorMode.armed:
          if (_positionController.value < 1.0) {
            _dismiss(_RefreshIndicatorMode.canceled);
          } else {
            _show();
          }
        case _RefreshIndicatorMode.drag:
          _dismiss(_RefreshIndicatorMode.canceled);
        case _RefreshIndicatorMode.canceled:
        case _RefreshIndicatorMode.done:
        case _RefreshIndicatorMode.refresh:
        case _RefreshIndicatorMode.snap:
        case null:
          // do nothing
          break;
      }
    }
    return false;
  }

  bool _handleIndicatorNotification(
      OverscrollIndicatorNotification notification) {
    if (notification.depth != 0 || !notification.leading) {
      return false;
    }
    if (_mode == _RefreshIndicatorMode.drag) {
      notification.disallowIndicator();
      return true;
    }
    return false;
  }

  bool _start(AxisDirection direction) {
    assert(_mode == null);
    assert(_isIndicatorAtTop == null);
    assert(_dragOffset == null);
    switch (direction) {
      case AxisDirection.down:
      case AxisDirection.up:
        _isIndicatorAtTop = true;
      case AxisDirection.left:
      case AxisDirection.right:
        _isIndicatorAtTop = null;
        // we do not support horizontal scroll views.
        return false;
    }
    _dragOffset = 0.0;
    _scaleController.value = 0.0;
    _positionController.value = 0.0;
    return true;
  }

  void _checkDragOffset(double containerExtent) {
    assert(_mode == _RefreshIndicatorMode.drag ||
        _mode == _RefreshIndicatorMode.armed);
    var newValue =
        _dragOffset! / (containerExtent * _kDragContainerExtentPercentage);
    if (_mode == _RefreshIndicatorMode.armed) {
      newValue = math.max(newValue, 1.0 / _kDragSizeFactorLimit);
    }
    _positionController.value =
        clampDouble(newValue, 0, 1); // this triggers various rebuilds
    if (_mode == _RefreshIndicatorMode.drag &&
        _valueColor.value!.alpha == _effectiveValueColor.alpha) {
      _mode = _RefreshIndicatorMode.armed;
    }
  }

  // Stop showing the refresh indicator.
  Future<void> _dismiss(_RefreshIndicatorMode newMode) async {
    await Future<void>.value();
    // This can only be called from _show() when refreshing and
    // _handleScrollNotification in response to a ScrollEndNotification or
    // direction change.
    assert(newMode == _RefreshIndicatorMode.canceled ||
        newMode == _RefreshIndicatorMode.done);
    setState(() {
      _mode = newMode;
    });
    switch (_mode!) {
      case _RefreshIndicatorMode.done:
        await _scaleController.animateTo(1, duration: _kIndicatorScaleDuration);
      case _RefreshIndicatorMode.canceled:
        await _positionController.animateTo(0,
            duration: _kIndicatorScaleDuration);
      case _RefreshIndicatorMode.armed:
      case _RefreshIndicatorMode.drag:
      case _RefreshIndicatorMode.refresh:
      case _RefreshIndicatorMode.snap:
        assert(false);
    }
    if (mounted && _mode == newMode) {
      _dragOffset = null;
      _isIndicatorAtTop = null;
      setState(() {
        _mode = null;
      });
    }
  }

  void _show() {
    assert(_mode != _RefreshIndicatorMode.refresh);
    assert(_mode != _RefreshIndicatorMode.snap);
    final completer = Completer<void>();
    _pendingRefreshFuture = completer.future;
    _mode = _RefreshIndicatorMode.snap;
    _positionController
        .animateTo(1.0 / _kDragSizeFactorLimit,
            duration: _kIndicatorSnapDuration)
        .then<void>((void value) {
      if (mounted && _mode == _RefreshIndicatorMode.snap) {
        setState(() {
          // Show the indeterminate progress indicator.
          _mode = _RefreshIndicatorMode.refresh;
        });

        widget.onRefresh().whenComplete(() {
          if (mounted && _mode == _RefreshIndicatorMode.refresh) {
            completer.complete();
            _dismiss(_RefreshIndicatorMode.done);
          }
        });
      }
    });
  }

  Future<void> show({bool atTop = true}) {
    if (_mode != _RefreshIndicatorMode.refresh &&
        _mode != _RefreshIndicatorMode.snap) {
      if (_mode == null) {
        _start(atTop ? AxisDirection.down : AxisDirection.up);
      }
      _show();
    }
    return _pendingRefreshFuture;
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleIndicatorNotification,
        child: widget.child,
      ),
    );
    assert(() {
      if (_mode == null) {
        assert(_dragOffset == null);
        assert(_isIndicatorAtTop == null);
      } else {
        assert(_dragOffset != null);
        assert(_isIndicatorAtTop != null);
      }
      return true;
    }());

    final showIndeterminateIndicator = _mode == _RefreshIndicatorMode.refresh ||
        _mode == _RefreshIndicatorMode.done;

    return Stack(
      children: <Widget>[
        child,
        if (_mode != null)
          Positioned(
            top: _isIndicatorAtTop! ? widget.edgeOffset : null,
            bottom: !_isIndicatorAtTop! ? widget.edgeOffset : null,
            left: 0,
            right: 0,
            child: SizeTransition(
              axisAlignment: _isIndicatorAtTop! ? 1.0 : -1.0,
              sizeFactor: _positionFactor, // this is what brings it down
              child: Container(
                padding: _isIndicatorAtTop!
                    ? EdgeInsets.only(top: widget.displacement)
                    : EdgeInsets.only(bottom: widget.displacement),
                alignment: _isIndicatorAtTop!
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
                child: ScaleTransition(
                  scale: _scaleFactor,
                  child: AnimatedBuilder(
                    animation: _positionController,
                    builder: (BuildContext context, Widget? child) {
                      final Widget materialIndicator = RefreshProgressIndicator(
                        semanticsLabel: widget.semanticsLabel ??
                            MaterialLocalizations.of(context)
                                .refreshIndicatorSemanticLabel,
                        semanticsValue: widget.semanticsValue,
                        value: showIndeterminateIndicator ? null : _value.value,
                        valueColor: _valueColor,
                        backgroundColor: widget.backgroundColor,
                        strokeWidth: widget.strokeWidth,
                        elevation: widget.elevation,
                      );

                      final Widget cupertinoIndicator =
                          CupertinoActivityIndicator(
                        color: widget.color,
                      );

                      switch (widget._indicatorType) {
                        case _IndicatorType.material:
                          return materialIndicator;

                        case _IndicatorType.adaptive:
                          {
                            final theme = Theme.of(context);
                            switch (theme.platform) {
                              case TargetPlatform.android:
                              case TargetPlatform.fuchsia:
                              case TargetPlatform.linux:
                              case TargetPlatform.windows:
                                return materialIndicator;
                              case TargetPlatform.iOS:
                              case TargetPlatform.macOS:
                                return cupertinoIndicator;
                            }
                          }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
