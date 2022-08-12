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
  static Future<Map<String, dynamic>> spotifyParamsSearch(String searchString) async =>
      <String, dynamic>{'limit': '20', 'offset': '0', 'q': searchString, 'type': 'album,artist,track'};

  /// Return the required parameters to get the albums of an artist.
  static Future<Map<String, dynamic>> spotifyParamsArtistAlbums() async =>
      <String, dynamic>{'limit': '20', 'offset': '0', 'album_type': 'album'};
}
