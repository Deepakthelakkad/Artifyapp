import 'package:artify_app/NormalUser/bottom_button_nr.dart';
import 'package:artify_app/NormalUser/registration_nr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NormalUserLogin extends StatefulWidget {
  const NormalUserLogin({super.key});

  @override
  State<NormalUserLogin> createState() => _NormalUserLoginState();
}

class _NormalUserLoginState extends State<NormalUserLogin> {
  final formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  String id ="";
  void normLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('NormalReg')
        .where('Email', isEqualTo: email.text)
        .where('Password', isEqualTo: password.text)
    // .where('status', isEqualTo: 1)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;


      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);


      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return BottomButtonNr();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "username and password error",
            style: TextStyle(color: Colors.red),
          )));
    }
  }
  final List<String> selectedrole = ['premium', 'normal'];
  String selectedValue = "normal";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0XFF68AAC2),
              image: DecorationImage(
                  image: AssetImage('assets/old man.png'), fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 270,
                          width: 265,
                          child: Image.asset("assets/A12.png"))
                    ],
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Container(
                    color: Color.fromRGBO(217, 217, 217, 0.3),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter required details";
                                }
                              },
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  labelText: "Email",
                                  labelStyle:
                                      TextStyle(color: Colors.black54))),
                          TextFormField(
                            controller: password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter required details";
                                }
                              },
                              obscureText: true,
                              decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  labelText: "Password",
                                  labelStyle:
                                      TextStyle(color: Colors.black54))),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          InkWell(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                normLogin();
                              }
                            },
                            child: Container(
                              height: 51,
                              width: 190,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text("Login",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.black, fontSize: 32)),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationNr()));
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 20),
                              )),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
