import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminUserView extends StatefulWidget {
  const AdminUserView({super.key});

  @override
  State<AdminUserView> createState() => _AdminUserViewState();
}

class _AdminUserViewState extends State<AdminUserView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage('assets/A14.png'), // Replace with your image path
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(60, 170, 212, 1),
                        Color.fromRGBO(109, 102, 101, 1),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(CupertinoIcons.back, color: Colors.white),),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/devanand.png",
                                height: 90,
                                width: 90,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Text(
                            "Devanand",
                            style: GoogleFonts.ubuntu(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                  child: Card(
                    color: Colors.red.shade50,
                    surfaceTintColor: Colors.deepOrange.shade50,
                    elevation: 4,
                    child: ListTile(
                      leading: Text(
                        "Phone",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Color.fromRGBO(134, 135, 142, 1)),
                      ),
                      trailing: Text(
                        "+91 9999999999",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.red.shade50,
                    surfaceTintColor: Colors.deepOrange.shade50,
                    elevation: 4,
                    child: ListTile(
                      leading: Text(
                        "Email",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Color.fromRGBO(134, 135, 142, 1)),
                      ),
                      trailing: Text(
                        "example@gmail.com",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.red.shade50,
                    surfaceTintColor: Colors.deepOrange.shade50,
                    elevation: 4,
                    child: ListTile(
                      leading: Text(
                        "Place",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Color.fromRGBO(134, 135, 142, 1)),
                      ),
                      trailing: Text(
                        "Kochi",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.red.shade50,
                    surfaceTintColor: Colors.deepOrange.shade50,
                    elevation: 4,
                    child: ListTile(
                      leading: Text(
                        "Address",
                        style: GoogleFonts.ubuntu(
                            fontSize: 15,
                            color: Color.fromRGBO(134, 135, 142, 1)),
                      ),
                      trailing: Text(
                        "",
                        style: TextStyle(
                            fontSize: 15, color: Color.fromRGBO(43, 44, 47, 1)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          )
      ),
    );
  }
}
