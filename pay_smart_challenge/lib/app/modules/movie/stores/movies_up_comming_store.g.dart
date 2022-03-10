// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_up_comming_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieUpCommingStore on _MovieUpCommingStoreBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_MovieUpCommingStoreBase.hasError'))
          .value;
  Computed<String>? _$errorComputed;

  @override
  String get error => (_$errorComputed ??= Computed<String>(() => super.error,
          name: '_MovieUpCommingStoreBase.error'))
      .value;

  final _$listMoviesUpCommingAtom =
      Atom(name: '_MovieUpCommingStoreBase.listMoviesUpComming');

  @override
  List<MovieModel> get listMoviesUpComming {
    _$listMoviesUpCommingAtom.reportRead();
    return super.listMoviesUpComming;
  }

  @override
  set listMoviesUpComming(List<MovieModel> value) {
    _$listMoviesUpCommingAtom.reportWrite(value, super.listMoviesUpComming, () {
      super.listMoviesUpComming = value;
    });
  }

  final _$_errorAtom = Atom(name: '_MovieUpCommingStoreBase._error');

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

  final _$_hasErrorAtom = Atom(name: '_MovieUpCommingStoreBase._hasError');

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

  final _$_getDetailsMoviesUpCommingAsyncAction =
      AsyncAction('_MovieUpCommingStoreBase._getDetailsMoviesUpComming');

  @override
  Future<DetailsMoviesUpCommingModel> _getDetailsMoviesUpComming() {
    return _$_getDetailsMoviesUpCommingAsyncAction
        .run(() => super._getDetailsMoviesUpComming());
  }

  final _$_getAllMoviesUpCommingAsyncAction =
      AsyncAction('_MovieUpCommingStoreBase._getAllMoviesUpComming');

  @override
  Future<void> _getAllMoviesUpComming() {
    return _$_getAllMoviesUpCommingAsyncAction
        .run(() => super._getAllMoviesUpComming());
  }

  final _$fetchMoviesUpCommingAsyncAction =
      AsyncAction('_MovieUpCommingStoreBase.fetchMoviesUpComming');

  @override
  Future<List<MovieModel>> fetchMoviesUpComming() {
    return _$fetchMoviesUpCommingAsyncAction
        .run(() => super.fetchMoviesUpComming());
  }

  final _$_MovieUpCommingStoreBaseActionController =
      ActionController(name: '_MovieUpCommingStoreBase');

  @override
  void _saveAllMoviesUpComming() {
    final _$actionInfo = _$_MovieUpCommingStoreBaseActionController.startAction(
        name: '_MovieUpCommingStoreBase._saveAllMoviesUpComming');
    try {
      return super._saveAllMoviesUpComming();
    } finally {
      _$_MovieUpCommingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _removeAllMoviesUpComming() {
    final _$actionInfo = _$_MovieUpCommingStoreBaseActionController.startAction(
        name: '_MovieUpCommingStoreBase._removeAllMoviesUpComming');
    try {
      return super._removeAllMoviesUpComming();
    } finally {
      _$_MovieUpCommingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listMoviesUpComming: ${listMoviesUpComming},
hasError: ${hasError},
error: ${error}
    ''';
  }
}
