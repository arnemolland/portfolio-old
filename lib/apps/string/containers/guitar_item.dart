import 'dart:math';

import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/containers/guitar_modal.dart';
import 'package:portfolio/apps/string/data/guitar.dart';
import 'package:portfolio/containers/wrapper.dart';

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
        Align(
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
                    fontSize: Wrapper.isLargeScreen(context)
                        ? 22
                        : Wrapper.isMediumScreen(context) ? 20 : 18,
                    height: 0.9,
                  ),
                ),
                FlatButton.icon(
                  label: Text(
                    'Spec',
                    style: TextStyle(
                        fontFamily: 'Teko',
                        fontSize: Wrapper.isLargeScreen(context)
                            ? 18
                            : Wrapper.isMediumScreen(context) ? 16 : 14),
                  ),
                  icon: Icon(
                    Icons.arrow_drop_up,
                  ),
                  onPressed: () => Scaffold.of(context).showBottomSheet(
                        (context) => GuitarModal(
                              guitar: widget.guitar,
                            ),
                      ),
                ),
              ],
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
                    fontSize: Wrapper.isLargeScreen(context)
                        ? 91
                        : Wrapper.isMediumScreen(context) ? 78 : 76,
                    fontFamily: 'Teko',
                    color: Theme.of(context).textTheme.display1.color.withOpacity(0.7)
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(32 * gauss, 0),
              child: Container(
                 child: Align(
                  alignment: Alignment(0, -1.0),
                  child: Image.asset(
                    widget.guitar.image,
                    height: MediaQuery.of(context).size.aspectRatio < 1 ? MediaQuery.of(context).size.height/1.75 : MediaQuery.of(context).size.height/1.5
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
