import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  const ImageCard({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 12,
          offset: Offset.zero,
        )],
        image: DecorationImage(image: AssetImage(this.imagePath),fit: BoxFit.cover)
      ),
    );
  }
}
