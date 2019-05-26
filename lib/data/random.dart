import 'dart:math';

import 'package:english_words/english_words.dart';

const fonts = [
  'Barcode',
  'BungeeInline',
  'BungeeShade',
  'CaesarDressing',
  'FasterOne',
  'Frijole',
  'Zcool',
  'Fascinate',
  'Geostar',
  'MetalMania',
  'Sancreek',
  'Warnes'
];

const greetings = [
  'man',
  'yo',
  'bro',
  'dude',
  'yeehaw',
  'dang',
  'whaat',
  's#!t',
  'broo',
  'howdy'
];

class RandomData {
  static get font {
    return fonts[Random().nextInt(fonts.length)];
  }

  static get fontReadable {
    return fonts
        .where((font) => font != 'Barcode')
        .toList()[Random().nextInt(fonts.length - 1)];
  }

  static get adjective {
    return adjectives[Random().nextInt(adjectives.length - 1)];
  }

  static get greeting {
    return greetings[Random().nextInt(greetings.length - 1)];
  }
}
