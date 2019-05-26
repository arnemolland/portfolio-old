import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/containers/brand.dart';
import 'package:portfolio/apps/string/containers/dots.dart';
import 'package:portfolio/apps/string/containers/guitar_list.dart';
import 'package:portfolio/apps/string/containers/sold_out.dart';
import 'package:portfolio/apps/string/containers/zigzag.dart';
import 'package:portfolio/containers/wrapper.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _currentView;
  String _currentTitle;

  @override
  void initState() {
    super.initState();
    _currentView = GuitarList();
    _currentTitle = 'GUITARS';
  }

  @override
  Widget build(BuildContext context) {
    var drawerTitleStyle = TextStyle(
        fontSize: Wrapper.isLargeScreen(context)
            ? 32
            : Wrapper.isMediumScreen(context) ? 28 : 24,
        fontFamily: 'BungeeShade');
    var drawerSubtitleStyle = TextStyle(
        fontSize: Wrapper.isLargeScreen(context)
            ? 14
            : Wrapper.isMediumScreen(context) ? 12 : 10,
        fontFamily: 'BungeeInline');
    return DottedWrapper(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).canvasColor.withOpacity(0.9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            _currentTitle,
            style: TextStyle(fontSize: 14),
          ),
          centerTitle: true,
          leading: FlatButton(
            child: Text(
              '\uf0c9',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'FontAwesomeSolid',
                fontSize: 18,
              ),
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
        ),
        drawer: Drawer(
          child: ZigzagWrapper(
            child: Container(
              color: Theme.of(context).canvasColor.withOpacity(0.95),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.only(top: 50),
                      children: [
                        ListTile(
                          title: Text(
                            'Close',
                            style: TextStyle(
                              fontFamily: 'MetalMania',
                              fontSize: 32,
                            ),
                          ),
                          trailing: Text(
                            'x',
                            style: TextStyle(
                              fontFamily: 'MetalMania',
                              fontSize: 32,
                            ),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        ListTile(
                          title: Text('CART', style: drawerTitleStyle),
                          subtitle: Text('Your precious instruments-to-be',
                              style: drawerSubtitleStyle),
                          trailing: Icon(Icons.shopping_cart),
                        ),
                        ListTile(
                          title: Text(
                            'GUITARS',
                            style: drawerTitleStyle,
                          ),
                          subtitle: Text(
                            'If you like it, you should put a string on it',
                            style: drawerSubtitleStyle,
                          ),
                          onTap: () =>
                              setState(() => _currentView = GuitarList()),
                        ),
                        ListTile(
                          title: Text(
                            'BASSES',
                            style: drawerTitleStyle,
                          ),
                          subtitle: Text(
                            'Your band already have guitarists?',
                            style: drawerSubtitleStyle,
                          ),
                          onTap: () => setState(
                                () {
                                  _currentTitle = 'OH NO!';
                                  _currentView = SoldOutView();
                                },
                              ),
                        ),
                        ListTile(
                          title: Text(
                            'DRUMS',
                            style: drawerTitleStyle,
                          ),
                          subtitle: Text(
                            'And God said, let there be drummers',
                            style: drawerSubtitleStyle,
                          ),
                          onTap: () => setState(
                                () {
                                  _currentTitle = 'FRICK!';
                                  _currentView = SoldOutView();
                                },
                              ),
                        ),
                        ListTile(
                          title: Text(
                            'FLUTES',
                            style: drawerTitleStyle,
                          ),
                          subtitle: Text(
                            'Tone holes are like the infinity stones of music',
                            style: drawerSubtitleStyle,
                          ),
                          onTap: () => setState(
                                () {
                                  _currentTitle = 'HECK!';
                                  _currentView = SoldOutView();
                                },
                              ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 25),
                    child: BrandBlock(),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: _currentView,
      ),
    );
  }
}
