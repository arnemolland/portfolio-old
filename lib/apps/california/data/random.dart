import 'package:english_words/english_words.dart';
import 'dart:math' as math;
import 'package:portfolio/apps/california/data/comment.dart';

class Random {
  final _random = math.Random();

  get commentList {
    List<Comment> list;
    for (int i = 0; i < _random.nextInt(100); i++) {
      list.add(
        Comment(
            commentator: '${WordPair.random().asPascalCase}',
            comment:
                '${adjectives[_random.nextInt(adjectives.length)]} and ${adjectives[_random.nextInt(adjectives.length)]}${DateTime.now().microsecond.isEven ? '!' : '.'}',
            date:
                DateTime.now().subtract(Duration(days: _random.nextInt(3650))),
            image: image),
      );
    }
  }

  get likes => _random.nextInt(600);

  get rating => _random.nextDouble().clamp(0.5, 1.0) * 5;

  get image => 'https://picsum.photos/1000';

  get time => '${_random.nextInt(24)}h ${_random.nextInt(60)}m';
}
