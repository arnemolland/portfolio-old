import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/home.dart';

class CaliforniaApp extends StatelessWidget {
  const CaliforniaApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: californiaTheme,
      child: HomeView(),
    );
  }

  get californiaTheme {
    return ThemeData(
      primaryColor: Color(0xFFDAD1A6),
      accentColor: Color(0xFFBA372B),
      canvasColor: Color(0xFFDAD1A6),
      textTheme: Typography.blackMountainView.copyWith(
        title: Typography.blackCupertino.title.copyWith(
          color: Color(0xFF080607),
        ),
      ),
      fontFamily: 'Ramabhadra'
    );
  }
}
