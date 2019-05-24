import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/theme.dart';

class Navbar extends StatefulWidget {
  final Widget child;
  final Widget title;
  Navbar({Key key, this.child, this.title}) : super(key: key);

  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool darkMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '__navbar',
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxScrolled) {
            return [
              SliverAppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).canvasColor,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace:
                    FlexibleSpaceBar(centerTitle: true, title: widget.title),
                leading: Switch(
                  inactiveThumbColor: Molland.darkMode.accentColor,
                  inactiveTrackColor: Molland.darkMode.accentColor.shade900,
                  value: AppStateContainer.of(context).state.isLightMode,
                  onChanged: (value) {
                    AppStateContainer.of(context).onLightModeChanged(value);
                  },
                ),
                actions: [
                  FlatButton(
                    child: Text(
                      'Home',
                      style: Molland.navbarLink,
                    ),
                    onPressed: () => Navigator.pushNamed(context, Routes.home),
                  ),
                  FlatButton(
                    child: Text(
                      'About',
                      style: Molland.navbarLink,
                    ),
                    onPressed: () => Navigator.pushNamed(context, Routes.about),
                  ),
                  FlatButton(
                    child: Text(
                      'Work',
                      style: Molland.navbarLink,
                    ),
                    onPressed: () => Navigator.pushNamed(context, Routes.work),
                  ),
                  FlatButton(
                    child: Text(
                      'Contact',
                      style: Molland.navbarLink,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, Routes.contact),
                  ),
                ],
              ),
            ];
          },
          body: Center(child: widget.child),
        ),
      ),
    );
  }
}
