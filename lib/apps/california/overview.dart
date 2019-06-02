import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/containers/infinity_bar.dart';
import 'package:portfolio/apps/california/containers/infinity_tab.dart';
import 'package:portfolio/apps/california/containers/spots_list.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/apps/california/theme.dart';
import 'package:portfolio/icons/feather.dart';
import 'package:portfolio/theme.dart';

enum MenuType { spots, hikes, lodges, cars }

class Overview extends StatefulWidget {
  final Park park;

  Overview({@required this.park});
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with TickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> _scrollAnimation;
  Animation<double> _barAnimation;
  AnimationController _scrollAnimationController;
  AnimationController _animationController;
  AnimationController _barAnimationController;
  ScrollController _scrollController;

  int _currentTab;

  bool expanded;

  @override
  void initState() {
    super.initState();
    // Amount of tabs / 2
    _scrollController = ScrollController();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    final Animation curve =
        CurvedAnimation(parent: _animationController, curve: Curves.ease);
    _animation = Tween<double>(begin: 1.5, end: 1.25).animate(curve);
    _scrollAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _scrollAnimation =
        Tween<double>(begin: 200, end: 300).animate(_scrollAnimationController);
    _barAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _barAnimation =
        Tween<double>(begin: 0.05, end: -0.45).animate(_barAnimationController);

    _barAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
        setState(() => expanded = true);
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
        setState(() => expanded = false);
      }
    });
    expanded = false;
    _currentTab = 5 ~/ 2;
    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(widget.park.image), context);
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return SpotsList(
          widget.park,
          scrollable: expanded,
        );
      case 1:
        return SpotsList(
          widget.park,
          scrollable: expanded,
        );
      case 2:
        return SpotsList(
          widget.park,
          scrollable: expanded,
        );
      case 3:
        return SpotsList(
          widget.park,
          scrollable: expanded,
        );

      default:
        return SpotsList(
          widget.park,
          scrollable: expanded,
        );
    }
  }

  void onScrollBoxDragged(DragUpdateDetails details) {
    if (details.delta.dy > 0 && expanded) {
      _scrollAnimationController.reverse();
      _barAnimationController.reverse();
      // _animationController.forward();
    } else if (details.delta.dy < 0 && !expanded) {
      _scrollAnimationController.forward();
      _barAnimationController.forward();
      // _animationController.reverse();
    }
  }

  void onViewTapped() {
    if (expanded) {
      _scrollAnimationController.reverse();
      _barAnimationController.reverse();
      _animationController.forward();
    } else {
      _scrollAnimationController.forward();
      _barAnimationController.forward();
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconStyle = TextStyle(
      fontFamily: 'FeatherIcons',
      fontSize: 14,
      color: Colors.white.withOpacity(0.7),
    );

    return GestureDetector(
      onVerticalDragUpdate: onScrollBoxDragged,
      child: Container(
        decoration: BoxDecoration(gradient: widget.park.background),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: FlatButton(
              child: Text(
                '\ue97f',
                style: iconStyle,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '\ue9c1',
                  style: iconStyle,
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              Stack(
                alignment: Alignment(0, 1),
                children: [
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${widget.park.description.toUpperCase()}\n',
                            style: TextStyle(
                              fontSize:
                                  Molland.adaptiveFontSize(context, 14, 10, 8),
                              color: Colors.white,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              text:
                                  '${widget.park.name.split(" ").first.toUpperCase()}\n',
                              children: [
                                TextSpan(
                                  text:
                                      '${widget.park.name.split(" ").last.toUpperCase()}\n',
                                ),
                              ],
                            ),
                            style: TextStyle(
                              fontSize:
                                  Molland.adaptiveFontSize(context, 42, 38, 32),
                              fontFamily: 'BreeSerif',
                              color: Colors.white,
                              letterSpacing: 1.2,
                              height: Molland.adaptiveFontSize(
                                  context, 0.725, 0.725, 0.75),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      AnimatedBuilder(
                        animation: _animationController,
                        child: Image.asset(
                          widget.park.image,
                          fit: BoxFit.cover,
                          alignment: Alignment(1, -0.1),
                        ),
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animation.value,
                            child: child,
                          );
                        },
                      ),
                    ],
                  ),
                  AnimatedAlign(
                    curve: Curves.ease,
                    duration: Duration(seconds: 1),
                    alignment: Alignment.bottomCenter,
                    child: AnimatedContainer(
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 1000),
                      height: _scrollAnimation.value,
                      child: AnimatedContainer(
                        curve: Curves.ease,
                        duration: Duration(seconds: 1),
                        height: _scrollAnimation.value,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        color: Colors.transparent,
                                      ),
                                      Container(
                                        height: 40,
                                        color: Colors.white,
                                        child: Container(
                                          color: Colors.black.withOpacity(0.03),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AnimatedAlign(
                                  curve: Curves.ease,
                                  duration: Duration(seconds: 1),
                                  alignment: Alignment(0, expanded ? -1 : -1),
                                  child: AnimatedContainer(
                                    curve: Curves.ease,
                                    duration: Duration(seconds: 1),
                                    height: Molland.adaptiveFontSize(
                                        context, 75, 70, 65),
                                    child: InfinityBar(
                                      viewportFraction:
                                          Molland.adaptiveFontSize(
                                              context, 0.375, 0.35, 0.3),
                                      size: Molland.adaptiveFontSize(
                                          context, 60, 55, 50),
                                      tabs: [
                                        TabData(
                                          unicode: '\ue98b',
                                          label: 'Hikes',
                                        ),
                                        TabData(
                                          unicode: '\ue98c',
                                          label: 'Spots',
                                        ),
                                        TabData(
                                          unicode: '\ue943',
                                          label: 'Lodges',
                                        ),
                                        TabData(
                                          unicode: '\ue96b',
                                          label: 'Gifts',
                                        ),
                                        TabData(
                                          unicode: '\ue9e8',
                                          label: 'Rentals',
                                        ),
                                      ],
                                      onPageChanged: (index) =>
                                          setState(() => _currentTab = index),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                child: _getPage(0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
