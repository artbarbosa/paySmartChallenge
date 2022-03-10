import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/genres_movies_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/model/movie_model.dart';
import 'package:pay_smart_challenge/app/modules/movie/repository/movie_repository_interface.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/genres_movies_cache_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/movies_cache_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/stores/genres_movie_store.dart';
import 'package:pay_smart_challenge/app/modules/movie/stores/movies_up_comming_store.dart';
import 'package:pay_smart_challenge/app/modules/movie/ui/home/store/home_store.dart';

class MovieUpCommingStoreMock extends Mock implements MovieUpCommingStore{}

class GenresMovieStoreMock extends Mock implements GenresMovieStore{}

class MoviesCacheServiceMock extends Mock implements MoviesCacheService{}

class GenreMoviesCacheServiceMock extends Mock implements GenreMoviesCacheService {}

class IMovieRepositoryMock extends Mock implements IMovieRepository{}

void main() {
  late MovieUpCommingStoreMock movieUpCommingStore = MovieUpCommingStoreMock();
  late GenresMovieStoreMock genresMovieStore = GenresMovieStoreMock();
  late HomeStore store;

 final List<GenresMoviesModel> lisGenres = [
    GenresMoviesModel(
      id: 23,
      name: 'Açâo'
    )
  ];

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

  setUpAll(() {
    store = HomeStore(
      genresMovieStore: genresMovieStore,
      movieUpCommingStore: movieUpCommingStore,
    );


  });
  group('Home Store - fetchMoviesUpComming ', () {
    test('Should return List MoviesModel', () async {
      when(() => movieUpCommingStore.fetchMoviesUpComming())
          .thenAnswer((_) async => listMovies);
      await store.fetchMoviesUpComming();

      expect(store.listMovieUpComming, listMovies);
    });
  });
}
