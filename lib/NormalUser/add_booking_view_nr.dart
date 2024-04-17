import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBookingViewNr extends StatefulWidget {
  const AddBookingViewNr({super.key});

  @override
  State<AddBookingViewNr> createState() => _AddBookingViewNrState();
}

class _AddBookingViewNrState extends State<AddBookingViewNr> {
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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          height: 319,
          width: 335,
          decoration: BoxDecoration(
            color: Color.fromRGBO(210, 211, 226, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Container(
                  height: 74,
                  width: 193,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(187, 191, 225, 1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('Manjeri',
                            style: TextStyle(
                                color: Color.fromRGBO(77, 86, 162, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text('Morning Section',
                          style: TextStyle(
                              color: Color.fromRGBO(115, 123, 193, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                        height: 33,
                        width: 81,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(192, 43, 43, 1),
                              Color.fromRGBO(192, 43, 43, 1),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                          child: Text('Booked',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )),
                  )),
              Container(
                height: 74,
                width: 193,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(187, 191, 225, 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text('--',
                          style: GoogleFonts.ubuntu(
                              color: Color.fromRGBO(77, 86, 162, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text('Night section',
                        style: TextStyle(
                            color: Color.fromRGBO(115, 123, 193, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10,top: 15),
                    child: Container(
                        height: 33,
                        width: 81,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(123, 191, 69, 1),
                              Color.fromRGBO(126, 203, 64, 1),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18, 5, 5, 5),
                          child: Text('Book',
                              style: GoogleFonts.ubuntu(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
