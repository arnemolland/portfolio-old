import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/main.dart';
import 'package:portfolio/containers/phone.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/painters/phone_painter.dart';

class HeroView extends StatefulWidget {
  HeroView({Key key}) : super(key: key);

  _HeroViewState createState() => _HeroViewState();
}

class _HeroViewState extends State<HeroView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100,
        bottom: 50,
      ),
      child: Center(
        child: AspectRatio(
          // iPhone X aspect ratio
          aspectRatio: 9 / 19.5,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              foregroundPainter: PhonePainter(
                strokeWidth: 10,
                color: AppStateContainer.of(context).state.isLightMode
                    ? Colors.black
                    : Colors.white,
              ),
              child: Padding(
                // Add padding when frame is drawn
                padding: const EdgeInsets.all(0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if(constraints.maxWidth < 175) {
                      return Wrapper.tooSmallView();
                    } else if (constraints.maxHeight < 175) {
                      return Wrapper.tooSmallView();
                    }
                    return PhoneView(
                      child: StringApp(),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
