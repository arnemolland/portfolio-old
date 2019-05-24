import 'dart:async';
import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/painters/circle_painter.dart';
import 'package:portfolio/routes.dart';
import 'dart:html';
import 'package:portfolio/playground/name.dart';

class LoadingView extends StatefulWidget {
  LoadingView({Key key}) : super(key: key);

  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _playAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel.then((_) {
        Navigator.of(context).pushReplacementNamed(Routes.home);
      });
    } on TickerCanceled {
      print('Animation cancelled');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: IntroAnimation(
              width: MediaQuery.of(context).size.width,
              controller: _controller.view,
            ),
          ),
          RandomName(),
        ],
      ),
    );
  }
}

class IntroAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> circleScale;
  final double width;
  IntroAnimation({Key key, this.controller, this.width})
      : circleScale = Tween<double>(begin: 200, end: width ?? 5000).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              1.000,
              curve: Curves.bounceIn,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return CustomPaint(
      foregroundPainter: CirclePainter(
        offset: Offset(0, 0),
        radius: circleScale.value,
        color: Colors.orange,
      ),
      child: CustomPaint(
        foregroundPainter: CirclePainter(
          offset: Offset(0, 0),
          radius: circleScale.value - 100,
          color: Colors.orange,
        ),
        child: CustomPaint(
          foregroundPainter: CirclePainter(
            offset: Offset(0, 0),
            radius: circleScale.value - 200,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}