import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/home.dart';
import 'package:portfolio/apps/california/theme.dart';

class CaliforniaApp extends StatelessWidget {
  const CaliforniaApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: California.theme,
      child: HomeView(),
    );
  }
}
