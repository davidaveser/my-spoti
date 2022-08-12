import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';
import 'package:my_spoti/ui/widgets/album_item.widget.dart';

class HomeSearchSectionView extends StatelessWidget {
  const HomeSearchSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // > List of results
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 155.0),

                // Albums List
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 26.0,
                    runSpacing: 20.0,
                    children: List.generate(
                      10,
                      (index) => const AlbumItemWidget(
                        imageUrl: 'https://i.scdn.co/image/ab67616d00001e02f46b9d202509a8f7384b90de',
                        albumName: 'Purpose',
                        artistName: 'Justin Bieber',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 90.0),
              ],
            ),
          ),

          // Top Blur
          const Blur(
            colorOpacity: 0.15,
            blur: 13.0,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0), bottomRight: Radius.circular(60.0)),
            child: SizedBox(width: double.infinity, height: 135.0),
          ),
        ],
      ),

      // Search Input
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 20.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter your artist or album',
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            fillColor: Colors.white,
            filled: true,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.5, color: CustomColors.primaryDark.withOpacity(0.9)),
              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
            ),
          ),
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}
