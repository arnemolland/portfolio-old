import 'package:flutter_web/material.dart';
import 'package:portfolio/containers/state_container.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/painters/phone_painter.dart';

class PhoneView extends StatefulWidget {
  final Widget child;
  PhoneView({Key key, this.child}) : super(key: key);

  _PhoneViewState createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AspectRatio(
            // iPhone X aspect ratio
            aspectRatio: 9 / 19,
            child: Container(
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
                      if (constraints.maxWidth < 175) {
                        return Wrapper.tooSmallView();
                      } else if (constraints.maxHeight < 175) {
                        return Wrapper.tooSmallView();
                      }
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: widget.child,
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
