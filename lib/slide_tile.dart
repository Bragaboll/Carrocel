import 'package:flutter/material.dart';

class SlideTile extends StatelessWidget {
  const SlideTile({Key? key, required this.image, required this.activePage})
      : super(key: key);
  final dynamic image;
  final bool activePage;

  @override
  Widget build(BuildContext context) {
    final double top = activePage ? 50 : 150;
    final double blur = activePage ? 40 : 0;
    final double offset = activePage ? 20 : 0;
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      margin: EdgeInsets.only(
        top: top,
        bottom: 50,
        right: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:
            // ignore: unnecessary_this
            DecorationImage(image: AssetImage(this.image), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            blurRadius: blur,
            offset: Offset(offset, offset),
          ),
        ],
      ),
    );
  }
}
