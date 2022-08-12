import 'package:flutter/material.dart';

class TrackItemWidget extends StatelessWidget {
  const TrackItemWidget({Key? key, this.text = '', this.onTap, this.isSecundary = true}) : super(key: key);

  final String text;
  final void Function()? onTap;
  final bool isSecundary;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(19)),
          boxShadow: [
            BoxShadow(
              color: isSecundary ? Colors.white.withOpacity(0.5) : Colors.black.withOpacity(0.5),
              offset: const Offset(1.5, 3.5),
              blurRadius: 4,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 10.0, bottom: 5.0),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'WorkSans',
            fontSize: isSecundary ? 15 : 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            height: 1.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
