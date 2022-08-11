/// Receive spotify albums as json [data] and returns a `List<SpotifyAlbum>`
List<SpotifyAlbum> albumList(List<dynamic> data) =>
    List<SpotifyAlbum>.from(data.map<dynamic>((dynamic x) => SpotifyAlbum.fromJson(x)));

/// Model for spotify albums intems.
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

class Image {
  Image({
    this.url,
    this.height,
    this.width,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json['url'],
        height: json['height'],
        width: json['width'],
      );

  String? url;
  int? height;
  int? width;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'height': height,
        'width': width,
      };
}
