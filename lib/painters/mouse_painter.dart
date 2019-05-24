import 'package:flutter_web/gestures.dart';
import 'package:flutter_web/material.dart';

class MousePainter extends CustomPainter {
  final Offset position;
  final double radius;
  final Color color;

  MousePainter(this.position, {this.color, this.radius = 20});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        this.position ?? size.center(Offset(0, 0)), this.radius, paint);
  }

  @override
  bool shouldRepaint(MousePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(MousePainter oldDelegate) => true;
}
