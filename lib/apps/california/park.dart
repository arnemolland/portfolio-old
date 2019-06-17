import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/containers/gift_list.dart';
import 'package:portfolio/apps/california/containers/hike_list.dart';
import 'package:portfolio/apps/california/containers/infinity_bar.dart';
import 'package:portfolio/apps/california/containers/infinity_tab.dart';
import 'package:portfolio/apps/california/containers/rental_list.dart';
import 'package:portfolio/apps/california/containers/spot_list.dart';
import 'package:portfolio/apps/california/containers/lodge_list.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/apps/california/theme.dart';
import 'package:portfolio/icons/feather.dart';
import 'package:portfolio/theme.dart';

enum MenuType { spots, hikes, lodges, cars }

class ParkView extends StatefulWidget {
  final Park park;
  final BoxConstraints constraints;

  ParkView({@required this.park, @required this.constraints});

  @override
  _ParkViewState createState() => _ParkViewState();
}

class _ParkViewState extends State<ParkView> with TickerProviderStateMixin {
  Animation<double> _animation;
  Animation<double> _scrollAnimation;
  Animation<double> _barAnimation;
  AnimationController _scrollAnimationController;
  AnimationController _animationController;
  AnimationController _barAnimationController;
  PageController _controller;
  int _currentTab;
  Image parkImage;
  bool expanded;

  @override
  void initState() {
    super.initState();
    parkImage = Image.asset(widget.park.image);
    // Amount of tabs / 2
    _controller = PageController(initialPage: 5 ~/ 2);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    final Animation curve = CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCubic);
    _animation = Tween<double>(begin: 1.5, end: 1.25).animate(curve);
    _scrollAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _scrollAnimation = Tween<double>(
            begin: widget.constraints.maxHeight / 4,
            end: widget.constraints.maxHeight / 1.5)
        .animate(_scrollAnimationController);
    _barAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _barAnimation =
        Tween<double>(begin: 0.05, end: -0.45).animate(_barAnimationController);

    _barAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //_animationController.reverse();
        setState(() => expanded = true);
      } else if (status == AnimationStatus.dismissed) {
        //_animationController.forward();
        setState(() => expanded = false);
      }
    });
    expanded = false;
    _currentTab = 5 ~/ 2;
    _animationController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    _barAnimationController.dispose();
    _scrollAnimationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(parkImage.image, context);
  }

  Widget _getPage(int page) {
    switch (page) {
      case 0:
        return HikeList(
          widget.park,
          scrollable: expanded,
        );
      case 1:
        return SpotList(
          widget.park,
          scrollable: expanded,
        );
      case 2:
        return LodgeList(
          widget.park,
          scrollable: expanded,
        );
      case 3:
        return GiftList(
          widget.park,
          scrollable: expanded,
        );

      default:
        return RentalList(
          widget.park,
          scrollable: expanded,
        );
    }
  }

  void onScrollBoxDragged(DragUpdateDetails details) {
    if (details.delta.dy > 0 && expanded) {
      _scrollAnimationController.reverse();
      _barAnimationController.reverse();
      _animationController.forward();
    } else if (details.delta.dy < 0 && !expanded) {
      _scrollAnimationController.forward();
      _barAnimationController.forward();
      _animationController.reverse();
    }
  }

  void onScrollBoxDragStart(DragStartDetails details) {
    if (details.globalPosition.dy > 0 && expanded) {
      _scrollAnimationController.reverse();
      _barAnimationController.reverse();
      _animationController.forward();
    } else if (details.globalPosition.dy < 0 && !expanded) {
      _scrollAnimationController.forward();
      _barAnimationController.forward();
      _animationController.reverse();
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

  void changePage(int index) {
    setState(() => _currentTab = index);
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
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
      onVerticalDragStart: onScrollBoxDragStart,
      child: Hero(
        tag: '${widget.park.image}',
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
                                fontSize: Molland.adaptiveFontSize(
                                    context, 14, 10, 8),
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
                                fontSize: Molland.adaptiveFontSize(
                                    context, 42, 38, 32),
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
                      duration: Duration(milliseconds: 500),
                      alignment: Alignment.bottomCenter,
                      child: AnimatedContainer(
                        curve: Curves.ease,
                        duration: Duration(milliseconds: 500),
                        height: _scrollAnimation.value,
                        child: AnimatedContainer(
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 500),
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
                                          height: Molland.adaptiveFontSize(
                                              context, 40, 35, 30),
                                          color: Colors.white,
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.03),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AnimatedAlign(
                                    curve: Curves.ease,
                                    duration: Duration(seconds: 1),
                                    alignment: Alignment(0, 0),
                                    child: AnimatedContainer(
                                      curve: Curves.ease,
                                      duration: Duration(seconds: 1),
                                      height: Molland.adaptiveFontSize(
                                          context, 80, 75, 70),
                                      child: InfinityBar(
                                        currentTab: _currentTab,
                                        viewportFraction:
                                            Molland.adaptiveFontSize(
                                                context, 0.3, 0.3, 0.3),
                                        size: Molland.adaptiveFontSize(
                                            context, 50, 45, 40),
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
                                        onPageChanged: changePage,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  color: Theme.of(context).canvasColor,
                                  child: PageView(
                                    // Disable user scrolling until fixing InfinityTab to scroll synchronously
                                    physics: NeverScrollableScrollPhysics(),
                                    controller: _controller,
                                    children: [
                                      HikeList(
                                        widget.park,
                                        scrollable: expanded,
                                      ),
                                      SpotList(
                                        widget.park,
                                        scrollable: expanded,
                                      ),
                                      LodgeList(
                                        widget.park,
                                        scrollable: expanded,
                                      ),
                                      GiftList(
                                        widget.park,
                                        scrollable: expanded,
                                      ),
                                      RentalList(
                                        widget.park,
                                        scrollable: expanded,
                                      ),
                                    ],
                                    onPageChanged: changePage,
                                  ),
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
      ),
    );
  }
}
