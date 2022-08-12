import 'package:my_spoti/models/spotify_album.model.dart';
import 'package:my_spoti/models/spotify_artist.model.dart';

/// Receive spotify tracks as json [data] and returns a `List<SpotifyTrack>`
List<SpotifyTrack> trackList(List<dynamic> data) =>
    List<SpotifyTrack>.from(data.map<dynamic>((dynamic x) => SpotifyTrack.fromJson(x)));

/// Model for spotify tack intems.
class SpotifyTrack {
  SpotifyTrack({
    required this.id,
    required this.name,
    required this.durationMs,
    this.trackNumber,
    this.explicit,
    this.previewUrl,
    this.album,
    this.artists,
  });

  factory SpotifyTrack.fromJson(Map<String, dynamic> json) => SpotifyTrack(
        id: json['id'],
        name: json['name'],
        durationMs: json['duration_ms'],
        trackNumber: json['track_number'],
        explicit: json['explicit'],
        previewUrl: json['preview_url'],
        album: json['album'] == null ? null : SpotifyAlbum.fromJson(json['album']),
        artists: json['artists'] == null
            ? null
            : List<SpotifyArtist>.from(json['artists'].map((dynamic x) => SpotifyArtist.fromJson(x))),
      );

  String id;
  String name;
  int durationMs;
  int? trackNumber;
  bool? explicit;
  String? previewUrl;
  SpotifyAlbum? album;
  List<SpotifyArtist>? artists;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'duration_ms': durationMs,
        'track_number': trackNumber,
        'explicit': explicit,
        'preview_url': previewUrl,
        'album': album?.toJson(),
        'artists': artists == null ? null : List<dynamic>.from(artists?.map<dynamic>((x) => x.toJson()) ?? <dynamic>[]),
      };
}
