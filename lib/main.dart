import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';
import 'package:my_spoti/ui/views/login.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Spoti Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: CustomColors.background,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
