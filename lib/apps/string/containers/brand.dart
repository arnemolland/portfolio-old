import 'package:flutter_web/material.dart';

class BrandBlock extends StatelessWidget {
  const BrandBlock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Brought to you by\n',
            style: TextStyle(
              fontFamily: 'MetalMania',
              fontSize: 14,
              color:
                  Theme.of(context).textTheme.display1.color.withOpacity(0.6),
            ),
          ),
          TextSpan(
            text: 'String & Co.',
            style: TextStyle(fontSize: 32, fontFamily: 'BungeeInline'),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
