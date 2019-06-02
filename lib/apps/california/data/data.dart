import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/hike.dart';
import 'package:portfolio/apps/california/data/lodge.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/apps/california/data/spot.dart';

class Data {
  static Park yosemite = Park(
    name: 'Yosemite Park',
    description: 'National Park',
    image: 'images/california/yosemite.png',
    background: LinearGradient(
      colors: [Colors.blue[300], Colors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
    spots: [
      Spot(
        name: 'El Capitan',
        description: 'A rock-climber favorite, and a must-see for any Yosemite visitor',
        rating: Random().rating
      ),
    ],
    lodges: List<Lodge>(),
    hikes: List<Hike>(),
  );
}
