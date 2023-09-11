import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProImageNetworkWeb extends StatelessWidget {
  const ProImageNetworkWeb({
    super.key,
    required this.imageUrl,
    this.width = 30,
    this.height = 30,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    // https://github.com/flutter/flutter/issues/41563
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(
        viewType: imageUrl,
      ),
    );
  }
}
