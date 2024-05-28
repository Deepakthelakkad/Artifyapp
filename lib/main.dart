import 'package:artify_app/Admin/31admin_artist_view.dart';
import 'package:artify_app/Admin/2admin_manage.dart';
import 'package:artify_app/Admin/422admin_nor_user_view.dart';
import 'package:artify_app/Admin/3artists_manage.dart';
import 'package:artify_app/Admin/rating.dart';
import 'package:artify_app/Admin/41user_manage.dart';
import 'package:artify_app/Artists/artist_profile.dart';
import 'package:artify_app/Artists/edit_profile_artist.dart';
import 'package:artify_app/Artists/settings_artist.dart';
import 'package:artify_app/NormalUser/add_booking_nr.dart';
import 'package:artify_app/NormalUser/artist_view_nr.dart';
import 'package:artify_app/NormalUser/booking_nr.dart';
import 'package:artify_app/NormalUser/bottom_button_nr.dart';
import 'package:artify_app/NormalUser/events_nr.dart';
import 'package:artify_app/NormalUser/normal_user_login.dart';
import 'package:artify_app/NormalUser/registration_nr.dart';
import 'package:artify_app/User/about_us_pr.dart';
import 'package:artify_app/User/booking_view.dart';
import 'package:artify_app/User/change_password_pr.dart';
import 'package:artify_app/User/help_pr.dart';
import 'package:artify_app/User/settings_pr.dart';
import 'package:artify_app/firebase_options.dart';
import 'package:artify_app/1intro.dart';
import 'package:artify_app/3user_type.dart';
import 'package:artify_app/2section_login.dart';
import 'package:artify_app/url_launcher.dart';
import 'package:artify_app/Admin/1admin_login.dart';
import 'package:artify_app/Artists/artist_registration.dart';
import 'package:artify_app/Artists/artist_login.dart';
import 'package:artify_app/User/achievement_pr.dart';
import 'package:artify_app/User/add_booking.dart';
import 'package:artify_app/User/artist_view.dart';
import 'package:artify_app/User/booking_pr.dart';
import 'package:artify_app/User/bottom_button_pr.dart';
import 'package:artify_app/User/chat_list_pr.dart';
import 'package:artify_app/User/edit_profile_pr.dart';
import 'package:artify_app/User/events.dart';
import 'package:artify_app/User/saved_artist_pr.dart';
import 'package:artify_app/User/user_homepage_pr.dart';
import 'package:artify_app/User/user_login_pr.dart';
import 'package:artify_app/User/user_profile_pr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Admin/1admin_login.dart';
import 'User/add_booking.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: Intro(),
    );
  }
}
