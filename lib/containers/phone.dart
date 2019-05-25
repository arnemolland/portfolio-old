import 'package:flutter_web/material.dart';

class PhoneView extends StatefulWidget {
  final Widget child;
  PhoneView({Key key, this.child}) : super(key: key);

  _PhoneViewState createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(30),
          child: widget.child,
        );
      },
    );
  }
}
