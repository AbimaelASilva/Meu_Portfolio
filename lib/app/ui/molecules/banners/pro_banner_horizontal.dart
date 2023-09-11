import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'pro_carousel.dart';
import '../image/image.dart';

import '../../../data/data.dart';
import '../../atoms/atoms.dart';

class ProBannerHorizontal extends StatelessWidget {
  const ProBannerHorizontal({
    Key? key,
    required this.bannerList,
    required this.widthImage,
    required this.heightImage,
    this.autoPlay = true,
    this.canEditImage = false,
    required this.onTap,
    this.borderRadius = ProRadius.proRadiusAll16,
    this.onPressedNewImage,
    this.onPressedEditImage,
    this.onPressedDeleteImage,
    this.editImageComponent,
  }) : super(key: key);

  final List<BannerModel> bannerList;
  final double widthImage;
  final double heightImage;
  final Function(BannerModel) onTap;
  final Function()? onPressedNewImage;
  final Function(BannerModel)? onPressedEditImage;
  final Function(BannerModel)? onPressedDeleteImage;
  final bool autoPlay;
  final bool canEditImage;
  final BorderRadius? borderRadius;
  final Widget Function({
    required BannerModel banner,
    required BuildContext context,
  })? editImageComponent;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: bannerList.isEmpty,
      replacement: ProCarousel(
        autoPlay: autoPlay,

        height: heightImage,
        items: [
          ...bannerList.map(
            (banner) => GestureDetector(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: ClipRRect(
                        borderRadius: borderRadius,
                        child: ProImageNetworkWeb(
                          imageUrl: banner.url,
                        )),
                  ),
                  if (canEditImage && editImageComponent != null)
                    editImageComponent!(banner: banner, context: context)
                  //  _editImageComponent(banner, context),
                  /*   Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: ProPadding.all4,
                              width: ProSpaces.proSpaces24,
                              height: ProSpaces.proSpaces24,
                              child: ProRoundedContainer(
                                borderColor: ProColors.white,
                                borderRadius: ProRadius.proRadiusAll100,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    ProIconsFont.imageplus,
                                    color: ProColors.red,
                                    size: 14,
                                  ),
                                  onPressed: onPressedNewImage,
                                ),
                              ),
                            ),
                            Container(
                              margin: ProPadding.all4,
                              width: ProSpaces.proSpaces24,
                              height: ProSpaces.proSpaces24,
                              child: ProRoundedContainer(
                                borderColor: ProColors.white,
                                borderRadius: ProRadius.proRadiusAll100,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.pen,
                                    color: ProColors.red,
                                    size: 14,
                                  ),
                                  onPressed: () => onPressedEditImage!(banner),
                                ),
                              ),
                            ),
                            Container(
                              margin: ProPadding.all4,
                              width: ProSpaces.proSpaces24,
                              height: ProSpaces.proSpaces24,
                              child: ProRoundedContainer(
                                borderColor: ProColors.white,
                                borderRadius: ProRadius.proRadiusAll100,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const FaIcon(
                                    FontAwesomeIcons.xmark,
                                    color: ProColors.red,
                                    size: 14,
                                  ),
                                  onPressed: () =>
                                      onPressedDeleteImage!(banner),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    */
                ],
              ),
              onTap: () => onTap(banner),
            ),
          )
        ],
        // onTap: ,
      ),
      child: Shimmer.fromColors(
        baseColor: ProColors.orangeMedium.withOpacity(0.7),
        highlightColor: ProColors.grayMedium.withOpacity(0.2),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(height: heightImage),
        ),
      ),
    );
  }
}
