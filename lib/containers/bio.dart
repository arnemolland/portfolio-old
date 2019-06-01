import 'dart:async';
import 'dart:math';
import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/painters/perlin_terrain.dart';
import 'package:portfolio/theme.dart';

class BioView extends StatefulWidget {
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  const BioView({Key key, this.onNextPressed, this.onPreviousPressed})
      : super(key: key);

  @override
  _BioViewState createState() => _BioViewState();
}

class _BioViewState extends State<BioView> with TickerProviderStateMixin {
  Timer _radiusTimer;
  Timer _scrollTimer;
  PageController _controller;
  AnimationController _fadeAnimationController;
  Animation _fadeAnimation;
  final double _phase = 0;
  final double _zoff = 0;

  double _radius = 1;

  final skills = [
    'creative',
    'student',
    'creator',
    'strategist',
    'learner',
    'teacher',
    '☕️❤️',
    '😎',
  ];

  final layers = [1, 2, 3];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: Random().nextInt(skills.length));
    _fadeAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _fadeAnimation =
        CurvedAnimation(parent: _fadeAnimationController, curve: Curves.easeIn);
    _fadeAnimationController.forward();
    // Call after build to ensure ScrollViewController is attached to PageView
    WidgetsBinding.instance.addPostFrameCallback((_) => initTimers());
  }

  void initTimers() {
    _scrollTimer = Timer.periodic(
      Duration(seconds: 2),
      (timer) => mounted
          ? _controller.animateToPage(Random().nextInt(skills.length),
              duration: Duration(milliseconds: 250), curve: Curves.ease)
          : null,
    );
    _radiusTimer = Timer.periodic(
      Duration(milliseconds: 50),
      (timer) => mounted ? setState(() => _radius += 0.075) : null,
    );
  }

  @override
  void dispose() {
    _radiusTimer.cancel();
    _scrollTimer.cancel();
    _controller.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle =
        TextStyle(fontSize: Molland.adaptiveFontSize(context, 64, 48, 32));

    return Stack(
      alignment: Alignment.center,
      children: [
        ...layers
            .map((layer) => CustomPaint(
                  painter: PerlinTerrainPainter(
                      color: Theme.of(context).accentColor,
                      radius: layer * _radius,
                      zoff: _zoff,
                      phase: _phase),
                ))
            .toList(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I\'m a',
              style: labelStyle,
            ),
            Container(
              width: Molland.adaptiveFontSize(context, 500, 350, 250),
              height: Molland.adaptiveFontSize(context, 64, 48, 42),
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  for (var skill in skills)
                    Text(
                      skill,
                      style: labelStyle,
                    ),
                ],
              ),
            ),
          ],
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton.icon(
                  icon: Icon(Icons.arrow_left),
                  label: Text(
                      '${Wrapper.isLargeScreen(context) ? 'Profile' : ''}'),
                  onPressed: () => widget.onPreviousPressed()),
              FlatButton.icon(
                  icon: Icon(Icons.arrow_right),
                  label: Text(
                      '${Wrapper.isLargeScreen(context) ? 'Skills' : ''}'),
                  onPressed: () => widget.onNextPressed()),
            ],
          ),
        ),
      ],
    );
  }
}
