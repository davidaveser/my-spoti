import 'package:flutter/material.dart';
import 'package:my_spoti/constants/custom_colors.constants.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({
    Key? key,
    this.subtitle = '',
  }) : super(key: key);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, top: 100.0, bottom: 45.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: CustomColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(19.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(1.5, 3.5),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          subtitle,
          style: const TextStyle(
            fontFamily: 'WorkSans',
            color: Colors.white70,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
