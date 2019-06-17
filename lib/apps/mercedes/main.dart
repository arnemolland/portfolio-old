import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/mercedes/home.dart';
import 'package:portfolio/apps/mercedes/theme.dart';

class MercedesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Mercedes.theme,
      child: HomeView(),
    );
  }
}
