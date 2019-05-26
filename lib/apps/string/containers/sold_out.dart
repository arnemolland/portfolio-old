import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/wrapper.dart';

class SoldOutView extends StatelessWidget {
  const SoldOutView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'OUT OF STOCK\n',
                style: TextStyle(
                  fontFamily: 'BungeeShade',
                  fontSize: Wrapper.isLargeScreen(context)
                      ? 64
                      : Wrapper.isMediumScreen(context) ? 32 : 20,
                ),
              ),
              TextSpan(
                text: 'Damn.\n Looks like we\'re sold out.',
                style: TextStyle(
                  fontFamily: 'BungeeInline',
                  fontSize: Wrapper.isLargeScreen(context)
                      ? 24
                      : Wrapper.isMediumScreen(context) ? 16 : 12,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
