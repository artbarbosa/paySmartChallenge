import '../errors/movie_failures.dart';
import '../model/details_movies_up_comming_model.dart';
import '../model/movie_model.dart';
import '../repository/movie_repository_interface.dart';
import '../services/local/movies_cache_service.dart';
import 'package:mobx/mobx.dart';

part 'movies_up_comming_store.g.dart';

class MovieUpCommingStore = _MovieUpCommingStoreBase with _$MovieUpCommingStore;

abstract class _MovieUpCommingStoreBase with Store {
  final IMovieRepository repository;
  final MoviesCacheService cache;

  _MovieUpCommingStoreBase({required this.repository, required this.cache});

  @observable
  List<MovieModel> listMoviesUpComming = [];

  @observable
  String _error = '';

  @observable
  bool _hasError = false;

  @computed
  bool get hasError => _hasError;

  @computed
  String get error => _error;

  @action
  void _saveAllMoviesUpComming() =>
      cache.saveInCache('movies_up_comming', listMoviesUpComming);

  @action
  void _removeAllMoviesUpComming() => cache.removeInCache('movies_up_comming');

  @action
  Future<DetailsMoviesUpCommingModel> _getDetailsMoviesUpComming() async =>
      await repository.getDetailsMoviesUpComming();

  @action
  Future<void> _getAllMoviesUpComming() async {
    try {
      var _detailsMoviesUpComming = await _getDetailsMoviesUpComming();
      for (var page = 1; page <= _detailsMoviesUpComming.totalPages; page++) {
        final result = await repository.getMoviesUpComming(page);
        listMoviesUpComming.addAll(result);
      }
    } on MovieUpComingError catch (e) {
      _hasError = true;
      _error = e.errorMessage;
    } on MovieUpComingNoInternetConnection catch (e) {
      _hasError = true;
      _error = e.errorMessage;
    }
  }

  @action
  Future<List<MovieModel>> fetchMoviesUpComming() async {
    try {
      await _getAllMoviesUpComming();
      if (_hasError == true) {
        final listLocalStorage = await cache.getInCache('movies_up_comming');
        _hasError = false;
        return listLocalStorage as List<MovieModel>;
      }
      _removeAllMoviesUpComming();
      _saveAllMoviesUpComming();
      return listMoviesUpComming;
    } on NoDataFound catch (e) {
      _hasError = true;
      _error = e.errorMessage;
      rethrow;
    }
  }
}
