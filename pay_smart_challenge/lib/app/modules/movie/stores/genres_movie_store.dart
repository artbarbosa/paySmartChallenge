import '../errors/movie_failures.dart';
import '../model/genres_movies_model.dart';
import '../repository/movie_repository_interface.dart';
import '../services/local/genres_movies_cache_service.dart';
import 'package:mobx/mobx.dart';

part 'genres_movie_store.g.dart';

class GenresMovieStore = _GenresMovieStoreBase with _$GenresMovieStore;

abstract class _GenresMovieStoreBase with Store {
  final IMovieRepository repository;
  final GenreMoviesCacheService cache;

  _GenresMovieStoreBase({required this.repository, required this.cache});

  @observable
  List<GenresMoviesModel> listGenresMovies = [];

  @observable
  String _error = '';

  @observable
  bool _hasError = false;

  @computed
  bool get hasError => _hasError;

  @computed
  String get error => _error;

  @action
  void _saveAllGenresMovies() {
    cache.saveInCache('genres_movies', listGenresMovies);
  }

  @action
  void _removeAllGenresMovies() => cache.removeInCache('genres_movies');

  @action
  Future<void> _getAllGenresMovies() async {
    try {
      final result = await repository.getAllMoviesGenres();
      listGenresMovies = result;
    } on MovieGenresError catch (e) {
      _hasError = true;
      _error = e.errorMessage;
    } on MovieGenresNoInternetConnection catch (e) {
      _hasError = true;
      _error = e.errorMessage;
    }
  }

  @action
  Future<List<GenresMoviesModel>> fetchAllGenresMovies() async {
    try {
      await _getAllGenresMovies();
      if (_hasError == true) {
        final listLocalStorage = await cache.getInCache('genres_movies');
        _hasError = false;
        return listLocalStorage as List<GenresMoviesModel>;
      }
      _removeAllGenresMovies();
      _saveAllGenresMovies();
      return listGenresMovies;
    } on NoDataFound catch (e) {
      _hasError = true;
      _error = e.errorMessage;
      rethrow;
    }
  }
}
