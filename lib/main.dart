import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/bindings/bindings.dart';

import 'app/translations/pro_translations.dart';

import 'app/ui/templates/templates.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfólio Abimael',
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: ProTranslations(),
      initialBinding: HomeBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeTemplate(),
    );
  }
}
