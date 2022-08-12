import 'package:flutter/material.dart';
import 'package:my_spoti/constants/assets_path.constants.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, this.onPressed}) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(0),
      icon: const ImageIcon(
        AssetImage(
          AssetsPath.backArrowIcon,
        ),
      ),
      color: Colors.white,
      onPressed: onPressed,
    );
  }
}
