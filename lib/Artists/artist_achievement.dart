import 'package:artify_app/Artists/add_achievement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

class ArtistAchievement extends StatefulWidget {
  const ArtistAchievement({super.key});

  @override
  State<ArtistAchievement> createState() => _ArtistAchievementState();
}

List<Color> color = [
  Color(0XFFE9EAF4),
  Color(0XFFFFEEEA),
  Color(0XFFCDF2E0),
  Color(0XFFF4EEE1),
  Color(0XFFEBFAFE),
  Color(0XFFE9EAF4),
  Color(0XFFFFEEEA),
  Color(0XFFCDF2E0),
  Color(0XFFF4EEE1),
  Color(0XFFEBFAFE),
];

class _ArtistAchievementState extends State<ArtistAchievement> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  var ID;
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString("id");
      print(ID.toString());
    });
    print('data updated');
  }
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
              color: Color.fromRGBO(191, 68, 116, 1),
            )),
        title: Text(
          'Achievements',
          style: TextStyle(
              color: Color.fromRGBO(191, 68, 116, 1), fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by title',
                hintStyle: TextStyle(color: Color.fromRGBO(191, 68, 116, 1)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search, color: Color.fromRGBO(191, 68, 116, 1)),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection("Achieveadd").where("artistId",isEqualTo: ID).get(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                final achieve = snapshot.data?.docs.where((doc) {
                  return doc["Title"]
                      .toString()
                      .toLowerCase()
                      .contains(_searchQuery);
                }).toList() ?? [];
                return ListView.builder(
                  itemCount: achieve.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Card(
                        color: color[index % color.length],
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/Vector.png', // Replace with your image path
                                    width: 24, // Adjust image size as needed
                                    height: 24,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        FirebaseFirestore.instance
                                            .collection("Achieveadd")
                                            .doc(achieve[index].id)
                                            .delete();
                                      });
                                    },
                                    icon: Icon(
                                      CupertinoIcons.delete_solid,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    achieve[index]["Content"],
                                    style: GoogleFonts.ubuntu(
                                        fontSize: 14,
                                        color: Color.fromRGBO(42, 40, 40, 1)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    achieve[index]["Title"],
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Link(
                                    uri: Uri.parse(achieve[index]["Link"]),
                                    builder: (context, followLink) => TextButton(
                                        onPressed: followLink,
                                        child: Text(
                                          "click to view",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => AddAchievement()));
          },
          child: Container(
            height: 33,
            width: 81,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(123, 191, 69, 1),
                  Color.fromRGBO(126, 203, 64, 1),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
              child: Text('Add+',
                  style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
