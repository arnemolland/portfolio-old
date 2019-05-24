import 'dart:convert';

import 'package:http/http.dart';

class SpaceX {
  static const String endpoint = 'https://api.spacexdata.com/v3';
  SpaceX();

  Future<Map<String, dynamic>> latestLaunch() async {
    final response = await get('$endpoint/launches/latest');
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> nextLaunch() async {
    final response = await get ('$endpoint/launches/next');
    return jsonDecode(response.body);
  }

  Future<Duration> nextLaunchCountdown() async {
    final response = await get ('$endpoint/launches/next');
    final data = jsonDecode(response.body);
    final utc = data['launch_date_utc'];
    final date = DateTime.parse(utc);
    return DateTime.now().difference(date).abs();
  }
}