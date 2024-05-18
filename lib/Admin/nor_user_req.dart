import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NorUserReq extends StatefulWidget {
  const NorUserReq({super.key});

  @override
  State<NorUserReq> createState() => _NorUserReqState();
}

class _NorUserReqState extends State<NorUserReq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
          itemCount: 2,
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
                  title: Text("Name"),
                ),
              ),
            );
          }),
    );
  }
}
