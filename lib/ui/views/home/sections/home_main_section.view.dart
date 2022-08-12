import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/stores/album_store/album.store.dart';
import 'package:my_spoti/stores/home_albums/home_albums.store.dart';
import 'package:my_spoti/ui/views/home/album_datails.view.dart';
import 'package:my_spoti/ui/widgets/album_item.widget.dart';
import 'package:my_spoti/ui/widgets/subtitle.widget.dart';
import 'package:provider/provider.dart';

class HomeMainSectionView extends StatefulWidget {
  const HomeMainSectionView({Key? key}) : super(key: key);

  @override
  State<HomeMainSectionView> createState() => _HomeMainSectionViewState();
}

class _HomeMainSectionViewState extends State<HomeMainSectionView> {
  late HomeAlbumsStore homeAlbumsStore;
  late AlbumStore albumStore;

  @override
  void didChangeDependencies() {
    homeAlbumsStore = Provider.of<HomeAlbumsStore>(context);
    albumStore = Provider.of<AlbumStore>(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      if (homeAlbumsStore.albumListResult.isEmpty) {
        homeAlbumsStore.getHomeAlbums();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            const SubtitleWidget(subtitle: 'New albums every day'),

            // Albums List
            Observer(
              builder: (_) => SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: 20.0,
                  children: List.generate(homeAlbumsStore.albumListResult.length, (index) {
                    final album = homeAlbumsStore.albumListResult[index];
                    return AlbumItemWidget(
                      width: 195.0,
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
            ),

            const SizedBox(height: 90.0),
          ],
        ),
      ),
    );
  }
}
