import 'package:artify_app/Admin/artist_req.dart';
import 'package:artify_app/Admin/nor_user_req.dart';
import 'package:artify_app/Admin/pre_user_req.dart';
import 'package:flutter/material.dart';

class HelpRequests extends StatefulWidget {
  const HelpRequests({super.key});

  @override
  State<HelpRequests> createState() => _HelpRequestsState();
}

class _HelpRequestsState extends State<HelpRequests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsets.only(left: 115),
                child: Container(
                  child: Text(
                    "Suggestion",
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(194, 74, 107, 1)),
                  ),
                ),
              ),
            ),
            body:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Container(
                    height: 50,
                    // width: 330.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(194, 74, 107, 1)),
                      tabs: [
                        Tab(
                            child: Text(
                              'Artist',
                              style: TextStyle(
                                // color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )),
                        Tab(
                            child: Text(
                              'Premium User',
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            )),
                        Tab(
                            child: Text(
                              'Normal User',
                              style: TextStyle(
                                // color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child:
                  TabBarView(children: [ArtistReq(), PreUserReq(), NorUserReq()]),
                )
              ],
            )
        ),
      ),
    );
  }
}
