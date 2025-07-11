import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  final String url;
  final double size;

  const CommonNetworkImage({
    super.key,
    required this.url,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: size,
          height: size,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          width: size,
          height: size,
          child: const Center(child: Icon(Icons.error)),
        );
      },
    );
  }
}
