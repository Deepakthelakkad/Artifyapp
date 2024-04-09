import 'package:artify_app/User/about_us_nr.dart';
import 'package:artify_app/User/booking_view.dart';
import 'package:artify_app/User/change_password_pr.dart';
import 'package:artify_app/User/help_pr.dart';
import 'package:artify_app/User/settings_pr.dart';
import 'package:artify_app/url_launcher.dart';
import 'package:artify_app/Admin/admin_login.dart';
import 'package:artify_app/Artists/artist_home.dart';
import 'package:artify_app/Artists/artist_login.dart';
import 'package:artify_app/User/achievement.dart';
import 'package:artify_app/User/add_booking.dart';
import 'package:artify_app/User/artist_view.dart';
import 'package:artify_app/User/booking.dart';
import 'package:artify_app/User/bottom_button.dart';
import 'package:artify_app/User/chat_list.dart';
import 'package:artify_app/User/edit_profile.dart';
import 'package:artify_app/User/events.dart';
import 'package:artify_app/User/saved_artist_pr.dart';
import 'package:artify_app/User/user_homepage.dart';
import 'package:artify_app/User/user_login.dart';
import 'package:artify_app/User/user_profile.dart';
import 'package:flutter/material.dart';

import 'Admin/admin_login.dart';
import 'User/add_booking.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AboutUsNr(),
    );
  }
}

