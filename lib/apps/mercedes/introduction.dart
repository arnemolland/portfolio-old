import 'package:flutter_web/material.dart';
import 'package:portfolio/theme.dart';

class IntroductionView extends StatefulWidget {
  final VoidCallback onNavigateBack;
  IntroductionView({this.onNavigateBack});

  @override
  _IntroductionViewState createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView>
    with TickerProviderStateMixin {
  Animation<double> _heroAnimation;
  AnimationController _heroController;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _heroController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    final curve = CurvedAnimation(parent: _heroController, curve: Curves.ease);
    _heroAnimation = Tween<double>(begin: 1, end: 1.5).animate(curve);

    Future.delayed(Duration(milliseconds: 1000))
        .then((_) => _heroController.forward());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Image.asset(
            'images/mercedes/eq_white.png',
            height: 20,
          ),
          leading: FlatButton(
            child: Text(
              '\ue910',
              style: TextStyle(
                fontFamily: 'FeatherIcons',
                color: Colors.white,
              ),
            ),
            onPressed: widget.onNavigateBack,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _heroAnimation,
                child: Image.asset(
                  'images/mercedes/eq_front_centered.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                builder: (context, child) {
                  return Transform.scale(
                    scale: _heroAnimation.value,
                    child: child,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Text.rich(
                TextSpan(text: 'EQC\nEnjoy Electric.'),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Margem',
                  fontSize: Molland.adaptiveFontSize(context, 20, 24, 28),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                child: Text(
                  'Order now',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _scaffoldKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text(
                          'Too late ⚡',
                          style: TextStyle(color: Colors.white,
                          fontFamily: 'Margem'),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
