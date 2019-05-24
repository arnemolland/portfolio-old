import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/containers/dots.dart';
import 'package:portfolio/apps/string/containers/guitar_list.dart';

class GuitarsView extends StatefulWidget {
  GuitarsView({Key key}) : super(key: key);

  _GuitarsViewState createState() => _GuitarsViewState();
}

class _GuitarsViewState extends State<GuitarsView> {
  @override
  Widget build(BuildContext context) {
    return DottedWrapper(
      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'GUITARS',
              style: TextStyle(fontSize: 14),
            ),
            centerTitle: true,
            leading: FlatButton(
              child: Text(
                '\uf0c9',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'FontAwesomeSolid',
                  fontSize: 18,
                ),
              ),
              onPressed: () {},
            )),
        body: GuitarList(),
      ),
    );
  }
}
