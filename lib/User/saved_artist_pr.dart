import 'package:artify_app/User/saved_artist_view_pr.dart';
import 'package:artify_app/User/user_profile_pr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'artist_view.dart';

class SavedArtists extends StatefulWidget {
  const SavedArtists({super.key});

  @override
  State<SavedArtists> createState() => _SavedArtistsState();
}

class _SavedArtistsState extends State<SavedArtists> {
  var feature = "arun";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => UserProfile()));
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.back,color: Color.fromRGBO(191, 68, 116, 1),)),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text('Saved Artists',style: TextStyle(color: Color.fromRGBO(191, 68, 116, 1),fontWeight: FontWeight.bold),),
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
                                  builder: (context) => SavedArtistView()));
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
              })
      ),
    );
  }
}