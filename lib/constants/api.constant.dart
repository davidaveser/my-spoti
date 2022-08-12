abstract class SpotifyAPI {
  static const _base = 'https://api.spotify.com/v1';

  /// Return endpoint to do search.
  static String get search => '$_base/search';

  /// Return endpoint to get the albums of an artist.
  ///
  /// Th id of the artist is required as [artistID].
  static String getAlbums(String artistID) => '$_base/artists/$artistID/albums';
}
