import 'package:flutter_web/material.dart';
import 'package:portfolio/apps/string/containers/brand.dart';
import 'package:portfolio/apps/string/containers/lightning.dart';
import 'package:portfolio/apps/string/data/guitar.dart';
import 'package:portfolio/data/random.dart';
import 'package:portfolio/theme.dart';

class GuitarModal extends StatefulWidget {
  final Guitar guitar;

  GuitarModal({Key key, this.guitar}) : super(key: key);

  _GuitarModalState createState() => _GuitarModalState();
}

class _GuitarModalState extends State<GuitarModal> {
  List<String> vowels = ['a', 'e', 'i', 'o', 'u', 'y'];
  final leadingStyle = TextStyle(fontSize: 32, fontFamily: 'Zcool');

  @override
  Widget build(BuildContext context) {
    return LightningWrapper(
      child: Container(
        color: Theme.of(context).canvasColor.withOpacity(0.95),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Specs',
              style: TextStyle(fontFamily: 'BungeeShade', fontSize: 32),
            ),
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: ListView(
            children: [
              ListTile(
                leading: Text(
                  'Fi',
                  style: leadingStyle,
                ),
                title: Text('${widget.guitar.specs.finish} finish'),
                subtitle: Text(
                    '${capitalize(prefix(RandomData.adjective))} finish for ${RandomData.adjective.toLowerCase()} guitarists.'),
              ),
              ListTile(
                leading: Text(
                  'Bo',
                  style: leadingStyle,
                ),
                title: Text('${widget.guitar.specs.material} body'),
                subtitle: Text(
                    'Not your typical, ${RandomData.adjective.toLowerCase()} body.'),
              ),
              ListTile(
                leading: Text(
                  'Fr',
                  style: leadingStyle,
                ),
                title: Text('${widget.guitar.specs.fretboard} fretboard'),
                subtitle: Text(
                    '${capitalize(prefix(RandomData.adjective))} fretboard for ${RandomData.adjective.toLowerCase()} guitarists.'),
              ),
              ListTile(
                leading: Text(
                  'Ne',
                  style: leadingStyle,
                ),
                title: Text('${widget.guitar.specs.neck} neck'),
                subtitle: Text(
                    '${capitalize(RandomData.adjective)} rock \'n\' rollers love this one!'),
              ),
              ListTile(
                leading: Text(
                  'Pi',
                  style: leadingStyle,
                ),
                title: Text(widget.guitar.specs.pickups),
                subtitle:
                    Text('${capitalize(RandomData.adjective)} pickups dude.'),
              ),
              ListTile(
                leading: Text(
                  'Pr',
                  style: leadingStyle,
                ),
                title: Text('${widget.guitar.specs.profile} neck profile'),
                subtitle: Text(
                    '"${capitalize(RandomData.greeting)}, that profile is so ${RandomData.adjective.toLowerCase()}!"'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: BrandBlock()
              )
            ],
          ),
        ),
      ),
    );
  }

  String capitalize(String s) => '${s[0].toUpperCase()}${s.substring(1)}';

  String prefix(String s) => '${isVowel(s[0]) ? 'an' : 'a'} $s';

  bool isVowel(String s) => vowels.contains(s.toLowerCase());
}
