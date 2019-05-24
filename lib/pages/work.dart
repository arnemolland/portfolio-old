import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/navbar.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class WorkView extends StatefulWidget {
  WorkView({Key key}) : super(key: key);

  _WorkViewState createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        body: Navbar(
          title: Text(
            'Work',
            style: Molland.titleStyle,
          ),
          child: Text('Work'),
        ),
      ),
    );
  }
}
