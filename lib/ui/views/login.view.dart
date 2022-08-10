import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';
import 'package:my_spoti/ui/views/search.view.dart';
import 'package:my_spoti/utils/oauth2.util.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            // Widget header
            Blur(
              colorOpacity: 0.15,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              child: Container(
                width: double.infinity,
                height: 150.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [CustomColors.primaryDark, CustomColors.primary],
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3),

            // Spotify icon
            Image.asset('assets/general/spotify_icon_green.png', height: 60.0),

            const SizedBox(height: 20.0),

            // Log in button
            ElevatedButton(
              onPressed: () async {
                final bool logged = await OAuth2SpotifyUtil.getAndSaveAccessToken();
                if (logged) {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SearchView(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: CustomColors.spotifyGreen,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60.0))),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
                child: Text(
                  'Log in',
                  style: TextStyle(color: CustomColors.spotifyBlack),
                ),
              ),
            ),

            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
