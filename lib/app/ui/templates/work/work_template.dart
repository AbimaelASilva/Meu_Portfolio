import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui.dart';

class WorkTemplate extends StatelessWidget {
  const WorkTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ProContainer(
      height: 700,
      backgroundColor: ProColors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          Text(
            'label_work'.tr.toUpperCase(),
            style: ProTextStyles.bold40,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: ProSpaces.proSpaces8,
              bottom: ProSpaces.proSpaces16,
            ),
            child: Text(
              'message_about_me'.tr,
              style: ProTextStyles.regular16,
              textAlign: TextAlign.justify,

              //  overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            'label_what_i_do'.tr,
            style: ProTextStyles.bold32,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: ProSpaces.proSpaces8,
            ),
            child: ProContainer(
                // height: 170,
                backgroundColor: ProColors.graySoft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ProSpaces.proSpaces24,
                    vertical: ProSpaces.proSpaces10,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.app_settings_alt_sharp,
                            color: ProColors.orangeMedium,
                            size: 24,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: ProSpaces.proSpaces10,
                              ),
                              child: Text(
                                'label_app_development'.tr,
                                style: ProTextStyles.bold22,
                                textAlign: TextAlign.start,
                                //  overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: ProSpaces.proSpaces8,
                          bottom: ProSpaces.proSpaces16,
                        ),
                        child: Text(
                          'message_app_development'.tr,
                          style: ProTextStyles.regular14,
                          textAlign: TextAlign.justify,

                          //  overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
