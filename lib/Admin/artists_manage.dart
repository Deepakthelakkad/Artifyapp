import 'package:artify_app/Admin/admin_artist_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistManage extends StatefulWidget {
  const ArtistManage({super.key});

  @override
  State<ArtistManage> createState() => _ArtistManageState();
}

class _ArtistManageState extends State<ArtistManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: Color.fromRGBO(194, 74, 107, 1),
              size: 23,
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Container(
            child: Text(
              "Artists",
              style: TextStyle(
                  fontSize: 25, color: Color.fromRGBO(194, 74, 107, 1)),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("ArtReg").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          final artist = snapshot.data?.docs ?? [];
          return ListView.builder(
              itemCount: artist.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
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
                              setState(() {
                                FirebaseFirestore.instance.collection("ArtReg").doc(artist[index].id).delete();
                              });
                            },
                            child: Container(
                              height: 28,
                              width: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(237, 47, 47, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(15, 6, 5, 5),
                                child: Text("BAN",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
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
                                color: Color.fromRGBO(47, 128, 237, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(6, 6, 5, 6),
                                child: Text("Accept",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(artist[index]["Name"]),
                      subtitle: Row(
                        children: [
                          Text(artist[index]["Category"]),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Text(artist[index]["Experience"]),
                              Text("y exp")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
