import 'package:flutter/material.dart';
import 'package:my_spoti/ui/widgets/image.widget.dart';

class ArtistItemWidget extends StatelessWidget {
  const ArtistItemWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.onTap,
    this.fontSize = 13.5,
  }) : super(key: key);

  final String imageUrl;
  final String name;
  final void Function()? onTap;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // > Image
        ImageWidget(imageUrl: imageUrl, width: 106.0, borderRadius: 100.0, onTap: onTap),

        const SizedBox(height: 10.0),

        // > Name
        SizedBox(
          width: 140.0,
          child: Text(
            name,
            style: TextStyle(
              fontFamily: 'SegoeUI',
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
