import 'dart:math';

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

class RandomData {
  static get font {
    return fonts[Random().nextInt(fonts.length)];
  }
}
