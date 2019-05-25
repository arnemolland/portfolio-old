import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/navbar.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class ContactView extends StatefulWidget {
  ContactView({Key key}) : super(key: key);

  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      largeView: Scaffold(
        body: Navbar(
          title: Text(
            'Contact',
            style: Molland.titleStyle,
          ),
          child: Center(
            child: Text('Contact'),
          ),
        ),
      ),
      mediumView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Contact',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: Center(child: Text('Contact')),
      ),
      smallView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Contact',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: Center(
          child: Text('Contact'),
        ),
      ),
    );
  }
}
