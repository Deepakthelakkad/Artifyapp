import 'package:artify_app/NormalUser/artist_view_nr.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNrUser extends StatefulWidget {
  const HomeNrUser({super.key});

  @override
  State<HomeNrUser> createState() => _HomeNrUserState();
}

class _HomeNrUserState extends State<HomeNrUser> {
  var feature = "arun";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          // child: Icon(CupertinoIcons.back,color: Color.fromRGBO(194, 74, 107, 1),),
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
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArtistViewNr()));
                      },
                      child: Container(
                        height: 28,
                        width: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(47, 128, 237, 1),),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Text("Check",
                              style: GoogleFonts.ubuntu(color: Colors.white)),
                        ),
                      ),
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
