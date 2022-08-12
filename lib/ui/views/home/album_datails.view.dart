import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/stores/album_store/album.store.dart';
import 'package:my_spoti/ui/widgets/back_button.widget.dart';
import 'package:my_spoti/ui/widgets/image.widget.dart';
import 'package:my_spoti/ui/widgets/track_item.widget.dart';
import 'package:provider/provider.dart';

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumStore = Provider.of<AlbumStore>(context);

    return Scaffold(
      body: Observer(
        builder: (_) => Stack(
          children: [
            // > Artist info
            ImageWidget(
              imageUrl: albumStore.albumSelected?.images?.isNotEmpty == true
                  ? albumStore.albumSelected?.images?.first.url ??
                      'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png'
                  : 'https://pixsector.com/cache/8955ccde/avea0c6d1234636825bd6.png',
              width: MediaQuery.of(context).size.height * 0.45,
              borderRadius: 60,
            ),

            Align(
              alignment: const Alignment(-0.9, -0.9),
              child: BackButtonWidget(onPressed: () => Navigator.pop(context)),
            ),
          ],
        ),
      ),

      // Tracks list
      extendBody: true,
      bottomNavigationBar: Blur(
        colorOpacity: 0.15,
        blur: 15.0,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(75.0), topRight: Radius.circular(75.0)),
        overlay: Observer(
          builder: (dynamic _) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 25.0),
                Column(
                  children: List.generate(albumStore.albumSelectedTracks.length, (index) {
                    final track = albumStore.albumSelectedTracks[index];

                    return TrackItemWidget(
                      text: track.name,
                      isSecundary: false,
                      onTap: () {
                        showDialog<dynamic>(
                          context: context,
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.9),
                          builder: (_) => Dialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  children: [
                                    const TrackItemWidget(text: 'name'),
                                    TrackItemWidget(text: albumStore.albumSelected?.name ?? ''),
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    const TrackItemWidget(text: 'artist'),
                                    TrackItemWidget(text: track.artistList),
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    const TrackItemWidget(text: 'duration'),
                                    TrackItemWidget(text: '${(track.durationMs / 60000).toStringAsFixed(2)} mins'),
                                  ],
                                ),
                                Wrap(
                                  children: [
                                    const TrackItemWidget(text: 'track no.'),
                                    TrackItemWidget(text: track.trackNumber.toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
        child: SizedBox(width: double.infinity, height: MediaQuery.of(context).size.height * 0.65),
      ),
    );
  }
}
