import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistReq extends StatefulWidget {
  const ArtistReq({super.key});

  @override
  State<ArtistReq> createState() => _ArtistReqState();
}

class _ArtistReqState extends State<ArtistReq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("ArtReg")
              .where("Category", isEqualTo: "Dancer")
              .get(),
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
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: Container(
                      child: ClipOval(
                        child: Image.asset(
                          "assets/pp.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    trailing: InkWell(
                      onTap: () {
                      },
                      child: Container(
                        height: 28,
                        width: 54,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(47, 128, 237, 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Text("Check",
                              style: GoogleFonts.ubuntu(color: Colors.white)),
                        ),
                      ),
                    ),
                    title: artist[index]['Name'],
                  ),
                ),
              );
            });
  }
      ),
    );
  }
}
