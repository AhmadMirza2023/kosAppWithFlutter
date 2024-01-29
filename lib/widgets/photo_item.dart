import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  PhotoItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imageUrl,
        fit: BoxFit.cover,
        width: 110,
      ),
    );
  }
}
