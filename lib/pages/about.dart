import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/bio.dart';
import 'package:portfolio/containers/profile.dart';
import 'package:portfolio/containers/skills.dart';
import 'package:portfolio/painters/playground_painter.dart';

typedef StringCallback = Function(String);

class AboutView extends StatefulWidget {
  final StringCallback onPageChanged;

  AboutView({Key key, this.onPageChanged}) : super(key: key);

  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  PageController _controller;
  double _offset;

  final titleMap = {
    0: 'About',
    1: 'Bio',
    2: 'Skills',
  };

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _offset = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void animateToPage(int index) {
    _controller.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: PlaygroundPainter(
          Theme.of(context).accentColor.withOpacity(0.4),
        ),
        child: PageView(
            controller: _controller,
            children: [
              ProfileView(
                onNextPressed: () => animateToPage(1),
              ),
              BioView(
                onNextPressed: () => animateToPage(2),
                onPreviousPressed: () => animateToPage(0),
              ),
              SkillsView(
                onPreviousPressed: () => animateToPage(1),
              ),
            ],
            onPageChanged: (index) {
              widget.onPageChanged(titleMap[index]);
              //setState(() {});
            }),
      ),
    );
  }
}
