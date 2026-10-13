import 'package:flutter/material.dart';

// Small reusable widget that loads a network image safely:
// - shows a spinner while loading
// - shows an icon if the image fails (e.g. no internet)
class ProductImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  const ProductImage({super.key, required this.url, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child; // finished loading
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(Icons.image_not_supported, color: Colors.grey, size: 40),
          ),
        );
      },
    );
  }
}
