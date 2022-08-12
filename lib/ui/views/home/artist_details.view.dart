import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/constants/assets_path.constants.dart';
import 'package:my_spoti/stores/album_store/album.store.dart';
import 'package:my_spoti/stores/artist_store/artist.store.dart';
import 'package:my_spoti/ui/views/home/album_datails.view.dart';
import 'package:my_spoti/ui/widgets/album_item.widget.dart';
import 'package:my_spoti/ui/widgets/artist_item.widget.dart';
import 'package:my_spoti/ui/widgets/back_button.widget.dart';
import 'package:provider/provider.dart';

class ArtistDetailsView extends StatelessWidget {
  const ArtistDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artistStore = Provider.of<ArtistStore>(context);
    final albumStore = Provider.of<AlbumStore>(context);

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: [
            // > List of albums
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.43),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 26.0,
                      runSpacing: 20.0,
                      children: List.generate(artistStore.artistSelectedAlbums.length, (index) {
                        final album = artistStore.artistSelectedAlbums[index];
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
                  const SizedBox(height: 50.0),
                ],
              ),
            ),

            // > Artist info
            Blur(
              colorOpacity: 0.15,
              blur: 13.0,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60.0), bottomRight: Radius.circular(60.0)),
              overlay: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),

                  // Image and Name
                  ArtistItemWidget(
                    imageUrl: artistStore.artistSelected?.images?.isNotEmpty == true
                        ? artistStore.artistSelected?.images?.first.url ??
                            'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png'
                        : 'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png',
                    name: artistStore.artistSelected?.name ?? '',
                    fontSize: 15.0,
                    onTap: () {},
                  ),

                  const Spacer(),

                  // Followers
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetsPath.followersIcon, width: 10.75),
                      const SizedBox(width: 15.0),
                      Text(
                        '${artistStore.artistSelected?.followers} Followers',
                        style: const TextStyle(fontFamily: 'WorkSans', fontSize: 12.0, color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              child: SizedBox(width: double.infinity, height: MediaQuery.of(context).size.height * 0.4),
            ),

            Align(
              alignment: const Alignment(-0.9, -0.9),
              child: BackButtonWidget(onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),
    );
  }
}
