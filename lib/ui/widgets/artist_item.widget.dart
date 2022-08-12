import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';

class ArtistItemWidget extends StatelessWidget {
  const ArtistItemWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // > Image
        InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(Radius.circular(100.0)),
          splashColor: Colors.white70,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 106.0,
                placeholder: (context, url) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircularProgressIndicator(color: CustomColors.primaryDark, strokeWidth: 4.5),
                ),
                errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 10.0,
        ),

        // > Name
        SizedBox(
          width: 140.0,
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: 'SegoeUI',
              color: Colors.white,
              fontSize: 13.5,
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
