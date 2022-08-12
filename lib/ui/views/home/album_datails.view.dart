import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_spoti/stores/album_store/album.store.dart';
import 'package:my_spoti/ui/widgets/back_button.widget.dart';
import 'package:my_spoti/ui/widgets/image.widget.dart';
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
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(19)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            offset: const Offset(1.5, 3.5),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                      child: Text(
                        track.name,
                        style: const TextStyle(
                          fontFamily: 'WorkSans',
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
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
