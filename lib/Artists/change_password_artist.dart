import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordArtist extends StatefulWidget {
  const ChangePasswordArtist({super.key});

  @override
  State<ChangePasswordArtist> createState() => _ChangePasswordArtistState();
}

class _ChangePasswordArtistState extends State<ChangePasswordArtist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  CupertinoIcons.back,
                                  color: Colors.white,size: 23,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 140,top: 30),
                            child: Column(
                              children: [
                                Text(
                                  'Change ',
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                                Text(
                                  'Password',
                                  style: GoogleFonts.ubuntu(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/A14.png'), // Replace with your image path
                        fit: BoxFit.fill),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(68, 160, 196, 1),
                        Color.fromRGBO(98, 118, 128, 1),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Container(
                  height: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Current Password:'),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Password',
                              labelStyle: GoogleFonts.ubuntu(color: Colors.grey,fontSize: 20)),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('New Password:'),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Password',
                              labelStyle: GoogleFonts.ubuntu(color: Colors.grey,fontSize: 20)),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Re-enter Password:'),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Password',
                              labelStyle: GoogleFonts.ubuntu(color: Colors.grey,fontSize: 20)),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                        InkWell(onTap: (){
                          Navigator.pop(context);
                        },
                          child: Container(
                            height: 50,width: 366,
                            child: Center(
                              child: Text("Submit",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20, ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(69, 159, 195, 1),
                                Color.fromRGBO(81, 162, 194, 1),
                              ],
                            ),
                            ),),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
