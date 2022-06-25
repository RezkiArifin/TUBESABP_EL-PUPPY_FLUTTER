import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({Key? key, required this.index, required this.rating}) : super(key: key);

  final int index;
  final int rating;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating?'icon_star.png': 'icon_star_grey.png',
      width: 20,
    );
  }
}