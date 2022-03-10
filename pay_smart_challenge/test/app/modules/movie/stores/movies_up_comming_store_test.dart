import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_smart_challenge/app/core/error/failure.dart';
import 'package:pay_smart_challenge/app/modules/movie/errors/movie_failures.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/details_movies_up_comming_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/movie_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/repository/movie_repository_interface.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/movies_cache_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/stores/movies_up_comming_store.dart';

class MoviesCacheServiceMock extends Mock implements MoviesCacheService {}

class NoDataFoundMock extends Mock implements NoDataFound {}

class MovieRepositoryMock extends Mock implements IMovieRepository {}

void main() {
  late MovieUpCommingStore store;
  late MoviesCacheServiceMock cache;
  late MovieRepositoryMock repository;

  final List<MovieModel> listMovies = [
    MovieModel(
      adult: false,
      genreIds: [18],
      id: 670981,
      originalLanguage: 'es',
      originalTitle: 'Noche de fuego',
      overview:
          "In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.",
      popularity: 38.082,
      releaseDate: '2021-09-16',
      title: 'Prayers for the Stolen',
      video: false,
      voteAverage: 8.1,
      voteCount: 53,
      backdropPath: 'yGlUHuSUdsfy5GYxW42w95RpIms',
      posterPath: '/kb0IrVB4bDzBilRNpDv1OPMCs3u.jpg',
    )
  ];

  final detail = DetailsMoviesUpCommingModel(
    totalPages: 23,
    totalResults: 443,
  );

  setUpAll(() {
    cache = MoviesCacheServiceMock();
    repository = MovieRepositoryMock();
    store = MovieUpCommingStore(
      cache: cache,
      repository: repository,
    );
  });

  group('MovieStore - fetchMoviesUpComming', () {
    test('Should return List MoviesModel', () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenAnswer((_) async => detail);
      when(() => repository.getMoviesUpComming(any()))
          .thenAnswer((_) async => listMovies);

      final result = await store.fetchMoviesUpComming();

      expect(result, isA<List<MovieModel>>());
      expect(store.listMoviesUpComming, isA<List<MovieModel>>());
      expect(store.listMoviesUpComming, result);
    });

    test(
        'Should throws cache List MoviesModel - MovieUpComingNoInternetConnection',
        () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => cache.getInCache(any())).thenAnswer((_) async => listMovies);

      final result = await store.fetchMoviesUpComming();

      expect(result, isA<List<MovieModel>>());
    });
    test('Should throws cache List MoviesModel - MovieUpComingError', () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieUpComingError(
        errorMessage: '',
        exception: '',
        label: '',
      ));
      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieUpComingError(
        errorMessage: '',
        exception: '',
        label: '',
      ));

      when(() => cache.getInCache(any())).thenAnswer((_) async => listMovies);

      final result = await store.fetchMoviesUpComming();

      expect(result, isA<List<MovieModel>>());
    });

    test('Should throws cache List MoviesModel - NoDataFound', () async {
      when(() => repository.getDetailsMoviesUpComming())
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => repository.getMoviesUpComming(any()))
          .thenThrow(MovieUpComingNoInternetConnection());

      when(() => cache.getInCache(any())).thenThrow(NoDataFound());

      expect(() async => await store.fetchMoviesUpComming(),
          throwsA(isA<NoDataFound>()));
    });
  });
}
