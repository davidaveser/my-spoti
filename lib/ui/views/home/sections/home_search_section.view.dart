import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearchSectionView extends StatelessWidget {
  const HomeSearchSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Result List
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 155.0),

                // List
                Column(
                  children: List.generate(
                    100,
                    (index) => Text('data'),
                  ),
                ),
              ],
            ),
          ),

          // Top Blur
          const Blur(
            colorOpacity: 0.15,
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
          decoration: const InputDecoration(
            hintText: 'Enter your artist or album',
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.5, color: CupertinoColors.activeBlue),
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
            ),
          ),
          onSubmitted: (value) {},
        ),
      ),
    );
  }
}
