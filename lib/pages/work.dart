import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';

class WorkView extends StatefulWidget {
  WorkView({Key key}) : super(key: key);

  _WorkViewState createState() => _WorkViewState();
}

class _WorkViewState extends State<WorkView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      largeView: Scaffold(
        appBar: Wrapper.buildAppBar(context, title: 'Work'),
        drawer: Wrapper.buildDrawer(context),
        body: Center(
          child: Text('Work'),
        ),
      ),
    );
  }
}
