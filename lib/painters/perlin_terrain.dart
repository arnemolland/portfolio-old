import 'dart:math';
import 'package:flutter_web/material.dart';
import 'package:portfolio/data/branch.dart';
import 'package:portfolio/generators/perlin.dart';
import 'package:vector_math/vector_math.dart' as vectorMath;

class PerlinTerrainPainter extends CustomPainter {
  double phase;
  double zoff;
  double noiseMax;
  double radius;
  int delay;
  Color color;

  PerlinTerrainPainter({this.phase = 0, this.zoff = 0, this.noiseMax = 5, this.radius = 100, this.delay = 0, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if(radius > 100) return;

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.translate(size.width / 2, size.height / 2);

    PerlinNoise p = PerlinNoise();
    Path path = Path();

    for (var a = 0.0; a < pi * 2; a += vectorMath.radians(5.0)) {
      var xoff = map(cos(a + phase), -1, 1, newMin: 0, newMax: noiseMax);
      var yoff = map(sin(a + phase), -1, 1, newMin: 0, newMax: noiseMax);
      var r = radius * map(p.perlinNoise(xoff, yoff), 0, 1,
          newMin: 100, newMax: size.height / 2);
      var x = r * cos(a);
      var y = r * sin(a);
      if (a == 0.0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    canvas.drawPath(path, paint);
  }

  double map(double value, double min, double max,
      {double newMin = 0, double newMax = 1}) {
    return (value - min) * ((newMax - newMin) / (max - min)) + newMin;
  }

  @override
  bool shouldRepaint(PerlinTerrainPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(PerlinTerrainPainter oldDelegate) => false;
}
