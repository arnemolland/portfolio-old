import 'dart:async';

import 'package:flutter_web/material.dart';
import 'package:portfolio/data/spacex.dart';

class SpaceXCountdown extends StatefulWidget {
  SpaceXCountdown({Key key}) : super(key: key);

  _SpaceXCountdownState createState() => _SpaceXCountdownState();
}

class _SpaceXCountdownState extends State<SpaceXCountdown> {
  Timer _launchTimer;
  int _countdown = 0;

  @override
  void dispose() {
    _launchTimer.cancel();
    super.dispose();
  }

  void _startCountdown(Duration countdown) {
    _countdown = countdown.inSeconds;
    const frequency = Duration(seconds: 1);
    _launchTimer = Timer.periodic(
        frequency, (timer) => setState(() => _countdown = _countdown - 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Duration>(
      future: SpaceX().nextLaunchCountdown(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (_launchTimer == null) {
            _startCountdown(snapshot.data);
          }
          return _countdownDisplay();
        } else if (_countdown != null && _launchTimer != null) {
          return _countdownDisplay();
        } else {
          return Text(
            'Connecting to SpaceX',
            style: TextStyle(color: Colors.white),
          );
        }
      },
    );
  }

  Widget _countdownDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/spacex.png', width: 250,),
        Text(
          'Seconds to next launch: ${_countdown}',
          style: TextStyle(color: Colors.white.withOpacity(0.4), fontSize: 32),
        ),
      ],
    );
  }
}
