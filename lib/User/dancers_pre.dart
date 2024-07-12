import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'artist_view.dart';

class DancersPre extends StatefulWidget {
  const DancersPre({super.key});

  @override
  State<DancersPre> createState() => _DancersPreState();
}

class _DancersPreState extends State<DancersPre> {
  String searchQuery = '';
  int currentPage = 0;
  static const int itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        future: FirebaseFirestore.instance
            .collection("ArtReg")
            .where("Category", isEqualTo: "Dancer")
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          final artists = snapshot.data?.docs ?? [];
          final filteredArtists = artists.where((doc) {
            final name = doc['Name'].toString().toLowerCase();
            return name.contains(searchQuery);
          }).toList();

          final paginatedArtists = filteredArtists
              .skip(currentPage * itemsPerPage)
              .take(itemsPerPage)
              .toList();
          final totalPages = (filteredArtists.length / itemsPerPage).ceil();

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: paginatedArtists.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Container(
                            child: ClipOval(
                              child: Image.network(
                                paginatedArtists[index]["path"],
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
                                  builder: (context) =>
                                      ArtistView(id: paginatedArtists[index].id),
                                ),
                              );
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
                                child: Text(
                                  "Check",
                                  style: GoogleFonts.ubuntu(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          title: Text(paginatedArtists[index]["Name"]),
                          subtitle: Row(
                            children: [
                              Text(paginatedArtists[index]["Category"]),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Text(paginatedArtists[index]["Experience"]),
                                  Text("y exp"),
                                ],
                              ),
                            ],
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
