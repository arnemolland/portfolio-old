import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';
import 'package:portfolio/containers/hero.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/pages/about.dart';
import 'package:portfolio/pages/contact.dart';
import 'package:portfolio/pages/work.dart';
import 'package:portfolio/theme.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();

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

class _WrapperState extends State<Wrapper> {
  String _title;
  Widget _route;
  PageController _controller;

  final titleMap = {
    'Arne Molland': 0,
    'About': 1,
    'Work': 2,
    'Contact': 3,
    'Profile': 4,
    'Bio': 5,
    'Skills': 6,
  };

  final titles = [
    'Arne Molland',
    'About',
    'Work',
    'Contact',
    'Profile',
    'Bio',
    'Skills',
  ];

  @override
  void initState() {
    super.initState();
    _title = 'Arne Molland';
    // TODO change b4 prod
    _route = HeroView();
    _controller = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Wrapper.isLargeScreen(context)
          ? _buildAppBar(context)
          : _buildMobileAppBar(context),
      drawer: Wrapper.isLargeScreen(context) ? null : _buildDrawer(context),
      body: _route,
    );
  }

  void _changeView(Widget view, String title) {
    setState(() {
      _route = view;
      _title = title;
    });
    _controller.animateToPage(titleMap[title],
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  Widget _buildTitle() {
    return Container(
      child: PageView.custom(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        childrenDelegate: SliverChildListDelegate(
          titles
              .map((title) => Center(
                    child: Text(title, style: Molland.titleStyle),
                  ))
              .toList(),
        ),
      ),
    );
  }

  AppBar _buildMobileAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      flexibleSpace: _buildTitle(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      flexibleSpace: _buildTitle(),
      leading: Switch(
        inactiveThumbColor: Molland.darkMode.accentColor,
        inactiveTrackColor: Molland.darkMode.accentColor.shade900,
        value: AppStateContainer.of(context).state.isLightMode,
        onChanged: (value) {
          AppStateContainer.of(context).onLightModeChanged(value);
        },
      ),
      actions: [
        Hero(
          tag: _title == 'Home' ? '__navLink' : _title,
          child: FlatButton(
            child: Text(
              'Home',
              style: Molland.navbarLink,
            ),
            disabledTextColor: Colors.white,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            disabledColor: Theme.of(context).accentColor.withOpacity(0.7),
            onPressed: _title == 'Arne Molland'
                ? null
                : () => _changeView(HeroView(), 'Arne Molland'),
          ),
        ),
        Hero(
          tag: _title == 'About' ? '__navLink' : _title,
          child: FlatButton(
            child: Text(
              'About',
              style: Molland.navbarLink,
            ),
            disabledTextColor: Colors.white,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            disabledColor: Theme.of(context).accentColor.withOpacity(0.7),
            onPressed: _title == 'About'
                ? null
                : () => _changeView(AboutView(
                      onPageChanged: (title) {
                        _controller.animateToPage(titleMap[title],
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      },
                    ), 'About'),
          ),
        ),
        Hero(
          tag: _title == 'Work' ? '__navLink' : _title,
          child: FlatButton(
            child: Text(
              'Work',
              style: Molland.navbarLink,
            ),
            disabledTextColor: Colors.white,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            disabledColor: Theme.of(context).accentColor.withOpacity(0.7),
            onPressed:
                _title == 'Work' ? null : () => _changeView(WorkView(), 'Work'),
          ),
        ),
        Hero(
          tag: _title == 'Contact' ? '__navLink' : _title,
          child: FlatButton(
            child: Text(
              'Contact',
              style: Molland.navbarLink,
            ),
            disabledTextColor: Colors.white,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(75),
              ),
            ),
            disabledColor: Theme.of(context).accentColor.withOpacity(0.7),
            onPressed: _title == 'Contact'
                ? null
                : () => _changeView(ContactView(), 'Contact'),
          ),
        ),
      ],
    );
  }

  Drawer _buildDrawer(BuildContext context) {
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
            onTap: _title == 'Arne Molland'
                ? null
                : () => _changeView(HeroView(), 'Arne Molland'),
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
            onTap: _title == 'About'
                ? null
                : () => _changeView(AboutView(
                      onPageChanged: (title) {
                        _controller.animateToPage(titleMap[title],
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      },
                    ), 'About'),
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
            onTap:
                _title == 'Work' ? null : () => _changeView(WorkView(), 'Work'),
          ),
          ListTile(
            trailing: Text(
              'C',
              style: Molland.drawerLeading,
            ),
            title: Text('cOntact', style: Molland.drawerLink),
            onTap: _title == 'Contact'
                ? null
                : () => _changeView(ContactView(), 'Contact'),
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
}
