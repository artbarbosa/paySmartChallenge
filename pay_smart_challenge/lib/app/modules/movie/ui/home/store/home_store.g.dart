// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<List<MovieModel>>? _$listMovieUpCommingComputed;

  @override
  List<MovieModel> get listMovieUpComming => (_$listMovieUpCommingComputed ??=
          Computed<List<MovieModel>>(() => super.listMovieUpComming,
              name: '_HomeStoreBase.listMovieUpComming'))
      .value;
  Computed<List<GenresMoviesModel>>? _$listGenresMovieComputed;

  @override
  List<GenresMoviesModel> get listGenresMovie => (_$listGenresMovieComputed ??=
          Computed<List<GenresMoviesModel>>(() => super.listGenresMovie,
              name: '_HomeStoreBase.listGenresMovie'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_HomeStoreBase.hasError'))
      .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeStoreBase.isLoading'))
          .value;
  Computed<String>? _$errorComputed;

  @override
  String get error => (_$errorComputed ??=
          Computed<String>(() => super.error, name: '_HomeStoreBase.error'))
      .value;

  final _$_listMovieUpCommingAtom =
      Atom(name: '_HomeStoreBase._listMovieUpComming');

  @override
  List<MovieModel> get _listMovieUpComming {
    _$_listMovieUpCommingAtom.reportRead();
    return super._listMovieUpComming;
  }

  @override
  set _listMovieUpComming(List<MovieModel> value) {
    _$_listMovieUpCommingAtom.reportWrite(value, super._listMovieUpComming, () {
      super._listMovieUpComming = value;
    });
  }

  final _$_listMovieUpCommingSeachCopyAtom =
      Atom(name: '_HomeStoreBase._listMovieUpCommingSeachCopy');

  @override
  List<MovieModel> get _listMovieUpCommingSeachCopy {
    _$_listMovieUpCommingSeachCopyAtom.reportRead();
    return super._listMovieUpCommingSeachCopy;
  }

  @override
  set _listMovieUpCommingSeachCopy(List<MovieModel> value) {
    _$_listMovieUpCommingSeachCopyAtom
        .reportWrite(value, super._listMovieUpCommingSeachCopy, () {
      super._listMovieUpCommingSeachCopy = value;
    });
  }

  final _$_listGenresMovieAtom = Atom(name: '_HomeStoreBase._listGenresMovie');

  @override
  List<GenresMoviesModel> get _listGenresMovie {
    _$_listGenresMovieAtom.reportRead();
    return super._listGenresMovie;
  }

  @override
  set _listGenresMovie(List<GenresMoviesModel> value) {
    _$_listGenresMovieAtom.reportWrite(value, super._listGenresMovie, () {
      super._listGenresMovie = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_HomeStoreBase._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_hasErrorAtom = Atom(name: '_HomeStoreBase._hasError');

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  final _$_errorAtom = Atom(name: '_HomeStoreBase._error');

  @override
  String get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(String value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  final _$_setlistMovieUpCommingAsyncAction =
      AsyncAction('_HomeStoreBase._setlistMovieUpComming');

  @override
  Future<void> _setlistMovieUpComming(List<MovieModel> listMovieUpComming) {
    return _$_setlistMovieUpCommingAsyncAction
        .run(() => super._setlistMovieUpComming(listMovieUpComming));
  }

  final _$_setlistMovieUpCommingSeachCopyAsyncAction =
      AsyncAction('_HomeStoreBase._setlistMovieUpCommingSeachCopy');

  @override
  Future<void> _setlistMovieUpCommingSeachCopy(
      List<MovieModel> listMovieUpComming) {
    return _$_setlistMovieUpCommingSeachCopyAsyncAction
        .run(() => super._setlistMovieUpCommingSeachCopy(listMovieUpComming));
  }

  final _$_setlistGenreMoviesAsyncAction =
      AsyncAction('_HomeStoreBase._setlistGenreMovies');

  @override
  Future<void> _setlistGenreMovies(List<GenresMoviesModel> listGenreMovies) {
    return _$_setlistGenreMoviesAsyncAction
        .run(() => super._setlistGenreMovies(listGenreMovies));
  }

  final _$fetchGenresMoviesAsyncAction =
      AsyncAction('_HomeStoreBase.fetchGenresMovies');

  @override
  Future<void> fetchGenresMovies() {
    return _$fetchGenresMoviesAsyncAction.run(() => super.fetchGenresMovies());
  }

  final _$fetchMoviesUpCommingAsyncAction =
      AsyncAction('_HomeStoreBase.fetchMoviesUpComming');

  @override
  Future<void> fetchMoviesUpComming() {
    return _$fetchMoviesUpCommingAsyncAction
        .run(() => super.fetchMoviesUpComming());
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void _setError() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase._setError');
    try {
      return super._setError();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setIsHasError() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase._setIsHasError');
    try {
      return super._setIsHasError();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setIsLoading({bool value = false}) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase._setIsLoading');
    try {
      return super._setIsLoading(value: value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchMoviesUpComming(String value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.searchMoviesUpComming');
    try {
      return super.searchMoviesUpComming(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listMovieUpComming: ${listMovieUpComming},
listGenresMovie: ${listGenresMovie},
hasError: ${hasError},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
