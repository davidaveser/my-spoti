import 'package:my_spoti/models/spotify_image.model.dart';

/// Receive spotify albums as json [data] and returns a `List<SpotifyAlbum>`
List<SpotifyAlbum> albumList(List<dynamic> data) =>
    List<SpotifyAlbum>.from(data.map<dynamic>((dynamic x) => SpotifyAlbum.fromJson(x)));

/// Model for spotify album intems.
class SpotifyAlbum {
  SpotifyAlbum({
    this.name,
    this.id,
    this.images,
    this.releaseDate,
  });

  factory SpotifyAlbum.fromJson(Map<String, dynamic> json) => SpotifyAlbum(
        name: json['name'],
        id: json['id'],
        images: json['images'] == null ? null : List<Image>.from(json['images'].map((dynamic x) => Image.fromJson(x))),
        releaseDate: json['release_date'] == null ? null : DateTime.parse(json['release_date']),
      );

  String? name;
  String? id;
  List<Image>? images;
  DateTime? releaseDate;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'id': id,
        'images': images == null ? null : List<dynamic>.from(images?.map<dynamic>((x) => x.toJson())),
        'release_date': releaseDate?.toString(),
      };
}
