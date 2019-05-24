import 'package:flutter_web/material.dart';

class BrandPainter extends CustomPainter {
  final String text;
  final TextStyle style;
  final Offset offset;

  BrandPainter({this.text, this.style, this.offset});

  @override
  void paint(Canvas canvas, Size size) {
    var span = TextSpan(
      text: this.text,
      style: this.style,
    );
    var textPainter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(-size.width, -size.height),
    );
  }

  @override
  bool shouldRepaint(BrandPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BrandPainter oldDelegate) => false;
}
