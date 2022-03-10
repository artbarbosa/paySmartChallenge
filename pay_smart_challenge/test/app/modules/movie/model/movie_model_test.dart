import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/movie_model.dart';

void main() {
  final file =
      File('test/app/modules/movie/model/movie.json').readAsStringSync();

  final movieModel = MovieModel(
    adult: false,
    genreIds: [18],
    id: 670981,
    originalLanguage: 'es',
    originalTitle: 'Noche de fuego',
    overview:
        'In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.',
    popularity: 38.082,
    releaseDate: '2021-09-16',
    title: 'Prayers for the Stolen',
    video: false,
    voteAverage: 8.1,
    voteCount: 53,
  );

  group('Movie Model', () {
    test('Should return a Movie Model ', () {
      final result = MovieModel.fromJson(jsonDecode(file));

      expect(result, isA<MovieModel>());
      expect(result.id, 670981);
      expect(result.title, "Prayers for the Stolen");
    });

    test('Should return a Map<String, dynamic>', () {
      final result = movieModel.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], 670981);
      expect(result['title'], "Prayers for the Stolen");
    });
  });
}
