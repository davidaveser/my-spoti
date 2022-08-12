import 'package:mobx/mobx.dart';
import 'package:my_spoti/models/spotify_album.model.dart';
import 'package:my_spoti/models/spotify_artist.model.dart';
import 'package:my_spoti/repositories/spotify.repository.dart';
import 'package:my_spoti/utils/oauth2.util.dart';

part 'artist.store.g.dart';

class ArtistStore = ArtistWithStore with _$ArtistStore;

abstract class ArtistWithStore with Store {
  SpotifyRepository spotifyRepository = SpotifyRepository();

  @observable
  SpotifyArtist? artistSelected;

  @observable
  List<SpotifyAlbum> artistSelectedAlbums = [];

  @action
  Future<void> setArtistToDesplay(SpotifyArtist artistSelected) async {
    this.artistSelected = artistSelected;
    await OAuth2SpotifyUtil.isTokenActive();
    artistSelectedAlbums = await spotifyRepository.getAlbums(artistSelected.id) ?? [];
  }

  @action
  void cleanStore() {
    artistSelected = null;
    artistSelectedAlbums = [];
  }
}
