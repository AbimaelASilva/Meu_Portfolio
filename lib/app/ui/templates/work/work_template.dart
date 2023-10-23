// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config_app.dart';
import '../../../data/data.dart';
import '../../../helpers/helpers.dart';

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
          return SizedBox(
            height: 700,
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'label_work'.tr.toUpperCase(),
                  style: ProTextStyles.bold40.copyWith(color: ProColors.white),
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
                    style: ProTextStyles.regular16
                        .copyWith(color: ProColors.white),
                    textAlign: TextAlign.justify,

                    //  overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Text(
                //   'label_what_ive_already_done'.tr,
                //   style: ProTextStyles.bold32,
                //   textAlign: TextAlign.start,
                //   overflow: TextOverflow.ellipsis,
                // ),
                ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: ProSpaces.proSpaces8,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.projectList.length,
                  itemBuilder: (context, index) {
                    final project = controller.projectList[index];
                    final height = project.isMobileProject ? 500.0 : 300.0;
                    final width = project.isMobileProject ? 300.0 : 500.0;

                    return Stack(
                      children: [
                        ProContainer(
                          backgroundColor: ProColors.blackMedium,
                          child: Padding(
                            padding:
                                const EdgeInsets.all(ProSpaces.proSpaces16),
                            child: Column(
                              children: [
                                Text(
                                  project.projectName,
                                  style: ProTextStyles.bold22.copyWith(
                                    color: ProColors.white,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: ProSpaces.proSpaces10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: project.isMobileProject ? 3 : 2,
                                        child: ProCarousel(
                                          autoPlay: false,
                                          height: height,
                                          items: project.fileImage
                                              .map((sufixUrlImage) {
                                            final urlImage =
                                                "${ConfigApp.storgeUrlPrefix}${project.urlSufix}/$sufixUrlImage";
                                            return InkWell(
                                              child: IgnorePointer(
                                                child: ProImageNetworkWeb(
                                                  height: height,
                                                  width: width,
                                                  imageUrl: urlImage,
                                                ),
                                              ),
                                              onTap: () {
                                                if (project
                                                    .urlDemo.isNotEmpty) {
                                                  openUrlHelper(
                                                      project.urlDemo);
                                                } else {
                                                  _zoomImage(
                                                    context: context,
                                                    urlImage: urlImage,
                                                    project: project,
                                                  );
                                                }
                                              },
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      Flexible(
                                          flex: project.isMobileProject ? 2 : 1,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: ProSpaces.proSpaces16,
                                            ),
                                            child: ListView(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              children: [
                                                Text(
                                                  project.description,
                                                  textAlign: TextAlign.justify,
                                                  style: ProTextStyles.regular16
                                                      .copyWith(
                                                    color: ProColors.white,
                                                  ),
                                                ),
                                                _contentList(project.contents)
                                              ],
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (project.urlGit.isNotEmpty)
                          Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () => openUrlHelper(
                                project.urlGit,
                              ),
                              icon: const Icon(
                                ProIcons.github,
                                color: ProColors.orangeMedium,
                                size: 32,
                              ),
                            ),
                          )
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  Widget _contentList(List<String> contents) => ListView.builder(
        shrinkWrap: true,
        itemCount: contents.length,
        itemBuilder: (context, index) {
          final content = contents[index];

          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(
              Icons.check,
              color: ProColors.orangeMedium,
            ),
            title: Text(
              content,
              style: ProTextStyles.regular16.copyWith(
                color: ProColors.white,
              ),
            ),
          );
        },
      );

  void _zoomImage({
    required BuildContext context,
    required urlImage,
    required ProjectModel project,
  }) {
    final closeButton = TextButton(
      child: Text(
        'label_close'.tr,
        style: ProTextStyles.regular12,
      ),
      onPressed: Get.back,
    );

    final heightFull = MediaQuery.sizeOf(context).height;

    final widthFull = MediaQuery.sizeOf(context).width;

    final height =
        project.isMobileProject ? heightFull * 0.7 : heightFull * 0.6;

    final width = project.isMobileProject ? heightFull * 0.4 : widthFull;

    final alert = AlertDialog(
      title: Text(project.projectName),
      content: SizedBox(
        height: height,
        width: width,
        child: ProCarousel(
          height: MediaQuery.sizeOf(context).height * 0.7,
          items: project.fileImage.map((sufixUrlImage) {
            final urlImage =
                "${ConfigApp.storgeUrlPrefix}${project.urlSufix}/$sufixUrlImage";
            return ProImageNetworkWeb(
              height: height,
              width: width,
              imageUrl: urlImage,
            );
          }).toList(),
        ),
      ),
      actions: [
        closeButton,
      ],
    );

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
