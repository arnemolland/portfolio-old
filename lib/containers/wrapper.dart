import 'package:flutter_web/material.dart';
import 'package:flutter_web/gestures.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/painters/mouse_painter.dart';
import 'package:portfolio/routes.dart';
import 'package:portfolio/theme.dart';

class Wrapper extends StatefulWidget {
  final Widget largeView;
  final Widget mediumView;
  final Widget smallView;

  Wrapper({Key key, this.largeView, this.mediumView, this.smallView})
      : super(key: key);

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

  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  Offset _mousePosition;
  AnimationController _animationController;
  Animation<double> _mouseScaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _mouseScaleAnimation = Tween<double>(begin: 20, end: 50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.000,
          1.000,
          curve: Curves.ease,
        ),
      )..addListener(() {
          setState(() {});
        }),
    );
  }

  void _updatePosition(PointerMoveEvent event) {
    setState(() => _mousePosition = event.position);
  }

  void _animateMouseClick(PointerDownEvent event) {
    setState(() => _mousePosition = event.position);
    _animationController.forward().then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: _updatePosition,
      onPointerDown: _animateMouseClick,
      child: CustomPaint(
        foregroundPainter: MousePainter(_mousePosition,
            color: Theme.of(context).accentColor,
            radius: _mouseScaleAnimation.value),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (MediaQuery.of(context).size.aspectRatio < 0.4) {
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
            } else if (constraints.maxWidth < 1200 &&
                constraints.maxWidth > 800) {
              return widget.mediumView ?? widget.largeView;
            } else if (constraints.maxWidth > 800) {
              return widget.largeView;
            } else {
              return widget.smallView ?? widget.largeView;
            }
          },
        ),
      ),
    );
  }
}
