import 'package:flutter_web/material.dart';

class PhonePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  PhonePainter({this.color, this.strokeWidth});
  @override
  void paint(Canvas canvas, Size size) {
    // Wait until RRect paths are fixed in flutter_web

    /* var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = this.color
      ..strokeWidth = this.strokeWidth;

    Rect frame = Rect.fromPoints(Offset(size.width, size.height), Offset(0, 0));
    RRect shape = RRect.fromRectAndRadius(frame, Radius.circular(50));
    canvas.drawRRect(shape, paint); */
  }

  @override
  bool shouldRepaint(PhonePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(PhonePainter oldDelegate) => false;
}
