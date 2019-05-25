import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/hero.dart';
import 'package:portfolio/containers/navbar.dart';
import 'package:portfolio/containers/wrapper.dart';
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
        body: Navbar(
          title: Text(
            'Arne Molland',
            style: Molland.titleStyle,
          ),
          child: HeroView(),
        ),
      ),
      mediumView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Arne Molland',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: HeroView(),
      ),
      smallView: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Arne Molland',
            style: Molland.titleStyle,
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Wrapper.buildDrawer(context),
        body: HeroView(),
      ),
    );
  }
}
