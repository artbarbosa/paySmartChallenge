import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_smart_challenge/app/modules/movie/errors/movie_failures.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/genres_movies_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/repository/movie_repository_interface.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/genres_movies_cache_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/stores/genres_movie_store.dart';

class GenresServiceMock extends Mock implements GenreMoviesCacheService {}

class NoDataFoundMock extends Mock implements NoDataFound {}

class MovieRepositoryMock extends Mock implements IMovieRepository {}

void main() {
  late GenresMovieStore store;
  late GenresServiceMock cache;
  late MovieRepositoryMock repository;

  final List<GenresMoviesModel> listGenres = [
    GenresMoviesModel(id: 23, name: 'Ação')
  ];

  setUpAll(() {
    cache = GenresServiceMock();
    repository = MovieRepositoryMock();
    store = GenresMovieStore(
      cache: cache,
      repository: repository,
    );
  });

  group('GenresStore - fetchAllGenresMovies', () {
    test('Should return List GenresMoviesModel', () async {
      when(() => repository.getAllMoviesGenres())
          .thenAnswer((_) async => listGenres);

      final result = await store.fetchAllGenresMovies();

      expect(result, isA<List<GenresMoviesModel>>());
      expect(
          store.fetchAllGenresMovies(), isA<Future<List<GenresMoviesModel>>>());
      expect(store.listGenresMovies, result);
    });

    test(
        'Should throws cache List GenresMoviesModel - MovieGenresNoInternetConnection',
        () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieGenresNoInternetConnection());

      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieGenresNoInternetConnection());

      when(() => cache.getInCache(any())).thenAnswer((_) async => listGenres);

      final result = await store.fetchAllGenresMovies();

      expect(result, isA<List<GenresMoviesModel>>());
    });
    test('Should throws cache List GenresMoviesModel - MovieGenresError',
        () async {
      when(() => repository.getAllMoviesGenres()).thenThrow(MovieGenresError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      when(() => cache.getInCache(any())).thenAnswer((_) async => listGenres);

      final result = await store.fetchAllGenresMovies();

      expect(result, isA<List<GenresMoviesModel>>());
    });

    test('Should throws cache List MoviesModel - NoDataFound', () async {
      when(() => repository.getAllMoviesGenres())
          .thenThrow(MovieGenresNoInternetConnection());

      when(() => cache.getInCache(any())).thenThrow(NoDataFound());

      expect(() async => await store.fetchAllGenresMovies(),
          throwsA(isA<NoDataFound>()));
    });
  });
}
