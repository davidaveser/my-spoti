// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on SearchWithStore, Store {
  late final _$artistListResultAtom =
      Atom(name: 'SearchWithStore.artistListResult', context: context);

  @override
  List<SpotifyArtist> get artistListResult {
    _$artistListResultAtom.reportRead();
    return super.artistListResult;
  }

  @override
  set artistListResult(List<SpotifyArtist> value) {
    _$artistListResultAtom.reportWrite(value, super.artistListResult, () {
      super.artistListResult = value;
    });
  }

  late final _$albumListResultAtom =
      Atom(name: 'SearchWithStore.albumListResult', context: context);

  @override
  List<SpotifyAlbum> get albumListResult {
    _$albumListResultAtom.reportRead();
    return super.albumListResult;
  }

  @override
  set albumListResult(List<SpotifyAlbum> value) {
    _$albumListResultAtom.reportWrite(value, super.albumListResult, () {
      super.albumListResult = value;
    });
  }

  late final _$searchLoadingErrorAtom =
      Atom(name: 'SearchWithStore.searchLoadingError', context: context);

  @override
  bool get searchLoadingError {
    _$searchLoadingErrorAtom.reportRead();
    return super.searchLoadingError;
  }

  @override
  set searchLoadingError(bool value) {
    _$searchLoadingErrorAtom.reportWrite(value, super.searchLoadingError, () {
      super.searchLoadingError = value;
    });
  }

  late final _$getSearchResultsAsyncAction =
      AsyncAction('SearchWithStore.getSearchResults', context: context);

  @override
  Future<void> getSearchResults(String stringSearch) {
    return _$getSearchResultsAsyncAction
        .run(() => super.getSearchResults(stringSearch));
  }

  late final _$SearchWithStoreActionController =
      ActionController(name: 'SearchWithStore', context: context);

  @override
  void cleanStore() {
    final _$actionInfo = _$SearchWithStoreActionController.startAction(
        name: 'SearchWithStore.cleanStore');
    try {
      return super.cleanStore();
    } finally {
      _$SearchWithStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
artistListResult: ${artistListResult},
albumListResult: ${albumListResult},
searchLoadingError: ${searchLoadingError}
    ''';
  }
}
