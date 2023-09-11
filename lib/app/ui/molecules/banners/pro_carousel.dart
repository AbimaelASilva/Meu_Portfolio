import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

import '../../atoms/atoms.dart';

class ProCarousel extends StatefulWidget {
  const ProCarousel({
    required this.items,
    this.height = 150,
    this.autoPlay = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final List<Widget> items;
  final double height;
  final bool autoPlay;
  final Function? onTap;

  @override
  State<ProCarousel> createState() => _ProCarouselState();
}

class _ProCarouselState extends State<ProCarousel> {
  int _current = 0;
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 0,
            child: CarouselSlider(
              items: widget.items,
              carouselController: carouselController,
              options: CarouselOptions(
                height: widget.height,
                autoPlay: widget.autoPlay,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 600),
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                aspectRatio: 2.9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: widget.height * 0.1,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.asMap().entries.map((entry) {
                return Flexible(
                  child: GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 26 : 14,
                      height: 10,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          color: _current == entry.key
                              ? ProColors.orangeMedium
                              : ProColors.grayLight,
                          borderRadius: ProRadius.proRadiusAll6),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
