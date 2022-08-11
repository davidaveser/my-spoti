import 'package:my_spoti/models/spotify_image.model.dart';

/// Receive spotify artists as json [data] and returns a `List<SpotifyArtist>`
List<SpotifyArtist> artistList(List<dynamic> data) =>
    List<SpotifyArtist>.from(data.map<dynamic>((dynamic x) => SpotifyArtist.fromJson(x)));

/// Model for spotify artists intems.
class SpotifyArtist {
  SpotifyArtist({
    this.name,
    this.id,
    this.images,
    this.followers,
  });

  factory SpotifyArtist.fromJson(Map<String, dynamic> json) => SpotifyArtist(
        name: json['name'],
        id: json['id'],
        images: json['images'] == null ? null : List<Image>.from(json['images'].map((dynamic x) => Image.fromJson(x))),
        followers: json['followers'] == null ? null : Followers.fromJson(json['followers']),
      );

  String? name;
  String? id;
  List<Image>? images;
  Followers? followers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'id': id,
        'images': images == null ? null : List<dynamic>.from(images?.map<dynamic>((x) => x.toJson()) ?? <dynamic>[]),
        'followers': followers?.toJson(),
      };
}

class Followers {
  Followers({
    this.total,
    this.href,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        total: json['total'],
        href: json['href'],
      );

  int? total;
  String? href;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'total': total,
        'href': href,
      };
}