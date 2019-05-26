import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/home.dart';

class StringApp extends StatelessWidget {
  const StringApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: stringTheme,
      child: HomeView(),
    );
  }

  get stringTheme {
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
