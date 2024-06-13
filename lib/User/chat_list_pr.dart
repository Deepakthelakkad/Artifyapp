import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text("Call"),
                SizedBox(height: 10),
                Text(
                  "Contacts",
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(122, 115, 115, 1.0)),
                ),
                SizedBox(height: 20),
              ],
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
              final premiumuser = snapshot.data?.docs ?? [];
              return ListView.builder(
                  itemCount: premiumuser.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Container(
                            child: premiumuser[index]["path"] == "1"
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
                                      premiumuser[index]["path"],
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          title: Text(premiumuser[index]["Name"]),
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
                                final phone = premiumuser[index]["Phone"];
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
