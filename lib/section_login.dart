import 'dart:ui';

import 'package:artify_app/Admin/admin_login.dart';
import 'package:artify_app/Artists/artist_login.dart';
import 'package:artify_app/Artists/schedule.dart';
import 'package:artify_app/User/user_login_pr.dart';
import 'package:artify_app/user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionLogin extends StatefulWidget {
  const SectionLogin({super.key});

  @override
  State<SectionLogin> createState() => _SectionLoginState();
}

class _SectionLoginState extends State<SectionLogin> {
  bool isVisible = false;

  void toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(automaticallyImplyLeading: false,
      //   backgroundColor: Color.fromRGBO(106, 172, 197, 1),
      //   actions: [
      //     PopupMenuButton(itemBuilder: (context)=>[
      //       PopupMenuItem(child: Container(
      //         decoration: BoxDecoration(color: Colors.blue),
      //         child: Text('Admin',style: TextStyle(color: Colors.white),),
      //       ))
      //     ],
      //     )
      //   ],
      // ),
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
              Positioned(
                top: 30,
                right: 0,
                child: Row(
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.blue,),
                          width: 125,
                          height: 30,
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(3),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.person_crop_rectangle,color: Colors.white,),
                              Text(
                                ' Admin Login',
                                style: GoogleFonts.ubuntu(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: toggleVisibility,
                      icon: Icon(CupertinoIcons.ellipsis_vertical, color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 300,
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
                          height: MediaQuery.of(context).size.height * 0.056,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtistLogin()));
                          },
                          child: Container(
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
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLogin()));
                          },
                          child: Container(
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
