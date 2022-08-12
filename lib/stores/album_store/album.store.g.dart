// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlbumStore on AlbumWithStore, Store {
  late final _$albumSelectedAtom =
      Atom(name: 'AlbumWithStore.albumSelected', context: context);

  @override
  SpotifyAlbum? get albumSelected {
    _$albumSelectedAtom.reportRead();
    return super.albumSelected;
  }

  @override
  set albumSelected(SpotifyAlbum? value) {
    _$albumSelectedAtom.reportWrite(value, super.albumSelected, () {
      super.albumSelected = value;
    });
  }

  late final _$albumSelectedTracksAtom =
      Atom(name: 'AlbumWithStore.albumSelectedTracks', context: context);

  @override
  List<SpotifyTrack> get albumSelectedTracks {
    _$albumSelectedTracksAtom.reportRead();
    return super.albumSelectedTracks;
  }

  @override
  set albumSelectedTracks(List<SpotifyTrack> value) {
    _$albumSelectedTracksAtom.reportWrite(value, super.albumSelectedTracks, () {
      super.albumSelectedTracks = value;
    });
  }

  late final _$setAlbumToDesplayAsyncAction =
      AsyncAction('AlbumWithStore.setAlbumToDesplay', context: context);

  @override
  Future<void> setAlbumToDesplay(SpotifyAlbum albumSelected) {
    return _$setAlbumToDesplayAsyncAction
        .run(() => super.setAlbumToDesplay(albumSelected));
  }

  late final _$AlbumWithStoreActionController =
      ActionController(name: 'AlbumWithStore', context: context);

  @override
  void cleanStore() {
    final _$actionInfo = _$AlbumWithStoreActionController.startAction(
        name: 'AlbumWithStore.cleanStore');
    try {
      return super.cleanStore();
    } finally {
      _$AlbumWithStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
albumSelected: ${albumSelected},
albumSelectedTracks: ${albumSelectedTracks}
    ''';
  }
}
