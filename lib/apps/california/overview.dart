import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/data.dart';
import 'package:portfolio/theme.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  final parks = [
    Data.yosemite,
  ];

  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        final park = parks[index];
        return Hero(
          tag: park.image,
          child: Container(
            decoration: BoxDecoration(gradient: park.background),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  park.image,
                  fit: BoxFit.cover,
                ),
                Text.rich(
                  TextSpan(
                    text: '${park.name.split(" ").first.toUpperCase()}\n',
                    children: [
                      TextSpan(
                        text: '${park.name.split(" ").last.toUpperCase()}\n',
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: Molland.adaptiveFontSize(context, 42, 38, 32),
                    fontFamily: 'BreeSerif',
                    color: Colors.white,
                    letterSpacing: 1.2,
                    height:
                        Molland.adaptiveFontSize(context, 0.725, 0.725, 0.75),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
