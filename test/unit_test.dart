import 'package:flutter_test/flutter_test.dart';
import 'package:myfavmovie/models/favourites.dart';

void main() {
  group('Testing Favoirite', () {
    var favourites = Favourits();
    test('New Item Should Be Added', () {
      var movie = "My Life";
      favourites.add(movie);
      expect(favourites.items.contains(movie), true);
      favourites.remove(movie);
      expect(favourites.items.contains(movie), false);
    });
  });
}
