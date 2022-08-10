import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:my_spoti/constants/assets_path.constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),

      // Bootom navigation
      bottomNavigationBar: Blur(
        colorOpacity: 0.15,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(65.0), topRight: Radius.circular(65.0)),
        overlay: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SectionButtonWidget(
              assetIcon: AssetsPath.homeSectionIcon,
              onTap: () {},
            ),
            SectionButtonWidget(
              assetIcon: AssetsPath.searchSectionIcon,
              onTap: () {},
              isLeft: false,
            ),
          ],
        ),
        child: const SizedBox(width: double.infinity, height: 85.0),
      ),
    );
  }
}

class SectionButtonWidget extends StatelessWidget {
  const SectionButtonWidget({
    Key? key,
    required this.assetIcon,
    this.isActive = false,
    required this.onTap,
    this.isLeft = true,
  }) : super(key: key);

  final String assetIcon;
  final bool isActive;
  final void Function()? onTap;
  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.only(
        topLeft: isLeft ? const Radius.circular(65.0) : Radius.zero,
        topRight: isLeft ? Radius.zero : const Radius.circular(65.0),
      ),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Image.asset(assetIcon, height: 22.33, color: isActive ? Colors.white : Colors.white38),
      ),
    );
  }
}
