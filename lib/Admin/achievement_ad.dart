import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class AchievementAd extends StatefulWidget {
  const AchievementAd({super.key});

  @override
  State<AchievementAd> createState() => _AchievementAdState();
}
List<Color> color = [
  Color(0XFFE9EAF4),
  Color(0XFFFFEEEA),
  Color(0XFFCDF2E0),
  Color(0XFFF4EEE1),
  Color(0XFFEBFAFE),
  Color(0XFFE9EAF4),
  Color(0XFFFFEEEA),
  Color(0XFFCDF2E0),
  Color(0XFFF4EEE1),
  Color(0XFFEBFAFE),
];
class _AchievementAdState extends State<AchievementAd> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("Achieveadd").get(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Text("Error${snapshot.error}");
      }
      final achieve = snapshot.data?.docs ?? [];
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
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              'Acheivements',
              style: TextStyle(
                  color: Color.fromRGBO(191, 68, 116, 1),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: achieve.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: color[index],
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
                              'assets/Vector.png',
                              // Replace with your image path
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
                              achieve[index]["Content"],
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
                              achieve[index]["Title"],
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Link(
                              uri: Uri.parse(achieve[index]["Link"]),
                              builder: (context, followLink) =>
                                  TextButton(
                                      onPressed: followLink,
                                      child: Text(
                                        "click to view",
                                        style: TextStyle(
                                            color: Colors.blue),
                                      )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }
    );
  }
}
