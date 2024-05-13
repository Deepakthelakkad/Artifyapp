import 'package:artify_app/Artists/artist_achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAchievement extends StatefulWidget {
  const AddAchievement({super.key});

  @override
  State<AddAchievement> createState() => _AddAchievementState();
}

class _AddAchievementState extends State<AddAchievement> {
  final formkey = GlobalKey<FormState>();
  var content = TextEditingController();
  var title = TextEditingController();
  var link = TextEditingController();
  Future<dynamic> AchieveAdd() async {
    await FirebaseFirestore.instance.collection("Achieveadd").add({
      "Content": content.text,
      "Title": title.text,
      "Link": link.text,
    });
    print('done');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ArtistAchievement()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 23,
                              )),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 70),
                          child: Text(
                            'Add Achievement',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/A14.png'), // Replace with your image path
                      fit: BoxFit.fill),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(68, 160, 196, 1),
                      Color.fromRGBO(98, 118, 128, 1),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170,
              left: 0,
              right: 0,
              child: Container(
                height: 800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Content:',
                              style: GoogleFonts.ubuntu(fontSize: 14)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: content,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Content";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Content',
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Title:',
                              style: GoogleFonts.ubuntu(fontSize: 14)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: title,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Title";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter Title',
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Link:',
                            style: GoogleFonts.ubuntu(fontSize: 14),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: link,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Link Address";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter your link',
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            AchieveAdd();
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 366,
                          child: Center(
                            child: Text(
                              "Submit",
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(69, 159, 195, 1),
                                Color.fromRGBO(81, 162, 194, 1),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
