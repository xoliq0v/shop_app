import 'package:flutter/material.dart';
import 'motion-tab-controller.dart';

class MotionTabBar extends StatefulWidget {
  final Color? tabIconColor, tabIconSelectedColor, tabSelectedColor, tabBarColor;
  final double? tabIconSize, tabIconSelectedSize, tabBarHeight, tabSize;
  final TextStyle? textStyle;
  final Function(int)? onTabItemSelected;
  final int initialSelectedTab;
  final List<BottomNavigationBarItem> items;
  final bool useSafeArea;
  final MotionTabBarController? controller;

  MotionTabBar({
    Key? key,
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
    this.initialSelectedTab = 0,
    required this.items,
    this.useSafeArea = true,
    this.controller,
  }) : super(key: key);

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

  double fabIconAlpha = 1;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    selectedIndex = widget.initialSelectedTab;

    if (widget.controller != null) {
      widget.controller!.onTabChange = (index) {
        setState(() {
          selectedIndex = index;
        });
        _initAnimationAndStart(_positionAnimation.value, _getPosition(index));
      };
    }

    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeOutController = AnimationController(
      duration: Duration(milliseconds: 60),
      vsync: this,
    );

    _positionTween = Tween<double>(begin: _getPosition(selectedIndex), end: 1);

    _positionAnimation = _positionTween.animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {});
    });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut),
    )..addListener(() {
      setState(() {
        fabIconAlpha = _fadeFabOutAnimation.value;
      });
    });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.8, 1, curve: Curves.easeOut),
      ),
    )..addListener(() {
      setState(() {
        fabIconAlpha = _fadeFabInAnimation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.tabBarColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -1),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: SafeArea(
        bottom: widget.useSafeArea,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: widget.tabBarHeight,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _generateTabItems(),
              ),
            ),
            _buildFloatingTab(),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateTabItems() {
    return List.generate(widget.items.length, (index) {
      final item = widget.items[index];
      return Expanded(
        child: InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
              widget.onTabItemSelected?.call(index);
            });
            _initAnimationAndStart(_positionAnimation.value, _getPosition(index));
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: selectedIndex == index ? 0.0 : 1.0,
                duration: Duration(milliseconds: 300),
                child: item.icon,
              ),
              AnimatedAlign(
                duration: Duration(milliseconds: 300),
                alignment: Alignment(0, selectedIndex == index ? 0.3 : 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.label ?? '',
                    style: widget.textStyle?.copyWith(
                      color: selectedIndex == index ? widget.tabSelectedColor : widget.tabIconColor,
                    ),
                    softWrap: false,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildFloatingTab() {
    return IgnorePointer(
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Align(
          heightFactor: 0,
          alignment: Alignment(_positionAnimation.value, 0),
          child: FractionallySizedBox(
            widthFactor: 1 / widget.items.length,
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
                            BoxShadow(color: Colors.black12, blurRadius: 8)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: widget.tabSize! + 15,
                  width: widget.tabSize! + 35,
                  child: CustomPaint(
                    painter: HalfPainter(color: widget.tabBarColor),
                  ),
                ),
                SizedBox(
                  height: widget.tabSize,
                  width: widget.tabSize,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.tabSelectedColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Opacity(
                        opacity: fabIconAlpha,
                        child: widget.items[selectedIndex].activeIcon ?? widget.items[selectedIndex].icon,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getPosition(int index) {
    double pace = 2 / (widget.items.length - 1);
    return (pace * index) - 1;
  }

  void _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}

class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, size.width, size.height / 2);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class HalfPainter extends CustomPainter {
  final Color? color;
  HalfPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2)
      ..quadraticBezierTo(size.width, size.height / 2 - 10, size.width - 15, size.height / 2 - 20)
      ..lineTo(15, size.height / 2 - 20)
      ..quadraticBezierTo(0, size.height / 2 - 10, 0, size.height / 2)
      ..close();

    canvas.drawPath(path, Paint()..color = color ?? Colors.white);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}