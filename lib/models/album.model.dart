/// Receive [data] as a json and returns a `List<Album>`
List<Album> artistList(List<dynamic> data) => List<Album>.from(data.map<dynamic>((dynamic x) => Album.fromJson(x)));

/// Model for Albums intems.
class Album {
  Album({
    this.name,
    this.id,
    this.images,
    this.releaseDate,
  });

  factory Album.fromJson(Map<String, dynamic> json) => Album(
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
