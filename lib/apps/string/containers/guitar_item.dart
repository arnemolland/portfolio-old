import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/data/guitar.dart';

class GuitarItem extends StatefulWidget {
  final Guitar guitar;
  final double offset;
  GuitarItem({Key key, this.guitar, this.offset}) : super(key: key);

  _GuitarItemState createState() => _GuitarItemState();
}

class _GuitarItemState extends State<GuitarItem> {
  List<String> words;

  @override
  void initState() {
    super.initState();
    words = widget.guitar.model.split(" ");
    words.sort((a, b) => a.length.compareTo(b.length));
  }

  @override
  Widget build(BuildContext context) {
    double gauss = exp(-(pow((widget.offset.abs() - 0.5), 2) / 0.08));
    return Stack(
      children: [
        Transform.translate(
          offset: Offset(32 * gauss, 0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: words
                          .map(
                            (word) => TextSpan(text: '$word\n'),
                          )
                          .toList(),
                    ),
                    style: TextStyle(
                      fontFamily: 'Teko',
                      fontSize: 32,
                      height: 0.9,
                    ),
                  ),
                  FlatButton.icon(
                    label: Text('Spec'),
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
        Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            Align(
              alignment: Alignment(-1, -1),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text(
                  widget.guitar.brand.toUpperCase(),
                  style: TextStyle(
                    fontSize: 128,
                    fontFamily: 'Teko',
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(32 * gauss, 0),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Align(
                  alignment: Alignment(0, -1.0),
                  child: Image.asset(
                    widget.guitar.image,
                    height: MediaQuery.of(context).size.height / 1.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
