import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/containers/guitar_item.dart';
import 'package:portfolio/apps/string/data/guitar.dart';

class GuitarList extends StatefulWidget {
  GuitarList({Key key}) : super(key: key);

  _GuitarListState createState() => _GuitarListState();
}

class _GuitarListState extends State<GuitarList> {
  PageController _controller;
  double _currentPageOffset;
  final guitars = [
    Guitar(),
    Guitar(
      brand: 'Fender',
      model: 'Parallel Universe Stratocaster',
      image: 'images/guitars/stratocaster.png'
    ),
    Guitar(),
    Guitar(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: 1,
    )..addListener(_setPagePosition);
    _currentPageOffset = 0;
  }

  void _setPagePosition() {
    setState(() {
      _currentPageOffset = _controller.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      itemCount: guitars.length,
      itemBuilder: (context, index) {
        final guitar = guitars[index];
        return GuitarItem(
          guitar: guitar,
          offset: _currentPageOffset - index,
        );
      },
    );
  }
}
