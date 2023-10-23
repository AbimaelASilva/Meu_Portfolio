// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/controllers.dart';
import '../../../ui.dart';

class TopMenuOptions extends StatelessWidget {
  const TopMenuOptions({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: MediaQuery.sizeOf(context).width * 0.4,
      child: ProContainer(
        backgroundColor: ProColors.blackLight,
        borderRadius: ProRadius.proRadiusAll20,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: ProSpaces.proSpaces22,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => _menuTileOption(
                  index: 0,
                  icon: Icons.person,
                  name: 'label_about_me'.tr,
                  isSelected: controller.selectedIndex == 0,
                ),
              ),
              Obx(
                () => _menuTileOption(
                  index: 1,
                  icon: Icons.work,
                  name: 'label_work'.tr,
                  isSelected: controller.selectedIndex == 1,
                ),
              ),
              Obx(
                () => _menuTileOption(
                  index: 2,
                  icon: Icons.contact_emergency,
                  name: 'label_work'.tr,
                  isSelected: controller.selectedIndex == 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menuTileOption({
    required IconData? icon,
    required String name,
    required int index,
    required bool isSelected,
  }) {
    return InkWell(
      child: SizedBox(
        width: 80,
        child: ProContainer(
          backgroundColor: isSelected ? ProColors.orangeMedium : null,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? ProColors.white : ProColors.grayDark,
              ),
              Text(
                name,
                style: ProTextStyles.medium12.copyWith(
                  color: isSelected ? ProColors.white : ProColors.grayDark,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
      onTap: () => controller.setIndexPage = index,
    );
  }
}
