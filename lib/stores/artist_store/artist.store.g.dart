// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArtistStore on ArtistWithStore, Store {
  late final _$artistSelectedAtom =
      Atom(name: 'ArtistWithStore.artistSelected', context: context);

  @override
  SpotifyArtist? get artistSelected {
    _$artistSelectedAtom.reportRead();
    return super.artistSelected;
  }

  @override
  set artistSelected(SpotifyArtist? value) {
    _$artistSelectedAtom.reportWrite(value, super.artistSelected, () {
      super.artistSelected = value;
    });
  }

  late final _$artistSelectedAlbumsAtom =
      Atom(name: 'ArtistWithStore.artistSelectedAlbums', context: context);

  @override
  List<SpotifyAlbum> get artistSelectedAlbums {
    _$artistSelectedAlbumsAtom.reportRead();
    return super.artistSelectedAlbums;
  }

  @override
  set artistSelectedAlbums(List<SpotifyAlbum> value) {
    _$artistSelectedAlbumsAtom.reportWrite(value, super.artistSelectedAlbums,
        () {
      super.artistSelectedAlbums = value;
    });
  }

  late final _$setArtistToDesplayAsyncAction =
      AsyncAction('ArtistWithStore.setArtistToDesplay', context: context);

  @override
  Future<void> setArtistToDesplay(SpotifyArtist artistSelected) {
    return _$setArtistToDesplayAsyncAction
        .run(() => super.setArtistToDesplay(artistSelected));
  }

  late final _$ArtistWithStoreActionController =
      ActionController(name: 'ArtistWithStore', context: context);

  @override
  void cleanStore() {
    final _$actionInfo = _$ArtistWithStoreActionController.startAction(
        name: 'ArtistWithStore.cleanStore');
    try {
      return super.cleanStore();
    } finally {
      _$ArtistWithStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
artistSelected: ${artistSelected},
artistSelectedAlbums: ${artistSelectedAlbums}
    ''';
  }
}
