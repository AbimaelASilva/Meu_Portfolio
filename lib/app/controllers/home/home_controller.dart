import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final _pageController = PageController().obs;

  PageController get pageController => _pageController.value;

  final _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  set setIndexPage(int index) {
    _selectedIndex.value = index;

    _pageController.value.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  Future<void> openUrl(String param) async {
    final Uri url = Uri.parse(param);
    if (!await launchUrl(url,)) {
      throw Exception('Could not launch $url');
    }
  }
}
