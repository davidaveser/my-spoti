import 'package:my_spoti/stores/album_store/album.store.dart';
import 'package:my_spoti/stores/app_state.store.dart';
import 'package:my_spoti/stores/artist_store/artist.store.dart';
import 'package:my_spoti/stores/search_store/search.store.dart';
import 'package:provider/provider.dart';

abstract class Providers {
  static List<Provider> get providers {
    return [
      Provider<AppStateStore>(create: (_) => AppStateStore()),
      Provider<SearchStore>(create: (_) => SearchStore()),
      Provider<ArtistStore>(create: (_) => ArtistStore()),
      Provider<AlbumStore>(create: (_) => AlbumStore()),
    ];
  }
}
