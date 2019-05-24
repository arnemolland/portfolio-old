import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/navbar.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class AboutView extends StatefulWidget {
  AboutView({Key key}) : super(key: key);

  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        body: Navbar(
          title: Text(
            'About',
            style: Molland.titleStyle,
          ),
          child: Text('About'),
        ),
      ),
    );
  }
}
