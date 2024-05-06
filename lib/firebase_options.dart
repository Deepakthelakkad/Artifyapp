// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCvHowYovIAlWaX1BLPfIY5G7wCKCSQcjg',
    appId: '1:878879487474:web:f4ca91237300c7ae63676b',
    messagingSenderId: '878879487474',
    projectId: 'artify-cd144',
    authDomain: 'artify-cd144.firebaseapp.com',
    databaseURL: 'https://artify-cd144-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artify-cd144.appspot.com',
    measurementId: 'G-3CY6H9HT7B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_ZrHTWwq-FLyBruRK9hvC5lJ4ZA5fxLQ',
    appId: '1:878879487474:android:fd6422412e0561d163676b',
    messagingSenderId: '878879487474',
    projectId: 'artify-cd144',
    databaseURL: 'https://artify-cd144-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artify-cd144.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBR0rAb4U_QN_9y20LpGjU7WCdWB5B0jFA',
    appId: '1:878879487474:ios:a1c611fc4e2976cf63676b',
    messagingSenderId: '878879487474',
    projectId: 'artify-cd144',
    databaseURL: 'https://artify-cd144-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artify-cd144.appspot.com',
    iosBundleId: 'com.example.artifyApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBR0rAb4U_QN_9y20LpGjU7WCdWB5B0jFA',
    appId: '1:878879487474:ios:a1c611fc4e2976cf63676b',
    messagingSenderId: '878879487474',
    projectId: 'artify-cd144',
    databaseURL: 'https://artify-cd144-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artify-cd144.appspot.com',
    iosBundleId: 'com.example.artifyApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvHowYovIAlWaX1BLPfIY5G7wCKCSQcjg',
    appId: '1:878879487474:web:7d3338c750889c0363676b',
    messagingSenderId: '878879487474',
    projectId: 'artify-cd144',
    authDomain: 'artify-cd144.firebaseapp.com',
    databaseURL: 'https://artify-cd144-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'artify-cd144.appspot.com',
    measurementId: 'G-K3KNQS0Y70',
  );
}
