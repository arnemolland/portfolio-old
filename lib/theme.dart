import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/data/random.dart';

class Molland {
  static get lightMode {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.orange,
        fontFamily: 'MajorMono',
        toggleableActiveColor: Colors.orange);
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

  static double adaptiveFontSize(
      BuildContext context, double large, double medium, double small) {
    if (Wrapper.isLargeScreen(context)) {
      return large;
    } else if (Wrapper.isMediumScreen(context)) {
      return medium;
    } else {
      return small;
    }
  }

  static get titleStyle {
    return TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    );
  }

  static get randomTitle {
    return TextStyle(
      fontSize: 24,
      fontFamily: RandomData.fontReadable,
    );
  }

  static get navbarLink {
    return TextStyle(
      fontSize: 16,
    );
  }

  static get drawerLink {
    return TextStyle(fontSize: 18);
  }

  static get drawerLeading {
    return TextStyle(fontSize: 24);
  }
}
