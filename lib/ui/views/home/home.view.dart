import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/constants/assets_path.constants.dart';
import 'package:my_spoti/constants/enums.constants.dart';
import 'package:my_spoti/stores/app_state.store.dart';
import 'package:my_spoti/ui/views/home/sections/home_search_section.view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateStore>(context);

    return Scaffold(
      body: Observer(builder: (_) {
        if (appState.isSearchSectionSelected) {
          return const HomeSearchSectionView();
        }
        return const HomeSearchSectionView();
      }),

      // Bootom navigation
      floatingActionButton: Blur(
        colorOpacity: 0.15,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(65.0), topRight: Radius.circular(65.0)),
        overlay: Observer(
          builder: (dynamic _) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Home selection
              SectionButtonWidget(
                assetIcon: AssetsPath.homeMainSectionIcon,
                isActive: appState.isMainSectionSelected,
                onTap: () => appState.homeSectionSelected = AppSections.homeMain,
              ),

              // Search selection
              SectionButtonWidget(
                assetIcon: AssetsPath.homeSearchSectionIcon,
                isActive: appState.isSearchSectionSelected,
                onTap: () => appState.homeSectionSelected = AppSections.homeSearch,
                isLeft: false,
              ),
            ],
          ),
        ),
        child: const SizedBox(width: double.infinity, height: 69.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/// Widget for item the differents sections of the app.
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
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Image.asset(assetIcon, height: 22.33, color: isActive ? Colors.white : Colors.white38),
      ),
    );
  }
}
