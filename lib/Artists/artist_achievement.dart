import 'package:artify_app/Artists/add_achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ArtistAchievement extends StatefulWidget {
  const ArtistAchievement({super.key});

  @override
  State<ArtistAchievement> createState() => _ArtistAchievementState();
}

class _ArtistAchievementState extends State<ArtistAchievement> {


  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection("Achieveadd").get(),
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
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
              padding: const EdgeInsets.only(left: 70),
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
          floatingActionButton: Padding(
            padding: EdgeInsets.all(16.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAchievement()));
                },
                child: Container(
                    height: 33,
                    width: 81,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(123, 191, 69, 1),
                          Color.fromRGBO(126, 203, 64, 1),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
                      child: Text('Add+',
                          style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white

                          )),
                    ))),
          ),
        );
      },

    );
  }
}
