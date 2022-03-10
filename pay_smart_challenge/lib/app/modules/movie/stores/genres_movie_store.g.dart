// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenresMovieStore on _GenresMovieStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_GenresMovieStoreBase.hasError'))
          .value;
  Computed<String>? _$errorComputed;

  @override
  String get error => (_$errorComputed ??= Computed<String>(() => super.error,
          name: '_GenresMovieStoreBase.error'))
      .value;

  final _$listGenresMoviesAtom =
      Atom(name: '_GenresMovieStoreBase.listGenresMovies');

  @override
  List<GenresMoviesModel> get listGenresMovies {
    _$listGenresMoviesAtom.reportRead();
    return super.listGenresMovies;
  }

  @override
  set listGenresMovies(List<GenresMoviesModel> value) {
    _$listGenresMoviesAtom.reportWrite(value, super.listGenresMovies, () {
      super.listGenresMovies = value;
    });
  }

  final _$_errorAtom = Atom(name: '_GenresMovieStoreBase._error');

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

  final _$_hasErrorAtom = Atom(name: '_GenresMovieStoreBase._hasError');

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

  final _$_getAllGenresMoviesAsyncAction =
      AsyncAction('_GenresMovieStoreBase._getAllGenresMovies');

  @override
  Future<void> _getAllGenresMovies() {
    return _$_getAllGenresMoviesAsyncAction
        .run(() => super._getAllGenresMovies());
  }

  final _$fetchAllGenresMoviesAsyncAction =
      AsyncAction('_GenresMovieStoreBase.fetchAllGenresMovies');

  @override
  Future<List<GenresMoviesModel>> fetchAllGenresMovies() {
    return _$fetchAllGenresMoviesAsyncAction
        .run(() => super.fetchAllGenresMovies());
  }

  final _$_GenresMovieStoreBaseActionController =
      ActionController(name: '_GenresMovieStoreBase');

  @override
  void _saveAllGenresMovies() {
    final _$actionInfo = _$_GenresMovieStoreBaseActionController.startAction(
        name: '_GenresMovieStoreBase._saveAllGenresMovies');
    try {
      return super._saveAllGenresMovies();
    } finally {
      _$_GenresMovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _removeAllGenresMovies() {
    final _$actionInfo = _$_GenresMovieStoreBaseActionController.startAction(
        name: '_GenresMovieStoreBase._removeAllGenresMovies');
    try {
      return super._removeAllGenresMovies();
    } finally {
      _$_GenresMovieStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listGenresMovies: ${listGenresMovies},
hasError: ${hasError},
error: ${error}
    ''';
  }
}
