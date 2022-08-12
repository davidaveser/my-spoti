import 'package:my_spoti/models/spotify_image.model.dart';

/// Receive spotify artists as json [data] and returns a `List<SpotifyArtist>`
List<SpotifyArtist> artistList(List<dynamic> data) =>
    List<SpotifyArtist>.from(data.map<dynamic>((dynamic x) => SpotifyArtist.fromJson(x)));

/// Model for spotify artists intems.
class SpotifyArtist {
  SpotifyArtist({
    required this.id,
    required this.name,
    this.images,
    this.followers,
  });

  factory SpotifyArtist.fromJson(Map<String, dynamic> json) => SpotifyArtist(
        id: json['id'],
        name: json['name'],
        images: json['images'] == null
            ? null
            : List<SpotifyImage>.from(json['images'].map((dynamic x) => SpotifyImage.fromJson(x))),
        followers: json['followers']?['total'],
      );

  String id;
  String name;
  List<SpotifyImage>? images;
  int? followers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'images': images == null ? null : List<dynamic>.from(images?.map<dynamic>((x) => x.toJson()) ?? <dynamic>[]),
        'followers': followers,
      };
}
