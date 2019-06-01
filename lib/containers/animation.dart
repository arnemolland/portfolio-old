import 'dart:async';

import 'package:flutter_web/material.dart';

class PainterAnimation extends StatefulWidget {
  final CustomPainter painter;
  PainterAnimation({Key key, this.painter}) : super(key: key);

  _PainterAnimationState createState() => _PainterAnimationState();
}

class _PainterAnimationState extends State<PainterAnimation>
    with TickerProviderStateMixin {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        foregroundPainter: widget.painter,
      ),
    );
  }
}
