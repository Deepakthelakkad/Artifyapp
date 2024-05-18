import 'dart:async';
import 'dart:io';

import 'package:artify_app/Artists/schedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileArtist extends StatefulWidget {
  const EditProfileArtist({super.key});

  @override
  State<EditProfileArtist> createState() => _EditProfileArtistState();
}

class _EditProfileArtistState extends State<EditProfileArtist> {
  final picker = ImagePicker();
  File? _imageFile;

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  var ID;
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
    });
    print("done");
  }

  final formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var feeperprogram = TextEditingController();
  var experience = TextEditingController();
  var place = TextEditingController();
  var bio = TextEditingController();
  Future<dynamic> Editart() async {
    await FirebaseFirestore.instance.collection("ArtReg").doc(ID).update({
      "Name": name.text,
      "Fee per program": feeperprogram.text,
      "Experience": experience.text,
      "Place": place.text,
      "Bio": bio.text
    });
    print('done');
    Navigator.pop(context);
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
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 25,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 90,
                              height: 85,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: _imageFile != null
                                      ? FileImage(_imageFile!)
                                      : const AssetImage('assets/pp.png')
                                          as ImageProvider<Object>,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                          height: 50,
                        ),
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter your Name',
                              hintStyle: GoogleFonts.ubuntu(
                                  color: Colors.grey, fontSize: 18)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: bio,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Enter your Bio",
                              hintStyle: GoogleFonts.ubuntu(
                                  color: Colors.grey, fontSize: 18)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: feeperprogram,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Enter your payment",
                              hintStyle: GoogleFonts.ubuntu(
                                  color: Colors.grey, fontSize: 18)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: experience,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Experience",
                              hintStyle: GoogleFonts.ubuntu(
                                  color: Colors.grey, fontSize: 18)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: place,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Place",
                              hintStyle: GoogleFonts.ubuntu(
                                  color: Colors.grey, fontSize: 18)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                Editart();
                              });
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
              Positioned(
                left: 75,
                top: 100,
                child: IconButton(
                  onPressed: () async {
                    await getImage();
                  },
                  icon: Icon(
                    CupertinoIcons.plus_circle_fill,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
