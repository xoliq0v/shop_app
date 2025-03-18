import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double ICON_OFF = -3;
const double ICON_ON = 0;
const double TEXT_OFF = 3;
const double TEXT_ON = 1;
const double ALPHA_OFF = 0;
const double ALPHA_ON = 1;
const int ANIM_DURATION = 300;

class MotionTabItem extends StatefulWidget {
  final String? title;
  final bool selected;
  final String svgIconPath;
  final TextStyle textStyle;
  final Function callbackFunction;
  final Color tabIconColor;
  final double? tabIconSize;
  final Widget? badge;

  const MotionTabItem({
    super.key,
    required this.title,
    required this.selected,
    required this.svgIconPath,
    required this.textStyle,
    required this.tabIconColor,
    required this.callbackFunction,
    this.tabIconSize = 24,
    this.badge,
  });

  @override
  _MotionTabItemState createState() => _MotionTabItemState();
}

class _MotionTabItemState extends State<MotionTabItem> {
  double iconYAlign = ICON_ON;
  double textYAlign = TEXT_OFF;
  double iconAlpha = ALPHA_ON;

  @override
  void initState() {
    super.initState();
    _setIconTextAlpha();
  }

  @override
  void didUpdateWidget(MotionTabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setIconTextAlpha();
  }

  _setIconTextAlpha() {
    setState(() {
      iconYAlign = (widget.selected) ? ICON_OFF : ICON_ON;
      textYAlign = (widget.selected) ? TEXT_ON : TEXT_OFF;
      iconAlpha = (widget.selected) ? ALPHA_OFF : ALPHA_ON;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: ANIM_DURATION),
                alignment: Alignment(0, textYAlign),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.selected
                      ? Text(
                    widget.title!,
                    style: widget.textStyle,
                    softWrap: false,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  )
                      : Text(''),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => widget.callbackFunction(),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: AnimatedAlign(
                duration: const Duration(milliseconds: ANIM_DURATION),
                curve: Curves.easeIn,
                alignment: Alignment(0, iconYAlign),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: ANIM_DURATION),
                  opacity: iconAlpha,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => widget.callbackFunction(),
                        child: SvgPicture.asset(
                          widget.svgIconPath,
                          color: widget.tabIconColor,
                          height: widget.tabIconSize,
                          width: widget.tabIconSize,
                        ),
                      ),
                      if (widget.badge != null)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: widget.badge!,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}