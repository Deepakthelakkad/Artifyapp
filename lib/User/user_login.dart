import 'package:artify_app/User/registration_pr_user.dart';
import 'package:artify_app/User/user_homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0XFF68AAC2),image: DecorationImage(image: AssetImage('assets/old man.png'),fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 323,
                        width: 265,
                        child: Image.asset("assets/A12.png"))
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  color: Color.fromRGBO(217, 217, 217, 0.3),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                              labelText: "Userame",
                              labelStyle: TextStyle(color: Colors.black54)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(decoration: const InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black54))),
                        SizedBox(
                          height: 0,
                        ),
                        TextFormField(decoration: const InputDecoration(
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black54))),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserHomepage()));
                          },
                          child: Container(
                            height: 51,
                            width: 190,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,),
                            child: Center(
                              child: Text("Login",
                                  style: GoogleFonts.ubuntu(color: Colors.black,fontSize: 32)),
                            ),
                          ),
                        ),
                        TextButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPr()));
                        }, child: Text('SignUp',style: TextStyle(decoration: TextDecoration.underline,color: Colors.black,fontSize: 20),))
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
