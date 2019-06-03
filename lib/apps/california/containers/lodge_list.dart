import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/california/data/park.dart';
import 'package:portfolio/apps/california/data/random.dart';
import 'package:portfolio/theme.dart';

class LodgeList extends StatelessWidget {
  final Park park;
  final bool scrollable;

  LodgeList(this.park, {this.scrollable});

  @override
  Widget build(BuildContext context) {
    final iconStyle = TextStyle(
      fontFamily: 'FeatherIcons',
      color: Colors.black38,
    );

    return ListView.separated(
      physics:
          scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
      itemCount: park.lodges.length,
      itemBuilder: (context, index) {
        final lodge = park.lodges[index];
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
                title:
                    Text(
                      lodge.name,
                      style: TextStyle(
                        fontSize: Molland.adaptiveFontSize(context, 20, 18, 16),
                        fontFamily: 'BreeSerif',
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
              subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.black45,
                          size: Molland.adaptiveFontSize(context, 14, 12, 10),
                        ),
                        Text(
                          ' ${lodge.rating.toString().substring(0, 3)}',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize:
                                Molland.adaptiveFontSize(context, 14, 12, 10),
                          ),
                        )
                      ],
                    ),

              ),
              Container(
                width: double.infinity,
                child: Image.network(
                  lodge.image,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.all(10),
                subtitle: Text(
                  lodge.description,
                  style: TextStyle(
                    fontSize: Molland.adaptiveFontSize(context, 14, 12, 10),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\ue954 ',
                          style: iconStyle,
                        ),
                        Text(
                          '${lodge.price}',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize:
                                Molland.adaptiveFontSize(context, 16, 14, 12),
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                      child: Text(
                        'BOOK NOW',
                        style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.7),
                          fontSize:
                              Molland.adaptiveFontSize(context, 16, 14, 12),
                        ),
                      ),
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Theme.of(context).primaryColor,
                            content: Text(
                              'Fully booked 😫',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
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
