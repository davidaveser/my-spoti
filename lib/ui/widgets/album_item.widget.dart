import 'package:flutter/material.dart';
import 'package:my_spoti/ui/widgets/image.widget.dart';

class AlbumItemWidget extends StatelessWidget {
  const AlbumItemWidget({
    Key? key,
    required this.imageUrl,
    required this.albumName,
    required this.artistName,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final String albumName;
  final String artistName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // > Image
        ImageWidget(imageUrl: imageUrl, onTap: onTap),

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
      ],
    );
  }

  TextStyle _textStyle({double fontSize = 13.5}) => TextStyle(
        fontFamily: 'SegoeUI',
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      );
}
