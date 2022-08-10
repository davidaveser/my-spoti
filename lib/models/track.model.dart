/// Receive [data] as a json and returns a `List<Track>`
List<Track> trackList(List<dynamic> data) => List<Track>.from(data.map<dynamic>((dynamic x) => Track.fromJson(x)));

/// Model for Track intems.
class Track {
  Track({
    this.name,
    this.trackNumber,
    this.durationMs,
    this.explicit,
    this.previewUrl,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        name: json['name'],
        trackNumber: json['track_number'],
        durationMs: json['duration_ms'],
        explicit: json['explicit'],
        previewUrl: json['preview_url'],
      );

  String? name;
  int? trackNumber;
  int? durationMs;
  bool? explicit;
  String? previewUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'track_number': trackNumber,
        'duration_ms': durationMs,
        'explicit': explicit,
        'preview_url': previewUrl,
      };
}
