import 'package:flutter_web/material.dart';

class ZigzagWrapper extends StatelessWidget {
  final Widget child;
  const ZigzagWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/zigzag.jpg'),
          repeat: ImageRepeat.repeat,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.overlay,
          ),
        ),
      ),
      child: child,
    );
  }
}