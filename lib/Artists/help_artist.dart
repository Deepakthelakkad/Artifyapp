import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelpArtist extends StatefulWidget {
  const HelpArtist({super.key});

  @override
  State<HelpArtist> createState() => _HelpArtistState();
}

class _HelpArtistState extends State<HelpArtist> {
  final formkey = GlobalKey<FormState>();
  var help = TextEditingController();
  Future<dynamic> Helpart() async {
    await FirebaseFirestore.instance.collection("Helpartist").add({
      "Help": help.text,
      "artist":ID,
    });
    print('done');
    Navigator.pop(context);
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
    });
    print("done");
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
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
                              padding: const EdgeInsets.only(left: 100,top: 30),
                              child: Text(
                                'Suggestion',
                                style: GoogleFonts.ubuntu(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,fontSize: 20),
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
                          SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Describe your Suggestion')
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                          TextFormField(
                            controller: help,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter required details";
                              }
                            },
                            minLines: 6,
                            keyboardType: TextInputType.multiline,
                            maxLines: null, // Allows multiline input
                            decoration: InputDecoration(
                              hintText: 'Enter your Suggestion here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.3,),
                          InkWell(onTap: (){
                            if (formkey.currentState!.validate()) {
                              Helpart();
                            }
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
      ),
    );
  }
}
