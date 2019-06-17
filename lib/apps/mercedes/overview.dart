import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/mercedes/theme.dart';
import 'package:portfolio/containers/wrapper.dart';
import 'package:portfolio/theme.dart';

class Overview extends StatefulWidget {
  final VoidCallback onShowPressed;
  Overview({this.onShowPressed});

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    final subtitleStyle = TextStyle(
      fontSize: Molland.adaptiveFontSize(context, 11, 10, 9),
      color: Colors.black26,
    );
    final titleStyle = TextStyle(
      fontFamily: 'Margem',
      fontSize: Molland.adaptiveFontSize(context, 16, 14, 12),
      color: Colors.black87,
    );
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mercedes Benz',
                        style: TextStyle(letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Hero(
                        tag: 'eq__logo',
                        child: Image.asset(
                          'images/mercedes/eq.png',
                          height: Molland.adaptiveFontSize(context, 17.5, 15, 12.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(right: 32),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Hero(
                      tag: 'eq__hero',
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('images/mercedes/eq_front_full.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10,
                              bottom: 10,
                              top: Wrapper.isSmallScreen(context) ? 0 : 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 4,
                                child: ListTile(
                                  contentPadding: EdgeInsets.only(right: 50),
                                  title: Text.rich(
                                    TextSpan(
                                      text: 'Welcome to the \nworld of EQ',
                                    ),
                                    style: TextStyle(
                                      fontSize: Molland.adaptiveFontSize(
                                          context, 18, 16, 14),
                                      fontFamily: 'Margem',
                                      color: Colors.white,
                                    ),
                                  ),
                                  subtitle: Text.rich(
                                    TextSpan(
                                      text:
                                          'The future has come to a \nseries of events',
                                    ),
                                    style: TextStyle(
                                      fontSize: Molland.adaptiveFontSize(
                                          context, 14, 12, 10),
                                      color: Colors.white30,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.5),
                                  ),
                                  padding: EdgeInsets.zero,
                                  child: Text(
                                    'Show more',
                                    style: TextStyle(
                                      fontSize: Molland.adaptiveFontSize(
                                          context, 12, 10, 8),
                                      fontFamily: 'Margem',
                                      color: Colors.white,
                                    ),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  onPressed: () {
                                    widget.onShowPressed();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  //height: 50,
                  child: Center(
                    child: ListView(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: Molland.adaptiveFontSize(
                                      context, 40, 35, 30),
                                  width: Molland.adaptiveFontSize(
                                      context, 40, 35, 30),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: Mercedes.gradient,
                                  ),
                                ),
                                Text(
                                  '\uf7bf',
                                  style: TextStyle(
                                    fontFamily: 'FontAwesomeSolid',
                                    color: Colors.white,
                                    fontSize: Molland.adaptiveFontSize(
                                        context, 16, 14, 12),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Community',
                              style: TextStyle(
                                fontFamily: 'Margem',
                                fontSize: Molland.adaptiveFontSize(
                                    context, 12, 10, 8),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: Molland.adaptiveFontSize(
                                      context, 40, 35, 30),
                                  width: Molland.adaptiveFontSize(
                                      context, 40, 35, 30),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: Mercedes.gradient),
                                ),
                                Text(
                                  '\uf3ff',
                                  style: TextStyle(
                                    fontFamily: 'FontAwesomeSolid',
                                    color: Colors.white,
                                    fontSize: Molland.adaptiveFontSize(
                                        context, 16, 14, 12),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Activity',
                              style: TextStyle(
                                fontFamily: 'Margem',
                                fontSize: Molland.adaptiveFontSize(
                                    context, 12, 10, 8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, right: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 5),
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            spreadRadius: 2),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15, bottom: 5),
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              fontSize:
                                  Molland.adaptiveFontSize(context, 20, 18, 16),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 5),
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                height: Molland.adaptiveFontSize(
                                    context, 40, 35, 30),
                                width: Molland.adaptiveFontSize(
                                    context, 40, 35, 30),
                                child: Center(
                                  child: Image.asset(
                                    'images/mercedes/star.png',
                                    height: 12,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Wrap(
                                direction: Axis.vertical,
                                children: [
                                  Text(
                                    'EQ Official',
                                    style: titleStyle,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text:
                                          'Hi, this is EQ. I\'m from Mercedes-\nBenz. I\'m an electric car, but I\'m not\njust any electric car.',
                                    ),
                                    style: subtitleStyle,
                                    softWrap: true,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 1),
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                height: Molland.adaptiveFontSize(
                                    context, 40, 35, 30),
                                width: Molland.adaptiveFontSize(
                                    context, 40, 35, 30),
                                child: Center(
                                  child: Text(
                                    '\uf1b9',
                                    style: TextStyle(
                                      fontFamily: 'FontAwesomeSolid',
                                      color: Colors.black26,
                                      fontSize: Molland.adaptiveFontSize(
                                          context, 16, 14, 12),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Wrap(
                                direction: Axis.vertical,
                                children: [
                                  Text(
                                    'Supplier',
                                    style: titleStyle,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      text:
                                          'Mercedes EQ Series Vehicle\n Configuration Instructions will be\n released soon..',
                                    ),
                                    style: subtitleStyle,
                                    softWrap: true,
                                    maxLines: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
