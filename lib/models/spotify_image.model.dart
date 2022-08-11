import 'package:my_spoti/constants/enums.constants.dart';

/// Model to spotify images data.
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

  /// Return the image size type based on the image height.\
  /// 
  /// 64 = samal, 300 = midle , 640 = big, another case = unknow
  SpotifyImageSizes get imageSize {
    switch (height) {
      case 64:
        return SpotifyImageSizes.small;
      case 300:
        return SpotifyImageSizes.midle;
      case 640:
        return SpotifyImageSizes.big;
      default:
        return SpotifyImageSizes.unknow;
    }
  }
}
