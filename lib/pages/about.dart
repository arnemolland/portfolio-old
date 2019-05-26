import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';

class AboutView extends StatefulWidget {
  AboutView({Key key}) : super(key: key);

  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      largeView: Scaffold(
        appBar: Wrapper.buildAppBar(context, title: 'About'),
        body: Center(
          child: Text('About'),
        ),
      ),
      mediumView: Scaffold(
        appBar: Wrapper.buildMobileAppBar(context, title: 'About'),
        drawer: Wrapper.buildDrawer(context),
        body: Center(child: Text('About')),
      ),
      smallView: Scaffold(
        appBar: Wrapper.buildMobileAppBar(context, title: 'About'),
        drawer: Wrapper.buildDrawer(context),
        body: Center(
          child: Text('About'),
        ),
      ),
    );
  }
}
