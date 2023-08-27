import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import 'side_bar.dart';
import 'top_menu_options.dart';

import '../../ui.dart';

class HomeTemplate extends GetView<HomeController> {
  HomeTemplate({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 980;
      final width = constraints.maxWidth;
      return Scaffold(
        key: _key,
        backgroundColor: ProColors.graySoft,
        drawerEnableOpenDragGesture: true,
        drawer: isMobile
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SideBar(),
              )
            : null,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 50),
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
                  if (!isMobile) const SideBar(),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          height: 100,
                          child: TopMenuOptions(controller: controller),
                        ),
                        LimitedBox(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.4,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: _musicListWidget(context),
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

  Widget _musicListWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ProContainer(
        height: 700,
        backgroundColor: ProColors.white,
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.sizeOf(context).width * 0.05,
          ).copyWith(top: ProSpaces.proSpaces20),
          child: Obx(
            () => PageView.builder(
              controller: controller.pageController,
              itemCount: pagesList.length,
              itemBuilder: (context, index) {
                final page = pagesList[index];
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

  List<Widget> get pagesList => [
        const AboutMeTemplate(),
        const WorkTemplate(),
      ];
}
