class ProjectModel {
  final String projectName;
  final String urlSufix;
  final List<String> fileImage;
  ProjectModel({
    required this.projectName,
    required this.urlSufix,
    required this.fileImage,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'projectName': projectName});
    result.addAll({'urlSufix': urlSufix});
    result.addAll({'fileImage': fileImage});

    return result;
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectName: map['projectName'] ?? '',
      urlSufix: map['urlSufix'] ?? '',
      fileImage: List<String>.from(map['fileImage']),
    );
  }
}
