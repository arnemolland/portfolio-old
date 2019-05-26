import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/hero.dart';
import 'package:portfolio/containers/navbar.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/theme.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      largeView: Scaffold(
        appBar: Wrapper.buildAppBar(context, title: 'Arne Molland'),
        body: HeroView(),
      ),
      mediumView: Scaffold(
        appBar: Wrapper.buildAppBar(context, title: 'Arne Molland'),
        drawer: Wrapper.buildDrawer(context),
        body: HeroView(),
      ),
      smallView: Scaffold(
        appBar: Wrapper.buildAppBar(context, title: 'Arne Molland'),
        drawer: Wrapper.buildDrawer(context),
        body: HeroView(),
      ),
    );
  }
}
