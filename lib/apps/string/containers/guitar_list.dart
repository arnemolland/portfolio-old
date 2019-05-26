import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/containers/guitar_item.dart';
import 'package:portfolio/apps/string/data/guitar.dart';
import 'package:portfolio/apps/string/data/specs.dart';

class GuitarList extends StatefulWidget {
  GuitarList({Key key}) : super(key: key);

  _GuitarListState createState() => _GuitarListState();
}

class _GuitarListState extends State<GuitarList> {
  PageController _controller;
  double _currentPageOffset;
  final List<Image> images = List<Image>();
  final guitars = [
    Guitar(
      brand: 'Fender',
      model: 'Telecaster Deluxe Rosewood',
      image: 'images/guitars/telecaster.png',
    ),
    Guitar(
      brand: 'Fender',
      model: 'Parallel Universe Stratocaster',
      image: 'images/guitars/stratocaster.png',
      specs: Specs(
        finish: 'Lacquer/chrome',
        material: 'Maple',
        scale: '572mm',
        pickups: 'American Vintage 65 Single-Coil Jaguar',
        profile: 'Modern "Deep C"',
        fretboard: 'Rosewood',
        nut: 'Bone',
        neck: 'Gloss Nitrocellulose Lacquer',
      ),
    ),
    Guitar(
      brand: 'Gibson',
      model: 'Les Paul Standard 70\'s',
      image: 'images/guitars/lespaul.png',
      specs: Specs(
        finish: 'Flamed Maple',
        fretboard: 'Rosewood',
        material: 'Mahogany',
        neck: 'Mahogany',
        scale: '628mm',
        pickups: 'Burstbucker #1 & #2 humbucker',
        profile: 'Rounded',
        nut: 'Trapeze',
      ),
    ),
    Guitar(
      brand: 'D\'Angelico',
      model: 'Deluxe Atlantic Natural',
      image: 'images/guitars/dangelico.png',
      specs: Specs(
        material: 'Linden',
        finish: 'Mother of pearl & abalone split block',
        fretboard: 'Pau Ferro',
        neck: 'Satin finish',
        scale: '629mm',
        pickups: 'USA Seymour Duncan DA-59',
        profile: 'Deep U-shape',
        nut: 'Gilded'
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
      viewportFraction: 1,
    )..addListener(_setPagePosition);
    _currentPageOffset = 0;

    // Preload images to reduce pop-in
    guitars.forEach((guitar) => images.add(Image.asset(guitar.image)));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cache images
    images.forEach((image) => precacheImage(image.image, context));
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
