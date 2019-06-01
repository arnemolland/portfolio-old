import 'dart:math';

class PerlinNoise {
  int _octaves;
  double _persistence;
  Map<int, Map<int, Map<int, double>>> _noises = {};
  final _rand = new Random();

  PerlinNoise({int octaves: 1, double persistence:1.0}) :
    _octaves = octaves,
    _persistence = persistence;

  double _noise(int i, int x, int y) =>
      _noises.putIfAbsent(i, () => {})
        .putIfAbsent(x, () => {})
          .putIfAbsent(y, () => 2 * _rand.nextDouble() - 1);

  double _smoothNoise (int i, int x, int y) {
    double corners = (_noise(i, x - 1, y - 1) +
                      _noise(i, x + 1, y - 1) +
                      _noise(i, x - 1, y + 1) +
                      _noise(i, x + 1, y + 1)) / 16;
    double sides  = (_noise(i, x - 1, y    ) +
                     _noise(i, x + 1, y    ) +
                     _noise(i, x    , y - 1) +
                     _noise(i, x    , y + 1)) / 8;
    double center = _noise(i, x, y) / 4;
    return corners + sides + center;
  }

  double _interpolate (double a,double b,double x) {
    double ft = x * pi;
    double f = (1 - cos(ft)) * 0.5;
    return a * (1 - f) + b * f;
  }

  double _interpolatedNoise (int i, num x, num y) {
    int intX = x.floor();
    int intY = y.floor();

    double fracX = (x - intX).toDouble();
    double fracY = (y - intY).toDouble();

    double v1 = _smoothNoise(i, intX    , intY    );
    double v2 = _smoothNoise(i, intX + 1, intY    );
    double v3 = _smoothNoise(i, intX    , intY + 1);
    double v4 = _smoothNoise(i, intX + 1, intY + 1);

    double i1 = _interpolate(v1, v2, fracX);
    double i2 = _interpolate(v3, v4, fracX);

    return _interpolate(i1, i2, fracY);
  }

  double perlinNoise(num x, num y) {
    var total = 0.0;

    for (var i = 0; i < _octaves; i++) {
      int frequency = pow(2, i);
      double amplitude = pow(_persistence, i);

      total += _interpolatedNoise(i, x * frequency, y * frequency) * amplitude;
    }
    return total;
  }
}
