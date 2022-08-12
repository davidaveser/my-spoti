import 'package:my_spoti/constants/enums.constants.dart';

/// Model to spotify images data.
class SpotifyImage {
  SpotifyImage({
    required this.url,
    required this.height,
    required this.width,
  });

  factory SpotifyImage.fromJson(Map<String, dynamic> json) => SpotifyImage(
        url: json['url'],
        height: json['height'],
        width: json['width'],
      );

  String url;
  int height;
  int width;

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
      case 300:
        return SpotifyImageSizes.midle;
      case 640:
        return SpotifyImageSizes.big;
      default:
        return SpotifyImageSizes.small;
    }
  }
}
