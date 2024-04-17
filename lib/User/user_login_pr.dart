import 'package:artify_app/User/bottom_button_pr.dart';
import 'package:artify_app/User/registration_pr_user.dart';
import 'package:artify_app/User/user_homepage_pr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
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
                  height: 75,
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
                              labelText: "UserName",
                              labelStyle: TextStyle(color: Colors.black54)),
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
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Container(
                          width: 200,
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
                              hintText: "Select Type",
                            ),
                            items: selectedrole.map((String e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(e,style: TextStyle(color: Colors.black,),),
                            ))
                                .toList(),

                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BottomButton()));
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
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegistrationPr()));
                        },
                            child: Text('SignUp',style: TextStyle(decoration: TextDecoration.underline,color: Colors.black,fontSize: 20),)),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
