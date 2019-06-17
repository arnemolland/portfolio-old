import 'package:flutter_web/material.dart';

class Mercedes {

  static get theme {
    return ThemeData(
      accentColor: Color(0xFF03CCA3),
      primaryColor: Color(0xFF0141FB),
      fontFamily: 'Copenhagen'
    );
  }

  static get gradient {
    return LinearGradient(
      colors: [
        theme.primaryColor,
        Colors.blue[600]
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    );
  }
}
