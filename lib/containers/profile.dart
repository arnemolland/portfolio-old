import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class ProfileView extends StatefulWidget {
  final VoidCallback onNextPressed;

  const ProfileView({Key key, this.onNextPressed}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  AnimationController _fadeAnimationController;
  Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeAnimationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _fadeAnimation =
        CurvedAnimation(parent: _fadeAnimationController, curve: Curves.easeIn);
    _fadeAnimationController.forward();
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 25),
              child: CircleAvatar(
                backgroundImage: Image.asset('images/portrait.jpg').image,
                radius: 75,
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'ARNE MOLLAND\n',
                style: TextStyle(
                  fontFamily: 'MajorMono',
                  fontSize: Molland.adaptiveFontSize(context, 64, 48, 36),
                ),
                children: [
                  TextSpan(
                    text:
                        'IT Student @ Western Norway University of Applied Sciences\n',
                    style: TextStyle(
                      fontSize: Molland.adaptiveFontSize(context, 32, 24, 18),
                      fontFamily: 'Zcool',
                    ),
                  ),
                  TextSpan(
                    text: 'Co-founder & CTO @ Bluewhale AS',
                    style: TextStyle(
                      fontSize: Molland.adaptiveFontSize(context, 32, 24, 18),
                      fontFamily: 'Zcool',
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              FlatButton.icon(
                icon: Icon(Icons.arrow_right),
                label: Text('${Wrapper.isLargeScreen(context) ? 'Bio' : ''}'),
                onPressed: () => widget.onNextPressed(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
