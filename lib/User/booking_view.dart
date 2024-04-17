import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}
List<Color> color = [
  Color(0XFFE9EAF4),
  Color(0XFFFFEEEA),
  Color(0XFFCDF2E0),
  Color(0XFFF4EEE1),
  Color(0XFFEBFAFE),
  Color(0XFFE9EAF4),
  Color(0XFFFFEEEA),
  Color(0XFFCDF2E0),
  Color(0XFFF4EEE1),
  Color(0XFFEBFAFE),
];
List<Color> textcolor = [
  Color(0XFF4D56A2),
  Color(0XFFFD6540),
  Color(0XFF04D76F),
  Color(0XFFF0B604),
  Color(0XFF07CEDA),
  Color(0XFF4D56A2),
  Color(0XFFFD6540),
  Color(0XFF04D76F),
  Color(0XFFF0B604),
  Color(0XFF07CEDA),
];
List<Color> secondtextcolor = [
  Color(0XFF737BC1),
  Color(0XFFED947F),
  Color(0XFF04D76F),
  Color(0XFFEBC758),
  Color(0XFF63D3E2),
  Color(0XFF737BC1),
  Color(0XFFED947F),
  Color(0XFF04D76F),
  Color(0XFFEBC758),
  Color(0XFF63D3E2),
];
List<Color> circlecolor = [
  Color(0XFFBABDDB),
  Color(0XFFFFCABD),
  Color(0XFFA8E1C5),
  Color(0XFFFFE8B2),
  Color(0XFFC0EFFC),
  Color(0XFFBABDDB),
  Color(0XFFFFCABD),
  Color(0XFFA8E1C5),
  Color(0XFFFFE8B2),
  Color(0XFFC0EFFC),
];

class _BookingViewState extends State<BookingView> {
  var feature = "1234567890";
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
              color: Color.fromRGBO(191, 68, 116, 1),
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'Booking',
            style: TextStyle(
                color: Color.fromRGBO(191, 68, 116, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: feature.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Card(
                    color: color[index],
                    elevation: 4,
                    child: ListTile(
                      leading: Container(
                        child: CircleAvatar(
                            backgroundColor: circlecolor[index]),
                        height: 50,
                        width: 50,
                      ),
                      title: Row(
                        children: [
                          Text("Kochi",
                              style: TextStyle(
                                  color: textcolor[index],
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("--",
                              style: TextStyle(
                                  color: textcolor[index],
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("Morning Section",
                              style: TextStyle(
                                  color: secondtextcolor[index],
                                  fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text("Night Section",
                              style: TextStyle(
                                  color: secondtextcolor[index],
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
