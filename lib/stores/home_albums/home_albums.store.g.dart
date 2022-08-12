// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_albums.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeAlbumsStore on HomeAlbumsWithStore, Store {
  late final _$albumListResultAtom =
      Atom(name: 'HomeAlbumsWithStore.albumListResult', context: context);

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

  late final _$getHomeAlbumsAsyncAction =
      AsyncAction('HomeAlbumsWithStore.getHomeAlbums', context: context);

  @override
  Future<void> getHomeAlbums() {
    return _$getHomeAlbumsAsyncAction.run(() => super.getHomeAlbums());
  }

  late final _$HomeAlbumsWithStoreActionController =
      ActionController(name: 'HomeAlbumsWithStore', context: context);

  @override
  void cleanStore() {
    final _$actionInfo = _$HomeAlbumsWithStoreActionController.startAction(
        name: 'HomeAlbumsWithStore.cleanStore');
    try {
      return super.cleanStore();
    } finally {
      _$HomeAlbumsWithStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
albumListResult: ${albumListResult}
    ''';
  }
}
