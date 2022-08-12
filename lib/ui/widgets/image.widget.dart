import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.imageUrl,
    this.borderRadius = 19,
    this.width = 146,
    this.onTap,
  }) : super(key: key);

  final String imageUrl;
  final double borderRadius;
  final double width;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      splashColor: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(3.5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(1.5, 3.5),
                blurRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: width,
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
    );
  }
}
