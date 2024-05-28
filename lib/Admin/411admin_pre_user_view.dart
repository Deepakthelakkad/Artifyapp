import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPreUserView extends StatefulWidget {
  const AdminPreUserView({super.key, required this.id});
  final id;

  @override
  State<AdminPreUserView> createState() => _AdminPreUserViewState();
}

class _AdminPreUserViewState extends State<AdminPreUserView> {
  GETFILE() async {
    user = await FirebaseFirestore.instance
        .collection('PremiumReg')
        .doc(widget.id)
        .get();
  }

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

  DocumentSnapshot? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
          future: GETFILE(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error${snapshot.error}");
            }
        return Scaffold(
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
                                  "assets/pp.png",
                                  height: 90,
                                  width: 90,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              user!["Name"],
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
                          user!["Phone"],
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
                          user!["Email"],
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
                          user!["Address"],
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
        );
  }
      ),
    );
  }
}
