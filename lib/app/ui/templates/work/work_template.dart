import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_abimael/app/config_app.dart';

import '../../../controllers/controllers.dart';

import '../../ui.dart';

class WorkTemplate extends GetView<WorkController> {
  const WorkTemplate({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WorkController>(
        init: controller,
        builder: (_) {
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
                  'label_what_ive_already_done'.tr,
                  style: ProTextStyles.bold32,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: ProSpaces.proSpaces8,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.projectList.length,
                  itemBuilder: (context, index) {
                    final project = controller.projectList[index];
                    final height = index == controller.projectList.length - 1
                        ? 300.0
                        : 500.0;
                    final width = index == controller.projectList.length - 1
                        ? 500.0
                        : 300.0;

                    return ProContainer(
                      backgroundColor: ProColors.graySoft,
                      child: Padding(
                        padding: const EdgeInsets.all(ProSpaces.proSpaces16),
                        child: Column(
                          children: [
                            Text(
                              project.projectName,
                              style: ProTextStyles.bold22,
                              textAlign: TextAlign.justify,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: ProSpaces.proSpaces10),
                              child: ProCarousel(
                                autoPlay: false,
                                height: height,
                                items: project.fileImage.map((sufixUrlImage) {
                                  final urlImage =
                                      "${ConfigApp.storgeUrlPrefix}${project.urlSufix}/$sufixUrlImage";
                                  return InkWell(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16)),
                                      child: ProImageNetworkWeb(
                                        height: height,
                                        width: width,
                                        imageUrl: urlImage,
                                      ),
                                    ),
                                    onTap: () {
                                      print('clicou');
                                      _showAlertDialog(context, urlImage);
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  void _showAlertDialog(BuildContext context, urlImage) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: ProImageNetworkWeb(
        height: 500,
        width: 300,
        imageUrl: urlImage,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<Widget> _gitRepoListCards() => controller.gitRepoList
      .map(
        (gitModel) => ProContainer(
            constraints: !isMobile
                ? BoxConstraints(
                    minWidth: Get.width * 0.16,
                    maxWidth: Get.width * 0.16,
                    minHeight: Get.width * 0.16,
                  )
                : null,
            backgroundColor: ProColors.graySoft,
            child: Stack(
              fit: StackFit.loose,
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () => controller.openUrl(gitModel.htmlUrl),
                    icon: const Icon(
                      ProIcons.github,
                      color: ProColors.orangeMedium,
                      size: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ProSpaces.proSpaces24,
                    vertical: ProSpaces.proSpaces10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              gitModel.name.toUpperCase(),
                              style: ProTextStyles.semiBold18
                                  .copyWith(fontWeight: FontWeight.w700),
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: ProSpaces.proSpaces8,
                                bottom: ProSpaces.proSpaces16,
                              ),
                              child: Text(
                                gitModel.description,
                                style: ProTextStyles.regular14,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      )
      .toList();
}
