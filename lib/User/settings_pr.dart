import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingNr extends StatefulWidget {
  const SettingNr({super.key});

  @override
  State<SettingNr> createState() => _SettingNrState();
}

class _SettingNrState extends State<SettingNr> {
  bool _notificationsEnabled = false;
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
                                onPressed: () {},
                                icon: Icon(
                                  CupertinoIcons.back,
                                  color: Colors.white,size: 23,
                                )),
                           ),
                           Padding(
                            padding: const EdgeInsets.only(left: 140,top: 30),
                            child: Text(
                              'Settings',
                              style: TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            shadowColor: Colors.black,
                            borderRadius:  BorderRadius.circular(20),
                            child: Container(
                              width: 330,
                              height:  305,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(color: Color(0XFFF18A5C),borderRadius: BorderRadius.circular(10)),
                                      child: Icon(CupertinoIcons.lock_fill,color: Colors.white,),
                                    ),
                                    title: Text('Password',style: TextStyle(fontSize: 14),),
                                    subtitle: Text('Change Password',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    trailing: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.forward),)
                                  ),
                                  Divider(indent: 20,endIndent: 20,),
                                  ListTile(
                                    leading: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(color: Color(0XFF5CF198),borderRadius: BorderRadius.circular(10)),
                                      child: Icon(CupertinoIcons.question_circle_fill,color: Colors.white,),
                                    ),
                                    title: Text('Help',style: TextStyle(fontSize: 14),),
                                    subtitle: Text('Report a problem',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    trailing: Icon(CupertinoIcons.forward),
                                  ),
                                  Divider(indent: 20,endIndent: 20,),
                                  ListTile(
                                    leading: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(color: Color(0XFFC24A6B),borderRadius: BorderRadius.circular(10)),
                                      child: Icon(CupertinoIcons.person_fill,color: Colors.white,),
                                    ),
                                    title: Text('About us',style: TextStyle(fontSize: 14),),
                                    subtitle: Text('About application',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    trailing: Icon(CupertinoIcons.forward),
                                  ),
                                  Divider(indent: 20,endIndent: 20,),
                                  ListTile(
                                    leading: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(color: Color(0XFF5CCBF1),borderRadius: BorderRadius.circular(10)),
                                      child: Icon(CupertinoIcons.bell_fill,color: Colors.white,),
                                    ),
                                    title: Text('NOtification',style: TextStyle(fontSize: 14),),
                                    subtitle: Text('App notifications',style: TextStyle(fontSize: 12,color: Colors.grey),),
                                    trailing: Switch(
                                      value: _notificationsEnabled,
                                      onChanged: (value) {
                                        setState(() {
                                          _notificationsEnabled = value;
                                        });
                                      },
                                    ),
                                  ),
                                  InkWell(onTap: (){},
                                    child: Container(
                                      height: 50,width: 366,
                                      child: Center(
                                        child: Row(
                                          children: [
                                            Text("Logout",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: 20, ),
                                            ),
                                            Icon(CupertinoIcons.square_arrow_right)
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromRGBO(23, 191, 69, 1),
                                          Color.fromRGBO(126, 203, 64, 1),
                                        ],
                                      ),
                                      ),),)
                                ],
                              ),

                            ),
                          ),
                        )
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
