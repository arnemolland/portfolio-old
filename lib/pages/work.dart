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
      largeView: Scaffold(
        body: Navbar(
          title: Text(
            'Work',
            style: Molland.titleStyle,
          ),
          child: Center(
            child: Text('Work'),
          ),
        ),
      ),
      mediumView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Work',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: Center(child: Text('Work')),
      ),
      smallView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Work',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: Center(
          child: Text('Work'),
        ),
      ),
    );
  }
}
