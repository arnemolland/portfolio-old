import 'package:flutter_web/material.dart';

class CirclePainter extends CustomPainter {
  final double radius;
  final Offset offset;
  final Color color;

  CirclePainter({this.radius, this.color, this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = this.color;

    canvas.drawCircle(this.offset, this.radius, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePainter oldDelegate) => false;
}
