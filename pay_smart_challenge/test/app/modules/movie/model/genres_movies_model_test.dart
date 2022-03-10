import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/genres_movies_model.dart';

void main() {
  final file = File('test/app/modules/movie/model/genres_movies.json')
      .readAsStringSync();

  final genresMoviesModel = GenresMoviesModel(
    id: 28,
    name: 'Ação',
  );

  group('Genres Movies Model', () {
    test('Should return a GenresMoviesModel ', () {
      final result = GenresMoviesModel.fromJson(jsonDecode(file));

      expect(result, isA<GenresMoviesModel>());
      expect(result.id, 28);
      expect(result.name, 'Ação');
    });

    test('Should return a Map<String, dynamic>', () {
      final result = genresMoviesModel.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result['id'], 28);
      expect(result['name'], 'Ação');
    });
  });
}

// {
//     "id": 28,
//     "name": "Ação"
// }