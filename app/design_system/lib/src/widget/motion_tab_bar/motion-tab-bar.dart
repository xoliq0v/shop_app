import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'motion-tab-controller.dart';
import 'motion-tab-item.dart';

typedef MotionTabBuilder = Widget Function();

class MotionTabBar extends StatefulWidget {
  final Color? tabIconColor, tabIconSelectedColor, tabSelectedColor, tabBarColor;
  final double? tabIconSize, tabIconSelectedSize, tabBarHeight, tabSize;
  final TextStyle? textStyle;
  final Function? onTabItemSelected;
  final String initialSelectedTab;

  final List<String?> labels;
  final List<String>? svgIconPaths;
  final bool useSafeArea;
  final MotionTabBarController? controller;

  // badge
  final List<Widget?>? badges;

  MotionTabBar({super.key,
    this.textStyle,
    this.tabIconColor = Colors.black,
    this.tabIconSize = 24,
    this.tabIconSelectedColor = Colors.white,
    this.tabIconSelectedSize = 24,
    this.tabSelectedColor = Colors.black,
    this.tabBarColor = Colors.white,
    this.tabBarHeight = 65,
    this.tabSize = 60,
    this.onTabItemSelected,
    required this.initialSelectedTab,
    required this.labels,
    this.svgIconPaths,
    this.useSafeArea = true,
    this.badges,
    this.controller,
  })  : assert(labels.contains(initialSelectedTab)),
        assert(svgIconPaths != null && svgIconPaths.length == labels.length),
        assert((badges != null && badges.isNotEmpty) ? badges.length == labels.length : true);

  @override
  _MotionTabBarState createState() => _MotionTabBarState();
}

class _MotionTabBarState extends State<MotionTabBar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Tween<double> _positionTween;
  late Animation<double> _positionAnimation;

  late AnimationController _fadeOutController;
  late Animation<double> _fadeFabOutAnimation;
  late Animation<double> _fadeFabInAnimation;

  late List<String?> labels;
  late Map<String?, String> svgIcons;

  int get tabAmount => svgIcons.keys.length;
  int get index => labels.indexOf(selectedTab);
  double get position {
    double pace = 2 / (labels.length - 1);
    return (pace * num.parse(index.toString())) - 1;
  }

  double fabIconAlpha = 1;
  String? activeSvgIconPath;
  String? selectedTab;

  List<Widget>? badges;
  Widget? activeBadge;

  @override
  void initState() {
    super.initState();

    if (widget.controller != null) {
      widget.controller!.onTabChange = (index) {
        setState(() {
          activeSvgIconPath = widget.svgIconPaths![index];
          selectedTab = widget.labels[index];
        });
        _initAnimationAndStart(_positionAnimation.value, double.parse(position.toString()));
      };
    }

    labels = widget.labels;
    svgIcons = Map.fromIterable(
      labels,
      key: (label) => label.toString(),
      value: (label) => widget.svgIconPaths![labels.indexOf(label.toString())],
    );

    selectedTab = widget.initialSelectedTab;
    activeSvgIconPath = svgIcons[selectedTab];

    // init badge text
    int selectedIndex = labels.indexWhere((element) => element == widget.initialSelectedTab);
    activeBadge = (widget.badges != null && widget.badges!.length > 0) ? widget.badges![selectedIndex] : null;

    _animationController = AnimationController(
      duration: Duration(milliseconds: ANIM_DURATION),
      vsync: this,
    );

    _fadeOutController = AnimationController(
      duration: Duration(milliseconds: (ANIM_DURATION ~/ 5)),
      vsync: this,
    );

    _positionTween = Tween<double>(begin: double.parse(position.toString()), end: 1);

    _positionAnimation = _positionTween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0)
        .animate(CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeSvgIconPath = svgIcons[selectedTab];

            int selectedIndex = labels.indexWhere((element) => element == selectedTab);
            activeBadge = (widget.badges != null && widget.badges!.length > 0) ? widget.badges![selectedIndex] : null;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _animationController, curve: Interval(0.8, 1, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: widget.tabBarColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1),
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(15)
      ),
      child: SafeArea(
        bottom: widget.useSafeArea,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SizedBox(
              height: widget.tabBarHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: generateTabItems(),
                ),
              ),
            ),
            IgnorePointer(
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Align(
                  heightFactor: 0,
                  alignment: Alignment(_positionAnimation.value, 0),
                  child: FractionallySizedBox(
                    widthFactor: 1 / num.parse(tabAmount.toString()),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: widget.tabSize! + 30,
                          width: widget.tabSize! + 30,
                          child: ClipRect(
                            clipper: HalfClipper(),
                            child: Center(
                              child: Container(
                                width: widget.tabSize! + 10,
                                height: widget.tabSize! + 10,
                                decoration: BoxDecoration(
                                  color: widget.tabBarColor,
                                  shape: BoxShape.circle,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: widget.tabSize! + 15,
                          width: widget.tabSize! + 35,
                          child: CustomPaint(painter: HalfPainter(color: widget.tabBarColor)),
                        ),
                        SizedBox(
                          height: widget.tabSize,
                          width: widget.tabSize,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.tabSelectedColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Opacity(
                                opacity: fabIconAlpha,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      activeSvgIconPath!,
                                      color: widget.tabIconSelectedColor,
                                      height: widget.tabIconSelectedSize,
                                      width: widget.tabIconSelectedSize,
                                    ),
                                    if (activeBadge != null)
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: activeBadge!,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateTabItems() {
    return labels.map((tabLabel) {
      String? svgIconPath = svgIcons[tabLabel];

      int selectedIndex = labels.indexWhere((element) => element == tabLabel);
      Widget? badge = (widget.badges != null && widget.badges!.length > 0) ? widget.badges![selectedIndex] : null;

      return MotionTabItem(
        selected: selectedTab == tabLabel,
        svgIconPath: svgIconPath!,
        title: tabLabel,
        textStyle: widget.textStyle ?? TextStyle(color: Colors.black),
        tabIconColor: widget.tabIconColor ?? Colors.black,
        tabIconSize: widget.tabIconSize,
        badge: badge,
        callbackFunction: () {
          setState(() {
            activeSvgIconPath = svgIconPath;
            selectedTab = tabLabel;
            widget.onTabItemSelected!(index);
          });
          _initAnimationAndStart(_positionAnimation.value, double.parse(position.toString()));
        },
      );
    }).toList();
  }

  _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}

class HalfPainter extends CustomPainter {
  final Color? color;
  HalfPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double curveSize = 10;
    final double xStartingPos = 0;
    final double yStartingPos = (size.height / 2);
    final double yMaxPos = yStartingPos - curveSize;

    final path = Path();

    path.moveTo(xStartingPos, yStartingPos);
    path.lineTo(size.width - xStartingPos, yStartingPos);
    path.quadraticBezierTo(size.width - (curveSize), yStartingPos, size.width - (curveSize + 5), yMaxPos);
    path.lineTo(xStartingPos + (curveSize + 5), yMaxPos);
    path.quadraticBezierTo(xStartingPos + (curveSize), yStartingPos, xStartingPos, yStartingPos);

    path.close();

    canvas.drawPath(path, Paint()..color = color ?? Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height / 2);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
// HalfClipper and HalfPainter classes remain unchanged