import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/data.dart';
import 'package:portfolio/apps/california/overview.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Overview(
      park: Data.yosemite,
    );
  }
}
