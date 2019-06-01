import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/overlay.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/loading.dart';
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
    return MouseOverlay(
      color: AppStateContainer.of(context).state.isLightMode
          ? Colors.orange
          : Colors.cyan,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Portfolio',
        theme: AppStateContainer.of(context).state.isLightMode
            ? Molland.lightMode
            : Molland.darkMode,
        initialRoute: Routes.loading,
        routes: {
          Routes.home: (context) => Wrapper(),
          Routes.loading: (context) => LoadingView(),
        },
      ),
    );
  }
}
