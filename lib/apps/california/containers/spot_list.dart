import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/theme.dart';

class SpotList extends StatefulWidget {
  final Park park;
  final bool scrollable;
  SpotList(this.park, {this.scrollable});

  @override
  _SpotListState createState() => _SpotListState();
}

class _SpotListState extends State<SpotList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final iconStyle = TextStyle(
      fontFamily: 'FeatherIcons',
      color: Colors.black38,
    );

    return ListView.separated(
      physics: widget.scrollable
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: widget.park.spots.length,
      itemBuilder: (context, index) {
        final spot = widget.park.spots[index];
        // Workaround until BoxDecoration borders are working
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black.withOpacity(0.05)),
              bottom: BorderSide(color: Colors.black.withOpacity(0.05)),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      spot.name,
                      style: TextStyle(
                        fontSize: Molland.adaptiveFontSize(context, 20, 18, 16),
                        fontFamily: 'BreeSerif',
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black45,
                          size: Molland.adaptiveFontSize(context, 14, 12, 10),
                        ),
                        Text(
                          ' ${spot.rating.toString().substring(0, 3)}',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize:
                                Molland.adaptiveFontSize(context, 14, 12, 10),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                subtitle: Text(
                  spot.description,
                  style: TextStyle(
                    fontSize: Molland.adaptiveFontSize(context, 14, 12, 10),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: double.infinity,
                child: Image.network(
                  spot.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '\ue990 ',
                      style: iconStyle,
                    ),
                    Text(
                      '${Random().likes}',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: Molland.adaptiveFontSize(context, 16, 14, 12),
                      ),
                    ),
                    SizedBox(
                      width: 12.5,
                    ),
                    Text(
                      '\ue977 ',
                      style: iconStyle,
                    ),
                    Text(
                      '${Random().likes}',
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
