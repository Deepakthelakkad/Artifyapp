import 'dart:ui';

import 'package:artify_app/Artists/schedule.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionLogin extends StatefulWidget {
  const SectionLogin({super.key});

  @override
  State<SectionLogin> createState() => _SectionLoginState();
}

class _SectionLoginState extends State<SectionLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(103, 169, 193, 1),
              image: DecorationImage(
                  image: AssetImage('assets/people.png'), fit: BoxFit.cover)),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 1000,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(103, 169, 193, 0.5),
                        Color.fromRGBO(44, 122, 154, 0.56),
                      ],
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: Container(
                      color: Color.fromRGBO(103, 169, 193, 0.5)
                          .withOpacity(.1), // Adjust the opacity as needed
                    ),
                  ),
                ),
              ),
              Positioned(child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.ellipsis_vertical,color: Colors.white,size: 30,))
                ],
              )),
              Positioned(
                top: 320,
                left: 20,
                right: 20,
                child: Container(
                  height: 280,
                  width: 280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade100),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          height: 78,
                          width: 197,
                          child: Center(
                            child: Text(
                              "ARTIST",
                              style: GoogleFonts.rosario(
                                color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Container(
                          height: 78,
                          width: 197,
                          child: Center(
                            child: Text(
                              "USER",
                              style: GoogleFonts.rosario(
                                color: Colors.black,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
