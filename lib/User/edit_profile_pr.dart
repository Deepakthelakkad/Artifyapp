import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  var ID;
  String? fetchedName;
  String? fetchedEmail;
  String? fetchedAddress;
  String? fetchedPhone;

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      print(ID.toString());
    });

    if (ID != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("PremiumReg").doc(ID).get();
      setState(() {
        fetchedName = userDoc.get("Name");
        fetchedEmail = userDoc.get("Email");
        fetchedAddress = userDoc.get("Address");
        fetchedPhone = userDoc.get("Phone");
        name.text = fetchedName ?? "";
        email.text = fetchedEmail ?? "";
        address.text = fetchedAddress ?? "";
        phone.text = fetchedPhone ?? "";
      });
    }
    print('data updated');
  }

  final formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var address = TextEditingController();
  var phone = TextEditingController();

  Future<void> Editpr() async {
    await FirebaseFirestore.instance.collection("PremiumReg").doc(ID).update({
      "Name": name.text,
      "Email": email.text,
      "Address": address.text,
      "Phone": phone.text,
    });
    print('done');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/A14.png'), // Replace with your image path
                      fit: BoxFit.fill,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(192, 70, 115, 1),
                        Color.fromRGBO(207, 97, 82, 1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Container(
                  height: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 120),
                        TextFormField(
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: fetchedName ?? 'Enter your name',
                            labelStyle: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: fetchedEmail ?? "Email",
                            labelStyle: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextFormField(
                          controller: phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: fetchedPhone ?? "Mobile number",
                            labelStyle: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        TextFormField(
                          controller: address,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter required details";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: fetchedAddress ?? "Address",
                            labelStyle: GoogleFonts.ubuntu(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                        InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              Editpr();
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 366,
                            child: Center(
                              child: Text(
                                "Submit",
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
