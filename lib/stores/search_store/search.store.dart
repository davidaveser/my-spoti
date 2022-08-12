import 'package:mobx/mobx.dart';
import 'package:my_spoti/models/spotify_album.model.dart';
import 'package:my_spoti/models/spotify_artist.model.dart';
import 'package:my_spoti/repositories/spotify.repository.dart';

part 'search.store.g.dart';

class SearchStore = SearchWithStore with _$SearchStore;

abstract class SearchWithStore with Store {
  SpotifyRepository spotifyRepository = SpotifyRepository();

  @observable
  List<SpotifyArtist> artistListResult = [];

  @observable
  List<SpotifyAlbum> albumListResult = [];

  @observable
  bool searchLoadingError = false;

  @action
  Future<void> getSearchResults(String stringSearch) async {
    final Map<String, dynamic>? searchResponse = await spotifyRepository.getSearchResults(stringSearch);

    if (searchResponse != null) {
      artistListResult = artistList(searchResponse['artist']);
      albumListResult = albumList(searchResponse['albums']);
    } else {
      searchLoadingError = true;
    }
  }

  @action
  void cleanStore() {
    artistListResult = [];
    albumListResult = [];
    searchLoadingError = false;
  }
}
