import 'package:flutter_web/material.dart';
import 'package:flutter_web/services.dart';

class California {
  static get theme {
    return ThemeData(
        primaryColor: Colors.lightBlue,
        iconTheme: IconThemeData(color: Colors.white),
        fontFamily: 'PTSans');
  }

  static get headerLabel {
    return TextStyle(
        fontSize: 52,
        fontFamily: 'BreeSerif',
        color: Colors.white,
        letterSpacing: 1,
        height: 0.6);
  }

  static get headerCaption {
    return TextStyle(
      fontSize: 18,
      color: Colors.white,
    );
  }

  static get tileTitle {
    return TextStyle(
      fontSize: 18,
      fontFamily: 'BreeSerif',
      color: Colors.black,
      letterSpacing: 1,
    );
  }

  static void setTransparentStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
