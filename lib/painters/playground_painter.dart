import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:flutter_web_ui/ui.dart';
import 'package:portfolio/generators/perlin.dart';

class PlaygroundPainter extends CustomPainter {
  final Color color;
  Path path = Path();
  double start = 0;
  double inc = 0.009;
  PerlinNoise p = PerlinNoise(octaves: 1, persistence: 0.5);

  PlaygroundPainter(this.color) : super();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.restore();
    canvas.translate(0, size.height / 1.25);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    var xoff = start;
    path.moveTo(0, p.perlinNoise(xoff, 0) * size.height);

    for (double x = 0; x < size.width; x += 4) {
      var y = map((p.perlinNoise(xoff, 0) * size.height), 0, size.height, 0,
          size.height * pi / 3);
      path.cubicTo(x * pi + y, y * pi / x, x * pi / 3, y * pi / 3, x, y);
      xoff += inc;
    }
    canvas.skew(pi / 180, 0);
    canvas.drawPath(path, paint);
    canvas.save();
    start += inc;
  }

  double map(
      double x, double min, double max, double targetMin, double targetMax) {
    return (x - min) * (max - min) / (targetMax - targetMin) + targetMin;
  }

  @override
  bool shouldRepaint(PlaygroundPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PlaygroundPainter oldDelegate) => false;
}
