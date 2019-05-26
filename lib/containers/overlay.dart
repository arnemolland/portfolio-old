import 'package:flutter_web/material.dart';
import 'package:portfolio/painters/mouse_painter.dart';

class MouseOverlay extends StatefulWidget {
  final Widget child;
  final Color color;
  MouseOverlay({Key key, this.child, this.color}) : super(key: key);

  _MouseOverlayState createState() => _MouseOverlayState();
}

class _MouseOverlayState extends State<MouseOverlay> with TickerProviderStateMixin {
  Offset _mousePosition;
  AnimationController _animationController;
  Animation<double> _mouseScaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _mouseScaleAnimation = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.000,
          1.000,
          curve: Curves.ease,
        ),
      )..addListener(() {
          setState(() {});
        }),
    );
  }

  void _updatePosition(PointerMoveEvent event) {
    setState(() => _mousePosition = event.position);
  }

  void _animateMouseClick(PointerDownEvent event) {
    setState(() => _mousePosition = event.position);
    _animationController.forward().then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: _updatePosition,
      onPointerDown: _animateMouseClick,
      child: CustomPaint(
        foregroundPainter: MousePainter(_mousePosition,
            color: widget.color ?? Theme.of(context).accentColor,
            radius: _mouseScaleAnimation.value),
        child: widget.child,
      ),
    );
  }
}
