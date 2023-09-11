import 'package:url_launcher/url_launcher.dart';

Future<void> openUrlHelper(String param) async {
  final Uri url = Uri.parse(param);
  if (!await launchUrl(
    url,
  )) {
    throw Exception('Could not launch $url');
  }
}
