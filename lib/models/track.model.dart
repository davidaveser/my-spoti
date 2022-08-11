import 'package:my_spoti/models/album.model.dart';
import 'package:my_spoti/models/artist.model.dart';

/// Receive [data] as a json and returns a `List<Track>`
List<Track> trackList(List<dynamic> data) => List<Track>.from(data.map<dynamic>((dynamic x) => Track.fromJson(x)));

/// Model for Track intems.
class Track {
  Track({
    required this.name,
    required this.durationMs,
    required this.trackNumber,
    required this.isExplicit,
    this.previewUrl,
    this.album,
    this.artists,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        name: json['name'] ?? '',
        durationMs: json['duration_ms'] ?? 0,
        trackNumber: json['track_number'] ?? -1,
        isExplicit: json['explicit'] ?? false,
        previewUrl: json['preview_url'],
        album: json['album'] == null ? null : Album.fromJson(json['album']),
        artists: json['artists'] == null ? null : List<Artist>.from(json['artists'].map((dynamic x) => Artist.fromJson(x))),
      );

  String name;
  int durationMs;
  int trackNumber;
  bool isExplicit;
  String? previewUrl;
  Album? album;
  List<Artist>? artists;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'duration_ms': durationMs,
        'track_number': trackNumber,
        'explicit': isExplicit,
        'preview_url': previewUrl,
        'album': album?.toJson(),
        'artists': List<dynamic>.from(artists?.map<dynamic>((x) => x.toJson()) ?? <dynamic>[]),
      };
}
