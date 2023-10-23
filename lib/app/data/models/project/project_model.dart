class ProjectModel {
  final String projectName;
  final String urlSufix;
  final bool isMobileProject;
  final List<String> fileImage;
  final List<String> contents;
  final String urlDemo;
  final String urlGit;
  final String description;
  ProjectModel({
    required this.projectName,
    required this.urlSufix,
    required this.isMobileProject,
    required this.fileImage,
    required this.contents,
    required this.urlDemo,
    required this.urlGit,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'projectName': projectName});
    result.addAll({'urlSufix': urlSufix});
    result.addAll({'urlSufix': isMobileProject});
    result.addAll({'fileImage': fileImage});
    result.addAll({'urlDemo': urlDemo});
    result.addAll({'urlDemo': urlGit});
    result.addAll({'description': description});

    return result;
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectName: map['projectName'] ?? '',
      urlSufix: map['urlSufix'] ?? '',
      isMobileProject: map['isMobileProject'] ?? true,
      fileImage: <String>[...map['fileImage'] ?? []].map((e) => e).toList(),
      contents: <String>[...map['contents'] ?? []].map((e) => e).toList(),
      urlDemo: map['urlDemo'] ?? '',
      urlGit: map['urlGit'] ?? '',
      description: map['description'] ?? '',
    );
  }
}
