import 'package:artify_app/section_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(103, 169, 193, 1),
              ),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Image.asset(
                    'assets/introo.png',
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Image.asset('assets/12.png'),
              ),
              Positioned(
                top: 550,
                left: 20,
                right: 20,
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SectionLogin()));
                  },
                  child: Container(
                    width: 250,
                    height: 85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .12,
                        ),
                        Text(
                          'Get started',
                          style: GoogleFonts.righteous(fontSize: 24),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .1,
                        ),
                        Image.asset('assets/Arrow.png')
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 640,
                left: 20,
                right: 20,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Stack(
                          children: [
                            Text(
                              'A digital world for',
                              style: GoogleFonts.risque(
                                  fontSize: 38,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = Colors.black),
                            ),
                            Text(
                              'A digital world for ',
                              style: GoogleFonts.risque(
                                fontSize: 37,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Stack(
                          children: [
                            Text(
                              'music passionate',
                              style: GoogleFonts.risque(
                                  fontSize: 35,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 6
                                    ..color = Colors.black),
                            ),
                            Text(
                              'music passionate',
                              style: GoogleFonts.risque(
                                fontSize: 34,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
