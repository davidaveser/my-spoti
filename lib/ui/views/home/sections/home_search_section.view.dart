import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';
import 'package:my_spoti/constants/enums.constants.dart';
import 'package:my_spoti/stores/search_store/search.store.dart';
import 'package:my_spoti/ui/widgets/album_item.widget.dart';
import 'package:my_spoti/ui/widgets/artist_item.widget.dart';
import 'package:my_spoti/ui/widgets/subtitle.widget.dart';
import 'package:provider/provider.dart';

class HomeSearchSectionView extends StatelessWidget {
  const HomeSearchSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchStore = Provider.of<SearchStore>(context);

    return Scaffold(
      body: Stack(
        children: [
          // > List of results
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 130.0),

                const SubtitleWidget(subtitle: 'Artist'),

                // Artist List
                SizedBox(
                  width: double.infinity,
                  child: Observer(
                    builder: (_) => Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 26.0,
                      runSpacing: 22.0,
                      children: List.generate(searchStore.artistListResult.length, (index) {
                        final artist = searchStore.artistListResult[index];

                        return ArtistItemWidget(
                          imageUrl: artist.images?.firstWhere((image) => image.imageSize == SpotifyImageSizes.big).url,
                          name: artist.name,
                          onTap: () {},
                        );
                      }),
                    ),
                  ),
                ),

                const SubtitleWidget(subtitle: 'Albums'),

                // Albums List
                SizedBox(
                  width: double.infinity,
                  child: Observer(
                    builder: (_) => Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 26.0,
                      runSpacing: 20.0,
                      children: List.generate(searchStore.albumListResult.length, (index) {
                        final album = searchStore.albumListResult[index];
                        return AlbumItemWidget(
                          imageUrl: album.images?.firstWhere((image) => image.imageSize == SpotifyImageSizes.big).url,
                          albumName: album.name,
                          artistName: album.artists.map((artist) => artist.name).toList().toString(),
                          onTap: () {},
                        );
                      }),
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
