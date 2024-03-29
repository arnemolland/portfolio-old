import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/main.dart';
import 'package:portfolio/apps/mercedes/main.dart';
import 'package:portfolio/apps/string/main.dart';
import 'package:portfolio/containers/phone.dart';
import 'package:portfolio/painters/perlin_terrain.dart';

class HeroView extends StatefulWidget {
  HeroView({Key key}) : super(key: key);

  _HeroViewState createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PerlinTerrainPainter(
        color: Theme.of(context).accentColor,
        radius: 5,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 100,
          bottom: 50,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView(
              controller: _controller,
              children: [
                Center(
                  child: PhoneView(
                    child: MercedesApp(),
                  ),
                ),
                Center(
                  child: PhoneView(
                    child: StringApp(),
                  ),
                ),
                Center(
                  child: PhoneView(
                    child: CaliforniaApp(),
                  ),
                ),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      icon: Icon(Icons.arrow_left),
                      label: Text('L'),
                      onPressed: () {
                        _controller.previousPage(
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      }),
                  FlatButton.icon(
                      icon: Icon(Icons.arrow_right),
                      label: Text('R'),
                      onPressed: () {
                        _controller.nextPage(
                            duration: Duration(seconds: 1), curve: Curves.ease);
                      }),
                ]),
          ],
        ),
      ),
    );
  }
}
