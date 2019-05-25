import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/data/random.dart';

import 'package:portfolio/painters/loading_painter.dart';

class RandomName extends StatefulWidget {
  RandomName({Key key}) : super(key: key);

  _RandomNameState createState() => _RandomNameState();
}

class _RandomNameState extends State<RandomName> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer =
        Timer.periodic(Duration(milliseconds: 125), (timer) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: LoadingPainter(
        titleFont: RandomData.font,
        subtitleFont: RandomData.font,
        offset: Offset(0, 0),
        titleColor: Colors.orange,
        subtitleColor: Colors.orange,
        // Temporary workaround responsive sizing
        size: Wrapper.isSmallScreen(context)
            ? 32
            : Wrapper.isMediumScreen(context) ? 64: 128,
      ),
    );
  }
}
