import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class HomeSearchSectionView extends StatelessWidget {
  const HomeSearchSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 100),

        Blur(
          colorOpacity: 0.15,
          // borderRadius: BorderRadius.only(topLeft: Radius.circular(65.0), topRight: Radius.circular(65.0)),
          overlay: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          child: SizedBox(width: double.infinity, height: 69.0),
        ),


      ],
    );
  }
}
