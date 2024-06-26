import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../core.dart';

class PalmCodesImage extends StatelessWidget {
  const PalmCodesImage({
    super.key,
    required this.url,
    this.padding,
    this.borderRadius,
    this.color = Colors.white,
    this.fit = BoxFit.contain,
    this.aspectRatio = 1,
    this.isLoading = false,
  });

  /// URL to the image.
  /// Has to be a .png file with transparent background.
  final String url;

  /// Padding between image and the blue background
  final EdgeInsets? padding;

  /// Border radius of the image background
  final double? borderRadius;

  /// Image background
  final Color color;

  /// Image background
  final BoxFit fit;

  // Image aspect ratio
  final double aspectRatio;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0).r,
          child: Container(
            color: color,
            padding: padding ?? const EdgeInsets.all(8).r,
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: isLoading == true
                  ? Skeleton.shade(
                      child: Icon(
                        Icons.image,
                        size: constraints.maxWidth * 0.6,
                        color: context.res.colors.lightGray20,
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: url,
                      fit: fit,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Skeleton.shade(
                        child: Icon(
                          Icons.image,
                          size: constraints.maxWidth * 0.6,
                          color: context.res.colors.lightGray20,
                        ),
                      ),

                      errorWidget: (_, __, ___) => Icon(
                        isLoading == true
                            ? Icons.image
                            : Icons.image_not_supported_outlined,
                        size: constraints.maxWidth * 0.6,
                        color: context.res.colors.orange,
                      ),
                      // placeholder: (_, __) => Icon(
                      //   Icons.image_outlined,
                      //   size: constraints.maxWidth * 0.3,
                      //   color: context.res.colors.lightGray20,
                      // ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
