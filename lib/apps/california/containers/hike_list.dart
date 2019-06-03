import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/theme.dart';

class HikeList extends StatelessWidget {
  final bool scrollable;
  final Park park;

  HikeList(this.park, {this.scrollable});
  @override
  Widget build(BuildContext context) {
    final iconStyle = TextStyle(
      fontFamily: 'FeatherIcons',
      color: Colors.black38,
    );

    return ListView.separated(
      physics:
          scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
      itemCount: park.hikes.length,
      itemBuilder: (context, index) {
        final hike = park.hikes[index];
        // Workaround until BoxDecoration borders are working
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.black.withOpacity(0.05),
              ),
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  hike.name,
                  style: TextStyle(
                    fontSize: Molland.adaptiveFontSize(context, 20, 18, 16),
                    fontFamily: 'BreeSerif',
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.map,
                      color: Colors.black45,
                      size: Molland.adaptiveFontSize(context, 14, 12, 10),
                    ),
                    Text(
                      ' ${hike.length}km, ~${(hike.length ~/ 4.82)} hours',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: Molland.adaptiveFontSize(context, 14, 12, 10),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Image.network(
                  hike.image,
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                subtitle: Text(
                  hike.description,
                  style: TextStyle(
                    fontSize: Molland.adaptiveFontSize(context, 14, 12, 10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '\ue957 ',
                      style: iconStyle,
                    ),
                    Text(
                      '${hike.difficulty.toString().substring(11)}',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: Molland.adaptiveFontSize(context, 16, 14, 12),
                      ),
                    ),
                    SizedBox(
                      width: 12.5,
                    ),
                    Text(
                      '\ue939 ',
                      style: iconStyle,
                    ),
                    Text(
                      ' ${(hike.length / 4.82).toStringAsFixed(2)} hours',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: Molland.adaptiveFontSize(context, 16, 14, 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        // Workaround for BoxDecoration borders not working properly
        return Container(
          width: double.infinity,
          height: 16,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.05),
              ),
            ),
            color: Theme.of(context).canvasColor,
          ),
        );
      },
    );
  }
}
