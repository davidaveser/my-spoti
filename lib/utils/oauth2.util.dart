import 'dart:convert';

import 'package:my_spoti/constants/keys.constants.dart';
import 'package:my_spoti/constants/preferences_keys.constants.dart';
import 'package:oauth2_client/access_token_response.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/spotify_oauth2_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OAuth2SpotifyUtil {
  /// Auth flow request to get access to a spotify account.
  ///
  /// If [refreshToken] is not null then a refresh token will be apply instead the auth flow request.
  static Future<bool> getAndSaveAccessToken({String? refreshToken}) async {
    // Client Id and Secret (String)
    const String clientID = Keys.spotifyClientId;
    const String clientSecret = Keys.spotifyClientSecret;
    const String clientIdAndSecret = '$clientID:$clientSecret';

    // Client Id and Secret (UTF8)
    final Codec<String, String> stringToBase64 = utf8.fuse(base64);
    final String idAndSecretEncoded = stringToBase64.encode(clientIdAndSecret);

    final tokenRequestHeaders = <String, String>{};
    tokenRequestHeaders['Authorization'] = 'Basic $idAndSecretEncoded';
    tokenRequestHeaders['Content-Type'] = 'application/x-www-form-urlencoded';

    // OAuth2 Spotify Client
    final OAuth2Client spotifyClient = SpotifyOAuth2Client(
      redirectUri: 'my-spoty://calback',
      customUriScheme: 'my-spoty',
    );

    // Set headers to the client
    spotifyClient.accessTokenRequestHeaders = tokenRequestHeaders;

    // Scopes list
    const List<String> spotifyScopes = ['user-read-private'];

    // Request
    try {
      AccessTokenResponse accessTokenResponse;

      if (refreshToken == null) {
        accessTokenResponse = await spotifyClient.getTokenWithAuthCodeFlow(
          clientId: Keys.spotifyClientId,
          clientSecret: Keys.spotifyClientSecret,
          scopes: spotifyScopes,
        );
      } else {
        accessTokenResponse = await spotifyClient.refreshToken(
          refreshToken,
          clientId: Keys.spotifyClientId,
          clientSecret: Keys.spotifyClientSecret,
          scopes: spotifyScopes,
        );
      }
      if (accessTokenResponse.accessToken != null && accessTokenResponse.refreshToken != null) {
        await _saveAccessToken(accessTokenResponse: accessTokenResponse);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<void> _saveAccessToken({required AccessTokenResponse accessTokenResponse}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKeys.spotifyToken, accessTokenResponse.accessToken);
    prefs.setString(PreferencesKeys.spotifyRefreshToken, accessTokenResponse.refreshToken);
    prefs.setString(PreferencesKeys.spotifyTokenExpiration, accessTokenResponse.expirationDate.toString());
  }

  // Check and refresh the current acces token, return false if some error is occurred.
  static Future<bool> isTokenActive() async {
    final prefs = await SharedPreferences.getInstance();
    final String expirationDate = prefs.getString(PreferencesKeys.spotifyTokenExpiration);
    final DateTime expiration = DateTime.parse(expirationDate);

    if (expiration.isAfter(DateTime.now())) {
      final bool succesRefresh = await getAndSaveAccessToken(refreshToken: prefs.getString(PreferencesKeys.spotifyRefreshToken));
      if (!succesRefresh) {
        await prefs.clear();
      }

      return succesRefresh;
    }
    return true;
  }
}
