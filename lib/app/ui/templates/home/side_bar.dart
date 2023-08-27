import 'package:flutter/material.dart';
import 'package:portfolio_abimael/app/ui/ui.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
                    Text(
                      'Abimael Andrade',
                      style: ProTextStyles.bold28,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: ProSpaces.proSpaces8,
                      ),
                      child: Text(
                        'Mobile/Web Apps Developer ',
                        style: ProTextStyles.medium12.copyWith(
                            fontSize: ProFontSizes.size16,
                            color: ProColors.grayMedium),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: ProSpaces.proSpaces22,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 60,
                            child: ProContainer(
                              backgroundColor: ProColors.graySoft,
                              height: 60,
                              child: const Icon(
                                Icons.place,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: ProContainer(
                              backgroundColor: ProColors.graySoft,
                              height: 60,
                              child: const Icon(
                                Icons.account_box_rounded,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: ProContainer(
                              backgroundColor: ProColors.graySoft,
                              height: 60,
                              child: const Icon(
                                Icons.admin_panel_settings_sharp,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: ProContainer(
                              backgroundColor: ProColors.graySoft,
                              height: 60,
                              child: const Icon(
                                Icons.airplanemode_active,
                              ),
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
                            _menuTileOption(
                              icon: Icons.phone_android,
                              title: 'Phone',
                              subTitle: '+55 73-99958.6629',
                            ),
                            _menuTileOption(
                              icon: Icons.mail,
                              title: 'Email',
                              subTitle: 'abimael.rza@gmail.com',
                            ),
                            _menuTileOption(
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
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 200,
              width: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://media.licdn.com/dms/image/D4D03AQGgXuTqj-WbXQ/profile-displayphoto-shrink_800_800/0/1693089649934?e=1698278400&v=beta&t=0uoKKaA6YCbEkMfRyNvZD6tHXdSvUL4StiHYtTKPPtE',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuTileOption({
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
