import 'package:flutter_web/material.dart';

class DottedWrapper extends StatelessWidget {
  final Widget child;
  const DottedWrapper({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/string/dots.png'),
          fit: BoxFit.cover,
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
