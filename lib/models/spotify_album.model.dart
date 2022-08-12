import 'package:my_spoti/models/spotify_artist.model.dart';
import 'package:my_spoti/models/spotify_image.model.dart';

/// Receive spotify albums as json [data] and returns a `List<SpotifyAlbum>`
List<SpotifyAlbum> albumList(List<dynamic> data) =>
    List<SpotifyAlbum>.from(data.map<dynamic>((dynamic x) => SpotifyAlbum.fromJson(x)));

/// Model for spotify album intems.
class SpotifyAlbum {
  SpotifyAlbum({
    required this.id,
    required this.name,
    required this.artists,
    this.images,
    this.releaseDate,
    this.totalTracks,
  });

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) => SpotifyAlbum(
        id: json['id'],
        name: json['name'],
        artists: List<SpotifyArtist>.from(json['artists'].map((dynamic x) => SpotifyArtist.fromJson(x))),
        images: json['images'] == null
            ? null
            : List<SpotifyImage>.from(json['images'].map((dynamic x) => SpotifyImage.fromJson(x))),
        releaseDate: json['release_date'] == null ? null : DateTime.parse(json['release_date']),
        totalTracks: json['total_tracks'],
      );

  String id;
  String name;
  List<SpotifyArtist> artists;
  List<SpotifyImage>? images;
  DateTime? releaseDate;
  int? totalTracks;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'artists': List<dynamic>.from(artists.map<dynamic>((x) => x.toJson())),
        'images': images == null ? null : List<dynamic>.from(images?.map<dynamic>((x) => x.toJson()) ?? <dynamic>[]),
        'release_date': releaseDate == null
            ? null
            : "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        'total_tracks': totalTracks,
      };
}
