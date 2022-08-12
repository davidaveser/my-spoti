import 'package:mobx/mobx.dart';
import 'package:my_spoti/models/spotify_album.model.dart';
import 'package:my_spoti/models/spotify_track.model.dart';
import 'package:my_spoti/repositories/spotify.repository.dart';

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
    albumSelectedTracks = await spotifyRepository.getTracks(albumSelected.id) ?? [];
  }

  @action
  void cleanStore() {
    albumSelected = null;
    albumSelectedTracks = [];
  }
}
