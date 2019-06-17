import 'dart:async';
import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/painters/circle_painter.dart';
import 'package:portfolio/routes.dart';
import 'dart:html';
import 'package:portfolio/playground/name.dart';

class LoadingView extends StatefulWidget {
  String s;
  String t;
  LoadingView({Key key, this.t}) : super(key: key);

  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _playAnimation();

    // Hacky pre-caching
    Image.asset('images/portrait.png');
    Image.asset('images/spacex.png');
    Image.asset('images/string/dangelico.png');
    Image.asset('images/string/dots.png');
    Image.asset('images/string/lespaul.png');
    Image.asset('images/string/lightning.png');
    Image.asset('images/string/stratocaster.png');
    Image.asset('images/string/telecaster.png');
    Image.asset('images/string/zigzag.png');
    Image.asset('images/california/yosemite.png');
    Image.asset('images/california/capitan.jpg');
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
