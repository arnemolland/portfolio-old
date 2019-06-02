import 'package:flutter_web/material.dart';

class LightningWrapper extends StatelessWidget {
  final Widget child;
  const LightningWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/string/lightning.jpg'),
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
