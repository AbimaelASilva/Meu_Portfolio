// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

import '../../../../config_app.dart';
import '../../../../controllers/controllers.dart';
import '../../../ui.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: 400,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: ProContainer(
              height: 700,
              backgroundColor: ProColors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                        horizontal: ProSpaces.proSpaces24)
                    .copyWith(
                  top: 114,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: ProSpaces.proSpaces22,
                      ).copyWith(top: 90),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _sideMenuHorizontallOption(
                            icon: ProIcons.github,
                            onTap: () => controller.openUrl(
                              ConfigApp.gitUrl,
                            ),
                          ),
                          _sideMenuHorizontallOption(
                            icon: ProIcons.linkedin,
                            onTap: () => controller.openUrl(
                              ConfigApp.linkedinUrl,
                            ),
                          ),
                          _sideMenuHorizontallOption(
                            icon: ProIcons.whatsapp,
                            onTap: () => controller.openUrl(
                              ConfigApp.whatsappUrl,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProContainer(
                      height: 300,
                      backgroundColor: ProColors.graySoft,
                      child: Padding(
                        padding: const EdgeInsets.all(ProSpaces.proSpaces30),
                        child: Column(
                          children: [
                            _sideMenuVerticalOption(
                              icon: Icons.phone_android,
                              title: 'Phone',
                              subTitle: '+55 73-99958.6629',
                            ),
                            _sideMenuVerticalOption(
                              icon: Icons.mail,
                              title: 'Email',
                              subTitle: 'abimael.rza@gmail.com',
                            ),
                            _sideMenuVerticalOption(
                              icon: Icons.place_rounded,
                              title: 'Endereço',
                              subTitle: 'Gandu-Ba, Brasil',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const ConverPhoto(),
        ],
      ),
    );
  }

  Widget _sideMenuHorizontallOption({
    required IconData? icon,
    required Function()? onTap,
  }) {
    return InkWell(
      child: SizedBox(
        width: 60,
        child: ProContainer(
          backgroundColor: ProColors.graySoft,
          height: 60,
          child: Icon(
            icon,
            color: ProColors.orangeMedium,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _sideMenuVerticalOption({
    required IconData? icon,
    required String title,
    required String subTitle,
  }) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              leading: Icon(
                icon,
                color: ProColors.orangeMedium,
              ),
              title: Padding(
                padding: const EdgeInsets.only(
                  left: ProSpaces.proSpaces8,
                ),
                child: Text(
                  title,
                  style: ProTextStyles.semiBold14
                      .copyWith(color: ProColors.grayMedium),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                  left: ProSpaces.proSpaces8,
                ),
                child: Text(
                  subTitle,
                  style: ProTextStyles.semiBold14
                      .copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          const Divider(
            height: 2,
          ),
        ],
      ),
    );
  }
}
