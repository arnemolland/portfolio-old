import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/home.dart';
import 'package:portfolio/loading.dart';
import 'package:portfolio/pages/work.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/theme.dart';

void main() => runApp(
      AppStateContainer(
        child: Portfolio(),
      ),
    );

class Portfolio extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: AppStateContainer.of(context).state.isLightMode
          ? Molland.lightMode
          : Molland.darkMode,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => HomeView(),
        Routes.loading: (context) => LoadingView(),
        Routes.about: (context) => AboutView(),
        Routes.work: (context) => WorkView(),
        Routes.contact: (context) => ContactView(),
      },
    );
  }
}
