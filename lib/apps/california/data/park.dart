import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/hike.dart';
import 'package:portfolio/apps/california/data/lodge.dart';
import 'package:portfolio/apps/california/data/spot.dart';

class Park {
  final String name;
  final String description;
  final String image;
  final LinearGradient background;
  final List<Spot> spots;
  final List<Lodge> lodges;
  final List<Hike> hikes;

  const Park(
      {String name,
      String description,
      String image,
      LinearGradient background,
      List<Spot> spots,
      List<Lodge> lodges,
      List<Hike> hikes})
      : this.name = name ?? '',
        this.description = description ?? '',
        this.image = image ?? '',
        this.background = background ??
            const LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
        this.spots = spots,
        this.lodges = lodges,
        this.hikes = hikes;
}
