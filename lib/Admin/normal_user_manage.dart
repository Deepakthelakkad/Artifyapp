import 'package:artify_app/Admin/2admin_manage.dart';
import 'package:artify_app/Admin/admin_user_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalUserManage extends StatefulWidget {
  const NormalUserManage({super.key});

  @override
  State<NormalUserManage> createState() => _NormalUserManageState();
}

class _NormalUserManageState extends State<NormalUserManage> {
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
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Container(
            child: Text(
              "User",
              style: TextStyle(
                  fontSize: 25, color: Color.fromRGBO(194, 74, 107, 1)),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("NormalReg").get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          final user = snapshot.data?.docs ?? [];
          return ListView.builder(
              itemCount: user.length,
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
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                FirebaseFirestore.instance.collection("NormalReg").doc(user[index].id).delete();
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
                              width: MediaQuery.of(context).size.width * 0.03),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdminNormalUserView()));
                            },
                            child: Container(
                              height: 28,
                              width: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(47, 128, 237, 1),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 6, 5, 5),
                                child: Text("Check",
                                    style: GoogleFonts.ubuntu(
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      title: Text(
                        user[index]["Name"],
                        style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
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
