import 'package:dio/dio.dart';
import 'package:my_spoti/constants/api.constant.dart';
import 'package:my_spoti/utils/http.util.dart';

class SpotifyRepository {
  /// Retrive a Map<String, dynamic> with the albun,artist,track search result from Spotify.
  ///
  /// Response example:\
  /// {
  ///   albums: [],
  ///   artists: [],
  ///   tracks: [],
  /// }
  ///
  /// Error response:\
  /// {"error":{"status":_codeNumber,"message":_message}}
  Future<Map<String, dynamic>> getSpotifySearchResults(String stringSearch) async {
    final headers = await HttpUtil.spotifyAPIHeader();
    final parameters = await HttpUtil.spotifyParamsSearch(stringSearch);

    try {
      final Response response = await Dio().get<dynamic>(
        SpotifyAPI.search,
        queryParameters: parameters,
        options: Options(
          contentType: Headers.jsonContentType,
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        final serverResponse = response.data as Map<String, dynamic>;

        final finalResponse = <String, dynamic>{};

        if (serverResponse['albums'] != null && serverResponse['albums']['items'] != null) {
          finalResponse['albums'] = serverResponse['albums']['items'];
        }
        if (serverResponse['artists'] != null && serverResponse['artists']['items'] != null) {
          finalResponse['artists'] = serverResponse['artists']['items'];
        }
        if (serverResponse['tracks'] != null && serverResponse['tracks']['items'] != null) {
          finalResponse['tracks'] = serverResponse['tracks']['items'];
        }

        return finalResponse;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response?.data as Map<String, dynamic>;
      }
    }

    return <String, dynamic>{
      'error': {'status': -1, 'message': 'Unexpected error'}
    };
  }
}
