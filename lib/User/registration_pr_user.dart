import 'package:artify_app/User/user_login_pr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationPr extends StatefulWidget {
  const RegistrationPr({super.key});

  @override
  State<RegistrationPr> createState() => _RegistrationPrState();
}

class _RegistrationPrState extends State<RegistrationPr> {
  List<String> locationlist = ['Normal', 'Premium'];
  String? selectedvalue;
  final formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var reenterpassword = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();

  Future<dynamic> Premiumreg() async {
    await FirebaseFirestore.instance.collection("PremiumReg").add({
      "Name": name.text,
      "Email": email.text,
      "Password": password.text,
      "Re-enter password": reenterpassword.text,
      "Address": address.text,
      "Phone": phone.text,
      "Category": selectedvalue,
      "Premium": 1,
      "path": 'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=',
      "status":0,
    });
    print('done');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UserLogin()));
  }

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
                              controller: name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter required details";
                                }
                              },
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  border: UnderlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.black)),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                controller: email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter required details";
                                  }
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    border: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                controller: password,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter required details";
                                  }
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    border: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                controller: reenterpassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter required details";
                                  }
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    border: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    hintText: "Re-Enter Password",
                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                controller: address,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter required details";
                                  }
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    border: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    hintText: "Address",
                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                controller: phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter required details";
                                  } else if (value.length != 10) {
                                    return "Phone number must be 10 digits";
                                  }
                                },
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    border: UnderlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black)),
                                    hintText: "Phone",
                                    hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.normal))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                if (password.text == reenterpassword.text) {
                                  Premiumreg();
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Passwords do not match",
                                        style: TextStyle(color: Colors.red),
                                      )));
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                child: Text(
                                  " pay 299",
                                  style: GoogleFonts.ubuntu(color: Colors.white),
                                ),
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
      ),
    );
  }
}
