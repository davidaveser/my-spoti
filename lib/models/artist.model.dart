/// Receive [data] as a json and returns a `List<Artist>`
List<Artist> artistListToModel(List<dynamic> data) =>
    List<Artist>.from(data.map<dynamic>((dynamic x) => Artist.fromJson(x)));

/// Model for Artist intems.
class Artist {
  Artist({
    this.name,
    this.id,
    this.images,
    this.followers,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
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

class Image {
  Image({this.height, this.url, this.width});

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
