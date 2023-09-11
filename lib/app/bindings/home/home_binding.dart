import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../data/data.dart';

import '../../controllers/controllers.dart';

///
class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final dio = Dio();
    final provider = WorkProvider(dio);
    Get
      ..lazyPut(() => WorkController(provider))
      ..lazyPut(() => HomeController());
  }
}
