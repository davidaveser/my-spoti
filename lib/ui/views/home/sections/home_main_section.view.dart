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
      homeAlbumsStore.getHomeAlbums();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70.0),

            const SubtitleWidget(subtitle: 'New albums every day'),

            // Albums List
            Observer(
              builder: (_) => SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 26.0,
                  runSpacing: 20.0,
                  children: List.generate(homeAlbumsStore.albumListResult.length, (index) {
                    final album = homeAlbumsStore.albumListResult[index];
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
            ),

            const SizedBox(height: 90.0),
          ],
        ),
      ),
    );
  }
}
