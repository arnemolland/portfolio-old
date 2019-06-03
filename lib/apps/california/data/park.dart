import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/gift.dart';
import 'package:portfolio/apps/california/data/hike.dart';
import 'package:portfolio/apps/california/data/lodge.dart';
import 'package:portfolio/apps/california/data/rental.dart';
import 'package:portfolio/apps/california/data/spot.dart';

class Park {
  final String name;
  final String description;
  final String image;
  final LinearGradient background;
  final List<Spot> spots;
  final List<Lodge> lodges;
  final List<Hike> hikes;
  final List<Gift> gifts;
  final List<Rental> rentals;

  Park(
      {String name,
      String description,
      String image,
      LinearGradient background,
      List<Spot> spots,
      List<Lodge> lodges,
      List<Hike> hikes,
      List<Gift> gifts,
      List<Rental> rentals})
      : this.name = name ?? '',
        this.description = description ?? '',
        this.image = image ?? '',
        this.background = background ??
            LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
        this.spots = spots ?? List<Spot>(),
        this.lodges = lodges ?? List<Lodge>(),
        this.hikes = hikes ?? List<Hike>(),
        this.gifts = gifts ?? List<Gift>(),
        this.rentals = rentals ?? List<Rental>();
}
