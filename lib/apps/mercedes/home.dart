import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/mercedes/overview.dart';
import 'package:portfolio/apps/mercedes/introduction.dart';
import 'package:portfolio/apps/mercedes/painters/transition_painter.dart';
import 'package:portfolio/apps/mercedes/theme.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController _transitionController;
  Animation<double> _transitionAnimation;
  Widget _currentView;

  @override
  void initState() {
    super.initState();
    _currentView = Overview(
      onShowPressed: () => transitionTo(
            IntroductionView(
              onNavigateBack: transitionBack,
            ),
          ),
    );
    _transitionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    final curve =
        CurvedAnimation(parent: _transitionController, curve: Curves.ease);
    _transitionAnimation = Tween<double>(begin: 0, end: 1500).animate(curve)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _transitionController.dispose();
    super.dispose();
  }

  void transitionTo(Widget view) {
    _transitionController
        .forward()
        .then((_) => setState(() => _currentView = view))
        .then(
          (_) => _transitionController.reverse(from: 1000),
        );
  }

  void transitionBack() {
    _transitionController.reverse(from: 1000);
    setState(
      () => _currentView = Overview(
            onShowPressed: () => transitionTo(
                  IntroductionView(
                    onNavigateBack: transitionBack,
                  ),
                ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: TransitionPainter(radius: _transitionAnimation.value),
      child: _currentView,
    );
  }
}
