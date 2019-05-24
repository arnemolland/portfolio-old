import 'package:flutter_web/material.dart';
import 'package:portfolio/data/random.dart';

class Molland {
  static get lightMode {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.white,
      accentColor: Colors.orange,
      fontFamily: 'MajorMono',
      toggleableActiveColor: Colors.orange
    );
  }

  static get darkMode {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      accentColor: Colors.cyan,
      canvasColor: Colors.black,
      fontFamily: 'MajorMono',
      toggleableActiveColor: Colors.cyan,
    );
  }

  static get titleStyle {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static get randomTitle {
    return TextStyle(
      fontSize: 28,
      fontFamily: RandomData.font,
    );
  }

  static get navbarLink {
    return TextStyle(
      fontSize: 16,
    );
  }
}