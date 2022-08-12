abstract class SpotifyAPI {
  /// The Spotify API base to retrive data.
  static const _base = 'https://api.spotify.com/v1';

  /// Return the endpoint to do search.
  static String get search => '$_base/search';

  /// Return the endpoint to get the albums of an artist.
  ///
  /// Th id of the artist is required as [artistID].
  static String getAlbums(String artistID) => '$_base/artists/$artistID/albums';

  /// Return the endpoint to get the tracks of an albun.
  ///
  /// Th id of the albun is required as [albumID].
  static String getTracks(String albumID) => '$_base/albums/$albumID/tracks';
}
