import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';

class AlbumItemWidget extends StatelessWidget {
  const AlbumItemWidget({
    Key? key,
    required this.imageUrl,
    required this.albumName,
    required this.artistName,
  }) : super(key: key);

  final String imageUrl;
  final String albumName;
  final String artistName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      splashColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurpleAccent[400]?.withOpacity(0.85) ?? CustomColors.primaryDark,
              blurRadius: 1.0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            // > Image
            ImageWidget(imageUrl: imageUrl),

            const SizedBox(height: 5.0),

            // > Artist name
            SizedBox(
              width: 140.0,
              child: Text(
                artistName,
                style: _textStyle(fontSize: 10.5),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),

            // > Album name
            SizedBox(
              width: 140.0,
              child: Text(
                albumName,
                style: _textStyle(),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 3.5),
          ],
        ),
      ),
    );
  }

  TextStyle _textStyle({double fontSize = 13.5}) => TextStyle(
        fontFamily: 'SegoeUI',
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(19.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(1.5, 3.5),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(19.0)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 146.0,
          placeholder: (context, url) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CircularProgressIndicator(color: CustomColors.primaryDark, strokeWidth: 4.5),
          ),
          errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
