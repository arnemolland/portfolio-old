import 'package:flutter_web/material.dart';

class LoadingPainter extends CustomPainter {
  final Color titleColor;
  final Color subtitleColor;
  final String titleFont;
  final String subtitleFont;
  final Offset offset;
  final double size;

  LoadingPainter({this.titleColor, this.subtitleColor, this.offset, this.titleFont, this.subtitleFont, this.size});

  @override
  void paint(Canvas canvas, Size size) {
    var loading = TextSpan(
      text: 'LOADING',
      style: TextStyle(
        fontSize: this.size / 2,
        color: this.subtitleColor,
        fontFamily: this.titleFont,
      ),
    );
    var span = TextSpan(
      text: 'Arne Molland\n',
      style: TextStyle(
        fontSize: this.size,
        color: this.titleColor,
        fontFamily: this.subtitleFont,
      ),
      children: [loading],
    );
    var textPainter = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, this.offset.translate(-textPainter.width / 2, 0));
  }

  @override
  bool shouldRepaint(LoadingPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(LoadingPainter oldDelegate) => false;
}
