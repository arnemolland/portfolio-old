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
      largeView: Scaffold(
        body: Navbar(
          title: Text(
            'About',
            style: Molland.titleStyle,
          ),
          child: Center(
            child: Text('About'),
          ),
        ),
      ),
      mediumView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'About',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: Center(child: Text('About')),
      ),
      smallView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'About',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: Center(
          child: Text('About'),
        ),
      ),
    );
  }
}
