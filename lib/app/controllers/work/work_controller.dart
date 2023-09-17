import 'package:get/get.dart';
import 'package:portfolio_abimael/app/ui/ui.dart';

import '../../helpers/openUrl.dart';
import '../../data/data.dart';

class WorkController extends GetxController {
  WorkController(this._workProvider);
  final WorkProvider _workProvider;

  final _gitRepoList = <GitResponseModel>[].obs;

  final _projectList = <ProjectModel>[].obs;

  List<GitResponseModel> get gitRepoList => _gitRepoList.value;

  List<ProjectModel> get projectList => _projectList.value;

  @override
  void onInit() {
    super.onInit();

    Future.wait([
      _getMyPublicGitRepositories(),
      _getProjectsData(),
    ]);
  }

  Future<void> _getMyPublicGitRepositories() async {
    try {
      _gitRepoList.value = await _workProvider.getMyPublicGitRepositories();
      for (GitResponseModel git in gitRepoList) {
        print('${git.fullName} = ${git.htmlUrl}');
      }
      update();
    } catch (error) {
      proSnackBar(
        title: 'label_ops'.tr,
        message: '${'message_error_request'.tr} - $error',
      );
    }
  }

  Future<void> _getProjectsData() async {
    try {
      _projectList.value = await _workProvider.getProjectsData();
      update();
    } catch (error) {
      proSnackBar(
        title: 'label_ops'.tr,
        message: '${'message_error_request'.tr} - $error',
      );
    }
  }

  Future<void> openUrl(String param) async {
    openUrlHelper(param);
  }
}
