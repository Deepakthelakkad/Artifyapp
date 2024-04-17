import 'package:artify_app/NormalUser/user_login_nr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationNr extends StatefulWidget {
  const RegistrationNr({super.key});

  @override
  State<RegistrationNr> createState() => _RegistrationNrState();
}

class _RegistrationNrState extends State<RegistrationNr> {
  final List<String> selectedrole = [
    'premium','normal'
  ];
  String selectedValue = "normal";
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
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          width: 155,
                          child: DropdownButtonFormField(
                            value: selectedValue,
                            decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20.0,horizontal: 10),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.black)),
                              border: InputBorder.none,
                              hintText: "Blood Type",
                            ),
                            items: selectedrole.map((String e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e,style: TextStyle(color: Colors.white,backgroundColor: Color(0XFF1D2C6F),),),
                            ))
                                .toList(),

                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserLoginNr()));
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
