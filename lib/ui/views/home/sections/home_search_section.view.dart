import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';
import 'package:my_spoti/stores/album_store/album.store.dart';
import 'package:my_spoti/stores/artist_store/artist.store.dart';
import 'package:my_spoti/stores/search_store/search.store.dart';
import 'package:my_spoti/ui/views/home/album_datails.view.dart';
import 'package:my_spoti/ui/views/home/artist_details.view.dart';
import 'package:my_spoti/ui/widgets/album_item.widget.dart';
import 'package:my_spoti/ui/widgets/artist_item.widget.dart';
import 'package:my_spoti/ui/widgets/subtitle.widget.dart';
import 'package:provider/provider.dart';

class HomeSearchSectionView extends StatefulWidget {
  const HomeSearchSectionView({Key? key}) : super(key: key);

  @override
  State<HomeSearchSectionView> createState() => _HomeSearchSectionViewState();
}

class _HomeSearchSectionViewState extends State<HomeSearchSectionView> {
  final TextEditingController _textController = TextEditingController();
  late SearchStore searchStore;
  late ArtistStore artistStore;
  late AlbumStore albumStore;

  @override
  void didChangeDependencies() {
    searchStore = Provider.of<SearchStore>(context);
    artistStore = Provider.of<ArtistStore>(context);
    albumStore = Provider.of<AlbumStore>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Observer(builder: (_) => _currentWidget),

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
          controller: _textController,
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
          onChanged: (value) {
            if (value.isEmpty) {
              searchStore.cleanStore();
            }
          },
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              searchStore.getSearchResults(value);
            }
          },
        ),
      ),
    );
  }

  Widget get _currentWidget {
    // > Loading widget
    if (searchStore.loadind) {
      return Center(
        child: CircularProgressIndicator(color: CustomColors.primaryDark, strokeWidth: 4.5),
      );
    }

    // > Server error widget
    if (searchStore.searchLoadingError) {
      return const Center(
        child: Text(
          'Server error, please try again.',
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      );
    }

    // > Initial search indication widget
    if (searchStore.artistListResult.isEmpty && searchStore.albumListResult.isEmpty) {
      return const Center(
        child: Text(
          'Your search will be displayed  here.',
          style: TextStyle(fontSize: 14.0, color: Colors.white),
        ),
      );
    }

    // > List of results
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 70.0),

          const SubtitleWidget(subtitle: 'Artist'),

          // Artist List
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 26.0,
              runSpacing: 22.0,
              children: List.generate(searchStore.artistListResult.length, (index) {
                final artist = searchStore.artistListResult[index];

                return ArtistItemWidget(
                  imageUrl: artist.images?.isNotEmpty == true
                      ? artist.images?.first.url ?? 'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png'
                      : 'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png',
                  name: artist.name,
                  onTap: () {
                    artistStore.setArtistToDesplay(artist);
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const ArtistDetailsView(),
                      ),
                    );
                  },
                );
              }),
            ),
          ),

          const SubtitleWidget(subtitle: 'Albums'),

          // Albums List
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 26.0,
              runSpacing: 20.0,
              children: List.generate(searchStore.albumListResult.length, (index) {
                final album = searchStore.albumListResult[index];
                return AlbumItemWidget(
                  imageUrl: album.images?.isNotEmpty == true
                      ? album.images?.first.url ?? 'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png'
                      : 'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png',
                  albumName: album.name,
                  artistName: album.artists.map((artist) => artist.name).toList().toString(),
                  onTap: () {
                    albumStore.setAlbumToDesplay(album);
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const AlbumDetails(),
                      ),
                    );
                  },
                );
              }),
            ),
          ),

          const SizedBox(height: 90.0),
        ],
      ),
    );
  }
}
