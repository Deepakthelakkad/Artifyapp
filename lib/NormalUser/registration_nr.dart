import 'package:artify_app/NormalUser/normal_user_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationNr extends StatefulWidget {
  const RegistrationNr({super.key});

  @override
  State<RegistrationNr> createState() => _RegistrationNrState();
}

class _RegistrationNrState extends State<RegistrationNr> {
  final List<String> selectedrole = ['premium', 'normal'];
  String selectedValue = "normal";
  final formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var reenterpassword = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();

  Future<dynamic> Normalreg() async {
    await FirebaseFirestore.instance.collection("NormalReg").add({
      "Name": name.text,
      "Email": email.text,
      "Password": password.text,
      "Re-enter password": reenterpassword.text,
      "Address": address.text,
      "Phone": phone.text,
    });
    print('done');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NormalUserLogin()));
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
                                  labelText: "Name",
                                  labelStyle: TextStyle(color: Colors.black)),
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
                                    labelText: "Email",
                                    labelStyle:
                                        TextStyle(color: Colors.black))),
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
                                    labelText: "Password",
                                    labelStyle:
                                        TextStyle(color: Colors.black))),
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
                                    labelText: "Re-Enter Password",
                                    labelStyle:
                                        TextStyle(color: Colors.black))),
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
                                    labelText: "Address",
                                    labelStyle:
                                        TextStyle(color: Colors.black))),
                          ),
                          Container(
                            height: 50,
                            child: TextFormField(
                                controller: phone,
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
                                    labelText: "Phone",
                                    labelStyle:
                                        TextStyle(color: Colors.black))),
                          ),
                          SizedBox(
                            height: 14,
                          ),
                          Container(
                            width: 200,
                            child: DropdownButtonFormField(
                              value: selectedValue,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                                border: InputBorder.none,
                                hintText: "Select Type",
                              ),
                              items: selectedrole
                                  .map((String e) => DropdownMenuItem<String>(
                                        value: e,
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value!;
                                  print(selectedValue);
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          selectedValue == "normal"
                              ? InkWell(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      Normalreg();
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
                                      child: Text("SignUp",
                                          style: GoogleFonts.ubuntu(
                                              color: Colors.black,
                                              fontSize: 32)),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      " pay 299",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
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
