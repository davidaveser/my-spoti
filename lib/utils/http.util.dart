import 'package:my_spoti/constants/api.constant.dart';
import 'package:my_spoti/constants/preferences_keys.constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class HttpUtil {
  /// Return the required header for the spotify API calls.
  static Future<Map<String, dynamic>> spotifyAPIHeader() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(PreferencesKeys.spotifyToken);

    return <String, dynamic>{'Authorization': 'Bearer $token'};
  }

  /// Return the required parameters for [SpotifyAPI.search].
  ///
  /// The String value to search [searchString] is required.
  static Map<String, dynamic> spotifyParamsSearch(String searchString) =>
      <String, dynamic>{'limit': '10', 'offset': '0', 'q': searchString, 'type': 'album,artist,track'};

  /// Return the required parameters to get the albums of an artist.
  static Map<String, dynamic> spotifyParamsArtistAlbums() =>
      <String, dynamic>{'limit': '10', 'offset': '0'};

  /// Return the required parameters to get the tracks of an Album.
  static Map<String, dynamic> spotifyParamsAlbumTracks() => <String, dynamic>{'limit': '10', 'offset': '0'};

  /// Return the required parameters to get the albums for home.
  static Map<String, dynamic> get spotifyParamsHomeAlbums =>
      <String, dynamic>{'limit': '10', 'offset': '0', 'country': 'MX'};
}
