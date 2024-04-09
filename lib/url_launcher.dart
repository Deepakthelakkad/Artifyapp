import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class UrlLauncher extends StatefulWidget {
  const UrlLauncher({super.key});

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {

  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
