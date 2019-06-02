import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';

class SpotsList extends StatefulWidget {
  final Park park;
  final bool scrollable;
  SpotsList(this.park, {this.scrollable});

  @override
  _SpotsListState createState() => _SpotsListState();
}

class _SpotsListState extends State<SpotsList> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: widget.scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
      itemCount: widget.park.spots.length,
      itemBuilder: (context, index) {
        final spot = widget.park.spots[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                spot.name,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'BreeSerif',
                  color: Colors.black,
                  letterSpacing: 1,
                ),
              ),
              subtitle: Text(spot.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.black26,
                  ),
                  Text('${spot.rating.truncateToDouble()}')
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: Image.network(
                Random().image,
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
