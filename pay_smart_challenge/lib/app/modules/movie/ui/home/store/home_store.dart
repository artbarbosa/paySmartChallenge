import 'package:mobx/mobx.dart';
import '../../../errors/movie_failures.dart';
import '../../../model/genres_movies_model.dart';
import '../../../model/movie_model.dart';
import '../../../stores/genres_movie_store.dart';
import '../../../stores/movies_up_comming_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final MovieUpCommingStore movieUpCommingStore;
  final GenresMovieStore genresMovieStore;

  _HomeStoreBase({
    required this.genresMovieStore,
    required this.movieUpCommingStore,
  }) {
    _setIsHasError();
    _setError();
    _setIsLoading();
    fetchGenresMovies();
    fetchMoviesUpComming();
  }

  @observable
  List<MovieModel> _listMovieUpComming = [];

  @observable
  List<MovieModel> _listMovieUpCommingSeachCopy = [];

  @observable
  List<GenresMoviesModel> _listGenresMovie = [];

  @observable
  bool _isLoading = false;

  @observable
  bool _hasError = false;

  @observable
  String _error = '';

  @computed
  List<MovieModel> get listMovieUpComming => _listMovieUpComming;

  @computed
  List<GenresMoviesModel> get listGenresMovie => _listGenresMovie;

  @computed
  bool get hasError => _hasError;

  @computed
  bool get isLoading => _isLoading;

  @computed
  String get error => _error;

  @action
  Future<void> _setlistMovieUpComming(
          List<MovieModel> listMovieUpComming) async =>
      _listMovieUpComming = listMovieUpComming;

  @action
  Future<void> _setlistMovieUpCommingSeachCopy(
          List<MovieModel> listMovieUpComming) async =>
      _listMovieUpCommingSeachCopy = listMovieUpComming;

  @action
 Future<void> _setlistGenreMovies(List<GenresMoviesModel> listGenreMovies) async =>
      _listGenresMovie =  listGenreMovies;

  @action
  void _setError() => _error = movieUpCommingStore.error;

  @action
  void _setIsHasError() => _hasError = movieUpCommingStore.hasError;

  @action
  void _setIsLoading({bool value = false}) => _isLoading = value;

  @action
  void searchMoviesUpComming(String value) {
    _listMovieUpComming = _listMovieUpCommingSeachCopy
        .where((e) =>
            e.title.toString().toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  @action
  Future<void> fetchGenresMovies() async {
    try {
      _setIsLoading(value: true);
      var result = await genresMovieStore.fetchAllGenresMovies();
      _setIsHasError();
      _setError();
      await _setlistGenreMovies(result);
      _setIsLoading(value: false);
    } on NoDataFound catch (e) {
      _setIsLoading(value: false);
      _hasError = true;
      _error = e.errorMessage;
    }
  }

  @action
  Future<void> fetchMoviesUpComming() async {
    try {
      _setIsLoading(value: true);
      var result = await movieUpCommingStore.fetchMoviesUpComming();
      _setIsHasError();
      _setError();
      await _setlistMovieUpComming(result);
      await _setlistMovieUpCommingSeachCopy(result);
      _setIsLoading(value: false);
    } on NoDataFound catch (e) {
      _setIsLoading(value: false);
      _hasError = true;
      _error = e.errorMessage;
    }
  }

  List<String> fetchGenreById(List<dynamic> listGenreId) {
    List<String> listGenreName = [];
    for (var id in listGenreId) {
      String genreName = '';
      for (var element in _listGenresMovie) {
        if (element.id == id) {
          genreName = element.name;
          listGenreName.add(genreName);
        }
      }
    }
    return listGenreName;
  }
}
