import 'package:mobx/mobx.dart';
import 'package:my_spoti/models/spotify_album.model.dart';
import 'package:my_spoti/repositories/spotify.repository.dart';
import 'package:my_spoti/utils/oauth2.util.dart';

part 'home_albums.store.g.dart';

class HomeAlbumsStore = HomeAlbumsWithStore with _$HomeAlbumsStore;

abstract class HomeAlbumsWithStore with Store {
  SpotifyRepository spotifyRepository = SpotifyRepository();

  @observable
  List<SpotifyAlbum> albumListResult = [];

  @action
  Future<void> getHomeAlbums() async {
    await OAuth2SpotifyUtil.isTokenActive();
    albumListResult = await spotifyRepository.getNewAlbums() ?? [];

    print('****');
    print(albumListResult);
    print('****');
  }

  @action
  void cleanStore() {
    albumListResult = [];
  }
}
