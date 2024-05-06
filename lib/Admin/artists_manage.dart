import 'package:artify_app/Admin/admin_artist_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistManage extends StatefulWidget {
  const ArtistManage({super.key});

  @override
  State<ArtistManage> createState() => _ArtistManageState();
}

class _ArtistManageState extends State<ArtistManage> {
  var feature = "arun";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                color: Color.fromRGBO(194, 74, 107, 1),size: 23,
              )),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Container(
            child: Text(
              "Artists",
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
                          "assets/AMLU.png",
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
                        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminArtistView()));
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
                    title: Text("Amaleswar"),
                    subtitle: Row(
                      children: [
                        Text("Dancer"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("3y exp"),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
