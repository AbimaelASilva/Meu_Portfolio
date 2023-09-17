class ProjectModel {
  final String projectName;
  final String urlSufix;
  final bool isMobileProject;
  final List<String> fileImage;
  final String urlDemo;
  final String urlGit;
  ProjectModel({
    required this.projectName,
    required this.urlSufix,
    required this.isMobileProject,
    required this.fileImage,
    required this.urlDemo,
    required this.urlGit,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'projectName': projectName});
    result.addAll({'urlSufix': urlSufix});
    result.addAll({'urlSufix': isMobileProject});
    result.addAll({'fileImage': fileImage});
    result.addAll({'urlDemo': urlDemo});
    result.addAll({'urlDemo': urlGit});

    return result;
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectName: map['projectName'] ?? '',
      urlSufix: map['urlSufix'] ?? '',
      isMobileProject: map['isMobileProject'] ?? true,
      fileImage: List<String>.from(map['fileImage']),
      urlDemo: map['urlDemo'] ?? '',
      urlGit: map['urlGit'] ?? '',
    );
  }
}
