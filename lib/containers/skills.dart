import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class SkillsView extends StatefulWidget {
  final VoidCallback onPreviousPressed;
  SkillsView({Key key, this.onPreviousPressed}) : super(key: key);
  _SkillsViewState createState() => _SkillsViewState();
}

class _SkillsViewState extends State<SkillsView> with TickerProviderStateMixin {
  Animation _fadeAnimation;
  AnimationController _fadeAnimationController;

  final tech = [
    'Dart',
    'GOOgle AssOciate AndrOid DevelOper',
    'CI/CD',
    'Product Development',
    'C#',
    'DevOps',
    'React Native',
    'GOOgle Cloud Platform',
    'Kotlin',
    'Project Management',
    'Swift',
    'JavaScript',
    'Xamarin Certified Mobile Professional',
    'Brand Development',
    'Social Media Strategy',
    'Java',
    'Node',
    'Flutter',
    'React',
    'Vue',
  ];

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
    final labelStyle = TextStyle(
      fontSize: Molland.adaptiveFontSize(context, 64, 48, 32),
    );
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: EdgeInsets.only(left: Molland.adaptiveFontSize(context, 200, 100, 75)),
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              children: [
                for (var name in tech) Text(name, style: labelStyle),
              ],
            ),
          ],
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton.icon(
                  icon: Icon(Icons.arrow_left),
                  label:
                      Text('${Wrapper.isLargeScreen(context) ? 'Bio' : ''}'),
                  onPressed: () => widget.onPreviousPressed()),
            ],
          ),
        ),
      ],
    );
  }
}
