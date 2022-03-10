import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_smart_challenge/app/core/services/remote/dio_http_client_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/errors/movie_failures.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/details_movies_up_comming_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/genres_movies_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/movie_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/repository/movie_repository_imp.dart';

class DioMock extends Mock implements Dio {}

class DioHttpServiceMock extends Mock implements DioHttpServiceImp {}

void main() async {
  late DioHttpServiceImp diohttpService;
  late MovieRepositoryImp repositoryImp;

  setUpAll(() {
    diohttpService = DioHttpServiceImp(DioMock());
    repositoryImp = MovieRepositoryImp(httpService: diohttpService);
  });

  group('MovieRepositoryImp - Get Movies Up Comming', () {
    test('Should return a list of Movies', () async {
      when(() => diohttpService.get(any())).thenAnswer((_) async => Response(
          data: _responseJsonMovies, requestOptions: RequestOptions(path: '')));

      var result = await repositoryImp.getMoviesUpComming(3);

      expect(result, isA<List<MovieModel>>());
      expect(result.length, 2);
    });
    test(
        'Should Throw Dio Erro type connectTimeout Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.connectTimeout,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getMoviesUpComming(3),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });
    test(
        'Should Throw Dio Erro type receiveTimeout Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.receiveTimeout,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getMoviesUpComming(3),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });

    test(
        'Should Throw Dio Erro type other Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.other,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getMoviesUpComming(3),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });
  });
  group('MovieRepositoryImp - Get Details Movies Up Comming', () {
    test('Should return a list of Details Movies', () async {
      when(() => diohttpService.get(any())).thenAnswer((_) async => Response(
          data: _responseJsonMovies, requestOptions: RequestOptions(path: '')));

      var result = await repositoryImp.getDetailsMoviesUpComming();

      expect(result, isA<DetailsMoviesUpCommingModel>());
      expect(result.totalPages, 23);
      expect(result.totalResults, 443);
    });
    test(
        'Should Throw Dio Erro type connectTimeout Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.connectTimeout,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getDetailsMoviesUpComming(),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });
    test(
        'Should Throw Dio Erro type receiveTimeout Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.receiveTimeout,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getDetailsMoviesUpComming(),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });

    test(
        'Should Throw Dio Erro type other Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.other,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getDetailsMoviesUpComming(),
          throwsA(isA<MovieUpComingNoInternetConnection>()));
    });
  });

  group('MovieRepositoryImp - Get All Movies Genres', () {
    test('Should return a list of Details Movies', () async {
      when(() => diohttpService.get(any())).thenAnswer((_) async => Response(
          data: _responseJsonGenres, requestOptions: RequestOptions(path: '')));

      var result = await repositoryImp.getAllMoviesGenres();

      expect(result, isA<List<GenresMoviesModel>>());
      expect(result.length, 3);
    });
    test(
        'Should Throw Dio Erro type connectTimeout Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.connectTimeout,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getAllMoviesGenres(),
          throwsA(isA<MovieGenresNoInternetConnection>()));
    });
    test(
        'Should Throw Dio Erro type receiveTimeout Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.receiveTimeout,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getAllMoviesGenres(),
          throwsA(isA<MovieGenresNoInternetConnection>()));
    });

    test(
        'Should Throw Dio Erro type other Movie Up Coming No Internet Connection ',
        () async {
      when(() => diohttpService.get(any())).thenThrow(
        DioError(
          error: DioErrorType.other,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      expect(() async => await repositoryImp.getAllMoviesGenres(),
          throwsA(isA<MovieGenresNoInternetConnection>()));
    });
  });
}

Map<String, dynamic> _responseJsonMovies = {
  "dates": {"maximum": "2022-04-01", "minimum": "2022-03-07"},
  "page": 3,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/yGlUHuSUdsfy5GYxW42w95RpIms.jpg",
      "genre_ids": [18],
      "id": 670981,
      "original_language": "es",
      "original_title": "Noche de fuego",
      "overview":
          "In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.",
      "popularity": 38.082,
      "poster_path": "/kb0IrVB4bDzBilRNpDv1OPMCs3u.jpg",
      "release_date": "2021-09-16",
      "title": "Prayers for the Stolen",
      "video": false,
      "vote_average": 8.1,
      "vote_count": 53
    },
    {
      "adult": false,
      "backdrop_path": "/ik9SVGcYxKg6y2a9cW0e0WchImW.jpg",
      "genre_ids": [28, 12, 18],
      "id": 639933,
      "original_language": "en",
      "original_title": "The Northman",
      "overview":
          "A young Viking prince embarks on a quest to avenge his father’s murder.",
      "popularity": 36.793,
      "poster_path": "/uTu1bsfDWtV1EA4DR43HdFtNQbd.jpg",
      "release_date": "2022-03-31",
      "title": "The Northman",
      "video": false,
      "vote_average": 0,
      "vote_count": 0
    },
  ],
  "total_pages": 23,
  "total_results": 443
};

Map<String, dynamic> _responseJsonGenres = {
  "genres": [
    {"id": 28, "name": "Ação"},
    {"id": 12, "name": "Aventura"},
    {"id": 16, "name": "Animação"},
  ]
};
