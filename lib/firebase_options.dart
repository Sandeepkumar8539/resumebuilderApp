// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBGbs-N1szPoOm-Hk8YTMXmj-hbO6ZEvnA',
    appId: '1:446926968670:web:5475f05b16b270c6d6e1cf',
    messagingSenderId: '446926968670',
    projectId: 'resumebuilder-b436f',
    authDomain: 'resumebuilder-b436f.firebaseapp.com',
    storageBucket: 'resumebuilder-b436f.appspot.com',
    measurementId: 'G-Z4GC6PZ784',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMbpDV--Ro7zv50vT-tWk-2zaFOOHb46o',
    appId: '1:446926968670:android:75cc497e2ccc1d8fd6e1cf',
    messagingSenderId: '446926968670',
    projectId: 'resumebuilder-b436f',
    storageBucket: 'resumebuilder-b436f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfKjlxmmDXB-vdVicgZkykTiIccyTrGIw',
    appId: '1:446926968670:ios:895d93d32df6c5bfd6e1cf',
    messagingSenderId: '446926968670',
    projectId: 'resumebuilder-b436f',
    storageBucket: 'resumebuilder-b436f.appspot.com',
    iosBundleId: 'com.example.resumebuilderapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfKjlxmmDXB-vdVicgZkykTiIccyTrGIw',
    appId: '1:446926968670:ios:1671fa374e937989d6e1cf',
    messagingSenderId: '446926968670',
    projectId: 'resumebuilder-b436f',
    storageBucket: 'resumebuilder-b436f.appspot.com',
    iosBundleId: 'com.example.resumebuilderapp.RunnerTests',
  );
}