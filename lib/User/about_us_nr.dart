import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsNr extends StatefulWidget {
  const AboutUsNr({super.key});

  @override
  State<AboutUsNr> createState() => _AboutUsNrState();
}

class _AboutUsNrState extends State<AboutUsNr> {
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.back,
                              color: Colors.white,
                              size: 23,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 130, top: 30),
                        child: Text(
                          'About us',
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
                    Text(
                      'Artify :  A digital world for music passionate',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      'Artify is a flutter-based mobile application designed to ignite and empower music related artists.'
                      ' Through this app most of the artists going to be popular in public.'
                      ' The old way of event processes are going to change in this digital world. '
                      'This app help to bring up the artists for popularity and financial stability.',
                      style: GoogleFonts.ubuntu(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
