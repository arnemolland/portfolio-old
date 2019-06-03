import 'package:flutter_web/material.dart';
import 'package:portfolio/painters/perlin_terrain.dart';
import 'package:portfolio/theme.dart';
import 'dart:js' as js;

class ContactView extends StatefulWidget {
  ContactView({Key key}) : super(key: key);

  _ContactViewState createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    final labelStyle =
        TextStyle(fontSize: Molland.adaptiveFontSize(context, 72, 48, 32));
    return CustomPaint(
      painter: PerlinTerrainPainter(
        color: Theme.of(context).accentColor,
        radius: 5,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              child: Text('Mail', style: labelStyle),
              onPressed: () =>
                  js.context.callMethod('open', ['mailto:arneolaim@gmail.com']),
            ),
            FlatButton(
              child: Text('LinkedIn', style: labelStyle),
              onPressed: () => js.context.callMethod(
                  'open', ['https://www.linkedin.com/in/arnemolland/']),
            ),
            FlatButton(
              child: Text('GitHub', style: labelStyle),
              onPressed: () => js.context
                  .callMethod('open', ['https://github.com/arnemolland']),
            ),
            FlatButton(
              child: Text('Instagram', style: labelStyle),
              onPressed: () => js.context
                  .callMethod('open', ['https://www.instagram.com/arneolai/']),
            ),
            FlatButton(
              child: Text('Medium', style: labelStyle),
              onPressed: () => js.context
                  .callMethod('open', ['https://medium.com/@arnemolland']),
            ),
            FlatButton(
              child: Text('Twitter', style: labelStyle),
              onPressed: () => js.context
                  .callMethod('open', ['https://twitter.com/arnemolland']),
            ),
          ],
        ),
      ),
    );
  }
}
