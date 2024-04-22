import 'dart:ui';

import 'package:artify_app/Admin/admin_manage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
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
                    Color.fromRGBO(25, 93, 120, 0.60),
                    Color.fromRGBO(44, 122, 154, 0.56),
                  ],
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  color: Colors.blue.shade900
                      .withOpacity(.3), // Adjust the opacity as needed
                ),
              ),
            ),
          ),
          Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CircleAvatar(
                    // backgroundColor: Colors.green,
                    radius: 105,
                    foregroundImage: AssetImage('assets/A12.png'),
                  ),
                ),
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
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: Colors.white30),
                          labelStyle: GoogleFonts.ubuntu(
                              color: Colors.grey, fontSize: 20)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.white30),
                          labelStyle: GoogleFonts.ubuntu(
                              color: Colors.grey, fontSize: 20)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminManage()));
                      },
                      child: Container(
                        height: 50,
                        width: 366,
                        child: Center(
                          child: Text(
                            "Sign Up",
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
                              Color.fromRGBO(191, 70, 114, 1),
                              Color.fromRGBO(198, 82, 100, 0.948),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                              color: Colors.white,
                              fontSize: 16),
                        ),
                    )
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
