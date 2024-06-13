import 'dart:io';

import 'package:artify_app/NormalUser/edit_profile_nr.dart';
import 'package:artify_app/NormalUser/saved_artist_nr.dart';
import 'package:artify_app/NormalUser/settings_nr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class NormalUserProfile extends StatefulWidget {
  const NormalUserProfile({super.key});

  @override
  State<NormalUserProfile> createState() => _NormalUserProfileState();
}

class _NormalUserProfileState extends State<NormalUserProfile> {
  void initState() {
    super.initState();
    getData();
  }

  var ID;
  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      print(ID.toString());
    });
    print('data updated');
  }

  GETDOC() async {
    normaluser =
        await FirebaseFirestore.instance.collection('NormalReg').doc(ID).get();
  }

  PickedFile? _image;
  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = PickedFile(pickedFile.path);
        print("picked image");
        update();
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> update() async {
    try {
      if (_image != null) {
        final ref = firebase_storage.FirebaseStorage.instance
            .ref()
            .child('nruser_images')
            .child(DateTime.now().millisecondsSinceEpoch.toString());
        await ref.putFile(File(_image!.path));

        final imageURL = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('NormalReg')
            .doc(ID)
            .update({
          'path': imageURL,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No image selected'),
          ),
        );
      }
    } catch (e) {
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error updating profile'),
        ),
      );
    }
  }

  DocumentSnapshot? normaluser;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GETDOC(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          body: Stack(children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/A14.png'), // Replace with your image path
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(60, 170, 212, 1),
                          Color.fromRGBO(109, 102, 101, 1),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SettingsNr()));
                                  },
                                  icon: Icon(
                                    CupertinoIcons.square_grid_2x2_fill,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: normaluser!["path"] == "1"
                                  ? ClipOval(
                                      child: Image.asset(
                                        "assets/pp.png",
                                        height: 100,
                                        width: 90,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : ClipOval(
                                      child: Image.network(
                                        normaluser!["path"],
                                        height: 90,
                                        width: 90,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                            ),
                            Text(
                              normaluser!["Name"],
                              style: GoogleFonts.ubuntu(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Card(
                      color: Colors.red.shade50,
                      surfaceTintColor: Colors.deepOrange.shade50,
                      elevation: 4,
                      child: ListTile(
                        leading: Text(
                          "Phone",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: Color.fromRGBO(134, 135, 142, 1)),
                        ),
                        trailing: Text(
                          normaluser!["Phone"],
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(43, 44, 47, 1)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.red.shade50,
                      surfaceTintColor: Colors.deepOrange.shade50,
                      elevation: 4,
                      child: ListTile(
                        leading: Text(
                          "Email",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: Color.fromRGBO(134, 135, 142, 1)),
                        ),
                        trailing: Text(
                          normaluser!["Email"],
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(43, 44, 47, 1)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.red.shade50,
                      surfaceTintColor: Colors.deepOrange.shade50,
                      elevation: 4,
                      child: ListTile(
                        leading: Text(
                          "Address",
                          style: GoogleFonts.ubuntu(
                              fontSize: 15,
                              color: Color.fromRGBO(134, 135, 142, 1)),
                        ),
                        trailing: Text(
                          normaluser!["Address"],
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(43, 44, 47, 1)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedArtistNr()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                            height: 53,
                            width: 330,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(87, 184, 62, 1),
                                  Color.fromRGBO(87, 185, 63, 1),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text('Saved Artists',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      )),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfileNr()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                            height: 53,
                            width: 330,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(191, 69, 113, 1),
                                  Color.fromRGBO(198, 81, 99, 1),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text('Edit Profile',
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                      )),
                ],
              ),
            ),
            Positioned(
              left: 82,
              top: 120,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _getImage();
                  });
                },
                icon: Icon(
                  CupertinoIcons.plus_circle_fill,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
