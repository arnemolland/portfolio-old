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

  static get fontReadable {
    return fonts.where((font) => font != 'Barcode').toList()[Random().nextInt(fonts.length-1)];
  }
}
