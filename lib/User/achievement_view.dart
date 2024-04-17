import 'package:artify_app/User/saved_artist_view_pr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'artist_view.dart';

class AchievementView extends StatefulWidget {
  const AchievementView({super.key});

  @override
  State<AchievementView> createState() => _AchievementViewState();
}

class _AchievementViewState extends State<AchievementView> {
  var feature = "abc";

  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Color.fromRGBO(191, 68, 116, 1),
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(
            'Acheivements',
            style: TextStyle(
                color: Color.fromRGBO(191, 68, 116, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feature.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Colors.cyan.shade50,
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/Vector.png', // Replace with your image path
                              width: 24, // Adjust image size as needed
                              height: 24,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shared a collaboration work with Asianet',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 14,
                                  color: Color.fromRGBO(42, 40, 40, 1)),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Asianet Film Award',
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: _launchUrl,
                              icon: Icon(
                                CupertinoIcons.link,
                                size: 34,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
