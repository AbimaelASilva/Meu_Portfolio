import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:portfolio_abimael/app/ui/atoms/atoms.dart';

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
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          ProSpaces.proSpaces16,
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: HtmlElementView(
          viewType: imageUrl,
        ),
      ),
    );
  }
}
