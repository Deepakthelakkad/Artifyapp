import 'package:artify_app/Artists/artist_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationArtist extends StatefulWidget {
  const RegistrationArtist({super.key});

  @override
  State<RegistrationArtist> createState() => _RegistrationArtistState();
}

class _RegistrationArtistState extends State<RegistrationArtist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0XFF68AAC2),
            image: DecorationImage(
                image: AssetImage('assets/regman.png'),
                fit: BoxFit.none,
                alignment: Alignment.bottomLeft)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Container(
                    child: Text(
                      'Registration',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 112,
                        width: 114,
                        child: Image.asset("assets/A13.png"))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Colors.black)),
                                labelText: "FirstName",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Re-Enter Password",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Address",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Phone",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Social Media Id",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "Fee per Program",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  labelText: "City",
                                  labelStyle: TextStyle(color: Colors.black))),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ArtistLogin()));
                          },
                          child: Container(
                            height: 51,
                            width: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text("SignUp",
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.black, fontSize: 32)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
