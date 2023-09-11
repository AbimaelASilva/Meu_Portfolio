import 'package:flutter/material.dart';
import '../../../config_app.dart';

class ProImageNetwork extends StatelessWidget {
  const ProImageNetwork({
    super.key,
    this.urlImage,
    this.borderRadius,
    this.fit,
    this.height,
    this.width,
  });

  final String? urlImage;

  final BorderRadiusGeometry? borderRadius;

  final BoxFit? fit;

  final double? height;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 200,
      width: width ?? 200,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: Image.network(
          urlImage ?? ConfigApp.noImage,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    );
  }
}
