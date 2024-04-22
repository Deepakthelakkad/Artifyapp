import 'dart:io';

import 'package:artify_app/Artists/schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: _imageFile != null
                                    ? FileImage(_imageFile!)
                                    : const AssetImage('assets/AMLU.png')
                                        as ImageProvider<Object>,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .04,
                        ),
                        Column(
                          children: [
                            Text(
                              "Amaleswar",
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Dancer",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  "3y exp",
                                  style: GoogleFonts.ubuntu(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                        height: 120,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Enter your payment',
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter your Bio",
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Enter your Name",
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Date of Birth",
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Other Account link",
                            labelStyle: GoogleFonts.ubuntu(
                                color: Colors.grey, fontSize: 20)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
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
    );
  }
}
