import 'package:artify_app/Admin/admin_artist_view.dart';
import 'package:artify_app/Admin/admin_user_view.dart';
import 'package:artify_app/Admin/artists_manage.dart';
import 'package:artify_app/Admin/help_requests.dart';
import 'package:artify_app/Admin/rating.dart';
import 'package:artify_app/Admin/user_manage.dart';
import 'package:artify_app/Admin/user_type_admin.dart';
import 'package:artify_app/section_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminManage extends StatefulWidget {
  const AdminManage({super.key});

  @override
  State<AdminManage> createState() => _AdminManageState();
}

class _AdminManageState extends State<AdminManage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/bg.png'), // Replace with your image path
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
            Colors.blue.withOpacity(.7), // Adjust the opacity here (0.0 - 1.0)
            BlendMode.dstATop,)),
          ),
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
                            padding: const EdgeInsets.only(left: 110,top: 30),
                            child: Text(
                              'Manage',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 170,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ArtistManage()));
                        },
                        child: Container(
                          height: 80,
                          width: 312,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(94, 213, 233, 1),
                                Color.fromRGBO(194, 223, 228, 1),
                              ],
                            ),
                          ),
                          child: Center(child: Text('Artists',style: GoogleFonts.ubuntu(fontSize: 45,fontWeight: FontWeight.bold,color: Color.fromRGBO(4, 56, 68, 1)),)),
                        ),
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserTypeAdmin()));
                        },
                        child: Container(
                          height: 80,
                          width: 312,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(94, 213, 233, 1),
                                Color.fromRGBO(194, 223, 228, 1),
                              ],
                            ),
                          ),
                          child: Center(child: Text('User',style: GoogleFonts.ubuntu(fontSize: 45,fontWeight: FontWeight.bold,color: Color.fromRGBO(4, 56, 68, 1)),)),
                        ),
                      ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Rating()));
                        },
                        child: Container(
                          height: 80,
                          width: 312,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(94, 213, 233, 1),
                                Color.fromRGBO(194, 223, 228, 1),
                              ],
                            ),
                          ),
                          child: Center(child: Text('Rating & badge',style: GoogleFonts.ubuntu(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromRGBO(4, 56, 68, 1)),)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpRequests()));
                        },
                        child: Container(
                          height: 80,
                          width: 312,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color.fromRGBO(94, 213, 233, 1),
                                Color.fromRGBO(194, 223, 228, 1),
                              ],
                            ),
                          ),
                          child: Center(child: Text('Help Requests',style: GoogleFonts.ubuntu(fontSize: 35,fontWeight: FontWeight.bold,color: Color.fromRGBO(4, 56, 68, 1)),)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 168,top: 94),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SectionLogin()));
                          },
                          child: Container(
                            height: 50,
                            width: 178,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(222, 49, 49, 1),
                                  Color.fromRGBO(182, 34, 34, 1),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Logout',style: GoogleFonts.ubuntu(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                                Icon(CupertinoIcons.square_arrow_right,size: 25,color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
