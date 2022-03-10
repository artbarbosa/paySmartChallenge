import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/details_movies_up_comming_model.dart';

void main() {
  final file = File('test/app/modules/movie/model/details_movies.json')
      .readAsStringSync();

  final detailsMoviesUpCommingModel = DetailsMoviesUpCommingModel(
    totalPages: 23,
    totalResults: 443,
  );

  group('Details Movies Up Comming', () {
    test('Should return a DetailsMoviesUpComming ', () {
      final result = DetailsMoviesUpCommingModel.fromJson(jsonDecode(file));

      expect(result, isA<DetailsMoviesUpCommingModel>());
      expect(result.totalPages, 23);
      expect(result.totalResults, 443);
    });

    test('Should return a Map<String, dynamic>', () {
      final result = detailsMoviesUpCommingModel.toJson();

      expect(result, isA<Map<String, dynamic>>());
      expect(result['total_pages'], 23);
      expect(result['total_results'], 443);
    });
  });
}