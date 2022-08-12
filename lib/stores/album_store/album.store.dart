import 'package:mobx/mobx.dart';
import 'package:my_spoti/models/spotify_album.model.dart';
import 'package:my_spoti/models/spotify_track.model.dart';
import 'package:my_spoti/repositories/spotify.repository.dart';
import 'package:my_spoti/utils/oauth2.util.dart';

part 'album.store.g.dart';

class AlbumStore = AlbumWithStore with _$AlbumStore;

abstract class AlbumWithStore with Store {
  SpotifyRepository spotifyRepository = SpotifyRepository();

  @observable
  SpotifyAlbum? albumSelected;

  @observable
  List<SpotifyTrack> albumSelectedTracks = [];

  @action
  Future<void> setAlbumToDesplay(SpotifyAlbum albumSelected) async {
    this.albumSelected = albumSelected;
    await OAuth2SpotifyUtil.isTokenActive();
    albumSelectedTracks = await spotifyRepository.getTracks(albumSelected.id) ?? [];
  }

  @action
  void cleanStore() {
    albumSelected = null;
    albumSelectedTracks = [];
  }
}
