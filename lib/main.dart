import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';
import 'package:my_spoti/constants/providers.constants.dart';
import 'package:my_spoti/ui/views/home/home.view.dart';
import 'package:my_spoti/ui/views/login.view.dart';
import 'package:my_spoti/utils/oauth2.util.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget initialRoute = const LoginView();

  Future<void> loginCheck() async {
    if (await OAuth2SpotifyUtil.isTokenActive()) {
      setState(() {
        initialRoute = const HomeView();
      });
    }
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      loginCheck();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Providers.providers,
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
        statusBarColor: Colors.white.withOpacity(0.01),
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
        child: MaterialApp(
          title: 'My Spoti Search',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: CustomColors.background,
          ),
          debugShowCheckedModeBanner: false,
          home: initialRoute,
        ),
      ),
    );
  }
}
