import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';

import '../../ui.dart';

class HomeTemplate extends GetView<HomeController> {
  HomeTemplate({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 980;

      final width = constraints.maxWidth;

      const paddingMoobile = 16.0;

      final paddingDesktop = width > 1380 ? width * 0.20 : width * 0.05;

      return Scaffold(
        key: _key,
        backgroundColor: ProColors.black,
        drawerEnableOpenDragGesture: true,
        drawer: isMobile
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SideBar(
                  controller: controller,
                ),
              )
            : null,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: isMobile ? paddingMoobile : paddingDesktop,
              vertical: 50),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isMobile)
                    ProIconButton(
                      iconSize: ProFontSizes.size32,
                      icon: Icons.menu,
                      iconColor: ProColors.orangeMedium,
                      onPressed: () => _key.currentState!.openDrawer(),
                    ),
                  if (!isMobile)
                    SideBar(
                      controller: controller,
                    ),
                  Expanded(
                    child: Column(
                      children: [
                        if (isMobile)
                          const Padding(
                            padding:
                                EdgeInsets.only(bottom: ProSpaces.proSpaces20),
                            child: ConverPhoto(),
                          ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          height: 100,
                          child: TopMenuOptions(controller: controller),
                        ),
                        LimitedBox(
                          maxWidth: width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _pageViewList(context, isMobile),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _pageViewList(BuildContext context, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ProContainer(
        borderRadius: ProRadius.proRadiusAll16,
        height: 700,
        backgroundColor: ProColors.blackLight,
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.sizeOf(context).width * 0.02,
          ).copyWith(top: ProSpaces.proSpaces20),
          child: Obx(
            () => PageView.builder(
              controller: controller.pageController,
              itemCount: _pagesList(isMobile).length,
              itemBuilder: (context, index) {
                final page = _pagesList(isMobile)[index];
                return page;
              },
              onPageChanged: (index) {
                controller.setIndexPage = index;
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _pagesList(bool iMobile) => [
        WorkTemplate(isMobile: iMobile),
        const AboutMeTemplate(),
      ];
}
