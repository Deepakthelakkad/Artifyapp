import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserManage extends StatefulWidget {
  const UserManage({super.key});

  @override
  State<UserManage> createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> {
  var feature = "arun";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          // child: Icon(CupertinoIcons.back,color: Color.fromRGBO(194, 74, 107, 1),),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Container(
            child: Text(
              "User",
              style:
              TextStyle(fontSize: 25, color: Color.fromRGBO(194, 74, 107, 1)),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feature.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Card(
                  elevation: 0,
                  child: ListTile(

                    leading: Container(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/devanand.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ArtistViewNr()));
                          },
                          child: Container(
                            height: 28,
                            width: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 47, 47, 1),),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 6, 5, 5),
                              child: Text("BAN",
                                  style: GoogleFonts.ubuntu(color: Colors.white)),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                        InkWell(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ArtistViewNr()));
                          },
                          child: Container(
                            height: 28,
                            width: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(47, 128, 237, 1),),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 6, 5, 5),
                              child: Text("Check",
                                  style: GoogleFonts.ubuntu(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    title: Text("Devanand S",style: GoogleFonts.ubuntu(fontWeight:FontWeight.bold),),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
