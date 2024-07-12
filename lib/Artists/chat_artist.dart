import 'package:artify_app/Artists/chat_artist_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatArtist extends StatefulWidget {
  const ChatArtist({super.key});

  @override
  State<ChatArtist> createState() => _ChatArtistState();
}

class _ChatArtistState extends State<ChatArtist> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 40),
                Text("Call"),
                SizedBox(height: 10),
                Text(
                  "Contacts",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(122, 115, 115, 1.0)),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
        body: FutureBuilder(
            future: FirebaseFirestore.instance.collection("PremiumReg").get(),
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
                            child: artist[index]["path"] == "1"
                                ? ClipOval(
                              child: Image.asset(
                                "assets/pp.png",
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            )
                                : ClipOval(
                              child: Image.network(
                                artist[index]["path"],
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(artist[index]["Name"]),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Call now ",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(104, 232, 75, 1.0)),
                                  ),
                                  Icon(Icons.circle_rounded,
                                      size: 14,
                                      color: Color.fromRGBO(104, 232, 75, 1.0))
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () async {
                                final phone = artist[index]["Phone"];
                                final url = 'tel:$phone';
                                if (await canLaunch(url)) {
                                await launch(url);
                                } else {
                                throw 'Could not launch $url';
                                }
                              },
                              icon: Icon(
                                Icons.add_call,
                                color: Color.fromRGBO(39, 50, 168, 1.0),
                              )),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
