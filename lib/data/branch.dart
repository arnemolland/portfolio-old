import 'package:flutter_web_ui/ui.dart';

class Branch {
   Offset start;
   Offset end;

   Branch({this.start, this.end});

   void show(Canvas canvas, Paint paint) {
     var path = Path();
     path.moveTo(start.dx, start.dy);
     path.lineTo(end.dx, start.dy);
     canvas.drawPath(path, paint);
   }
}
