import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/theme.dart';

class Wrapper extends StatelessWidget {
  final Widget largeView;
  final Widget mediumView;
  final Widget smallView;

  Wrapper({Key key, this.largeView, this.mediumView, this.smallView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).size.aspectRatio < 0.3) {
          return Wrapper.tooTallView();
        } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
          return mediumView ?? largeView;
        } else if (constraints.maxWidth > 800) {
          return largeView;
        } else {
          return smallView ?? largeView;
        }
      },
    );
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            trailing: Text(
              'H',
              style: Molland.drawerLeading,
            ),
            title: Text(
              'HOme',
              style: Molland.drawerLink,
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          ListTile(
            trailing: Text(
              'A',
              style: Molland.drawerLeading,
            ),
            title: Text(
              'ABout',
              style: Molland.drawerLink,
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.about),
          ),
          ListTile(
            trailing: Text(
              'W',
              style: Molland.drawerLeading,
            ),
            title: Text(
              'WOrk',
              style: Molland.drawerLink,
            ),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.work),
          ),
          ListTile(
            trailing: Text(
              'C',
              style: Molland.drawerLeading,
            ),
            title: Text('cOntact', style: Molland.drawerLink),
            onTap: () =>
                Navigator.pushReplacementNamed(context, Routes.contact),
          ),
          ListTile(
            trailing: Text(
                AppStateContainer.of(context).state.isLightMode ? 'OFF' : 'ON'),
            title: Text('DArk Mode', style: Molland.drawerLink),
            onTap: () => AppStateContainer.of(context).toggleDarkMode(),
          )
        ],
      ),
    );
  }

  static Widget tooTallView() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Your browser is too tall. To fix it, make it wider.',
            style: Molland.randomTitle,
          ),
        ),
      ),
    );
  }

  static Widget tooWideView() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Your browser is too wide. To fix it, make it taller.',
            style: Molland.randomTitle,
          ),
        ),
      ),
    );
  }

  static Widget tooSmallView() {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Your browser is too small. To fix it, make it bigger.',
            style: Molland.randomTitle,
          ),
        ),
      ),
    );
  }

  static AppBar buildAppBar(BuildContext context, {String title}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: true,
      title: Text(
        title,
        style: Molland.titleStyle,
      ),
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
          onPressed: () => title == 'Arne Molland' ? null : Navigator.pushNamed(context, Routes.home),
        ),
        FlatButton(
          child: Text(
            'About',
            style: Molland.navbarLink,
          ),
          onPressed: () => title == 'About' ? null : Navigator.pushNamed(context, Routes.about),
        ),
        FlatButton(
          child: Text(
            'Work',
            style: Molland.navbarLink,
          ),
          onPressed: () => title == 'Work' ? null : Navigator.pushNamed(context, Routes.work),
        ),
        FlatButton(
          child: Text(
            'Contact',
            style: Molland.navbarLink,
          ),
          onPressed: () => title == 'Contact' ? null : Navigator.pushNamed(context, Routes.contact),
        ),
      ],
    );
  }

  static AppBar buildMobileAppBar(BuildContext context, {String title}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).canvasColor,
      centerTitle: true,
      title: Text(
        title,
        style: Molland.titleStyle,
      ),
    );
  }
}
