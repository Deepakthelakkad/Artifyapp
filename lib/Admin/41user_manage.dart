import 'package:artify_app/Admin/411admin_pre_user_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserManage extends StatefulWidget {
  const UserManage({super.key});

  @override
  State<UserManage> createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> {
  String searchQuery = '';
  int currentPage = 0;
  static const int itemsPerPage = 10;

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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                  currentPage = 0; // Reset to the first page when searching
                });
              },
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("PremiumReg").where("status",isEqualTo: 0).get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          final users = snapshot.data?.docs ?? [];
          final filteredUsers = users.where((doc) {
            final name = doc['Name'].toString().toLowerCase();
            return name.contains(searchQuery);
          }).toList();

          final paginatedUsers = filteredUsers
              .skip(currentPage * itemsPerPage)
              .take(itemsPerPage)
              .toList();
          final totalPages = (filteredUsers.length / itemsPerPage).ceil();

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: paginatedUsers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Container(
                            child: ClipOval(
                              child: Image.network(
                                paginatedUsers[index]["path"],
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
                                    FirebaseFirestore.instance
                                        .collection("PremiumReg")
                                        .doc(paginatedUsers[index].id)
                                        .update({"status": 2});
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
                                    padding: const EdgeInsets.fromLTRB(5, 6, 0, 6),
                                    child: Text("REJECT",
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.03),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    FirebaseFirestore.instance
                                        .collection("PremiumReg")
                                        .doc(paginatedUsers[index].id)
                                        .update({"status": 1});
                                  });
                                },
                                child: Container(
                                  height: 28,
                                  width: 54,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromRGBO(47, 128, 237, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5, 6, 0, 6),
                                    child: Text("ACCEPT",
                                        style: GoogleFonts.ubuntu(
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          title: Text(
                            paginatedUsers[index]["Name"],
                            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (totalPages > 1) _buildPaginationControls(totalPages),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPaginationControls(int totalPages) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentPage > 0)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentPage--;
                });
              },
              child: Text('Previous'),
            ),
          Text('Page ${currentPage + 1} of $totalPages'),
          if (currentPage < totalPages - 1)
            ElevatedButton(
              onPressed: () {
                setState(() {
                  currentPage++;
                });
              },
              child: Text('Next'),
            ),
        ],
      ),
    );
  }
}
