import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  var feature = "arun";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(CupertinoIcons.back,color: Color.fromRGBO(191, 68, 116, 1),)),
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Container(
            child: Text(
              "Artists",
              style:
              GoogleFonts.ubuntu(fontSize: 25,fontWeight: FontWeight.bold, color: Color.fromRGBO(194, 74, 107, 1)),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: feature.length,
            itemBuilder: (context, index) {
              return Card(
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
                  title: Text("Amaleswar",style: GoogleFonts.ubuntu(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                  subtitle: Row(
                    children: [
                      Text("Dancer",style: GoogleFonts.ubuntu(fontSize: 14,color: Colors.black87),),
                      SizedBox(
                        width: 15,
                      ),
                      Text("3y exp",style: GoogleFonts.ubuntu(fontSize: 14,color: Colors.black87,)),
                      SizedBox(
                        width: 10,
                      ),
                      Text("No of 5",style: GoogleFonts.ubuntu(fontSize: 14,color: Colors.black87)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.star,color: Color.fromRGBO(230, 210, 28, 1),),
                      SizedBox(
                        width:10,
                      ),
                      Text("98",style: TextStyle(fontSize: 14,color: Colors.black87)),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 20,
                          height: 20,
                          child: Image.asset('assets/medal.png'))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
