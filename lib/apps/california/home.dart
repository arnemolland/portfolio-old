import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/data.dart';
import 'package:portfolio/apps/california/park.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ParkView(
          park: Data.yosemite,
          constraints: constraints,
        );
      },
    );
  }
}
