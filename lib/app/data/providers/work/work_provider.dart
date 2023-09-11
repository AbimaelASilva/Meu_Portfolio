import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../data.dart';
import '../../../config_app.dart';

class WorkProvider {
  final Dio _dio;

  WorkProvider(this._dio);

  Future<List<GitResponseModel>> getMyPublicGitRepositories() async {
    try {
      final response = await _dio.get(ConfigApp.gitUrlRepos);

      final data = response.data;

      return <Map<String, dynamic>>[...data ?? []]
          .map((e) => GitResponseModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProjectModel>> getProjectsData() async {
    try {
      final response = await rootBundle
          .loadString('lib/app/data/projects-data/data_json.json');
      final decoded = jsonDecode(response);

      return <Map<String, dynamic>>[...decoded ?? []]
          .map<ProjectModel>((e) => ProjectModel.fromMap(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
