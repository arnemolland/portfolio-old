import 'package:flutter_web/material.dart';

class TransitionPainter extends CustomPainter {
  final Color color;
  final double radius;

  TransitionPainter({this.color = Colors.black, this.radius = 0});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width/2,size.height/2), radius, paint);
  }

  @override
  bool shouldRepaint(TransitionPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(TransitionPainter oldDelegate) => false;
}
