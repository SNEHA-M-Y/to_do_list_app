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
    apiKey: 'AIzaSyC-WNUaqAMF1jSc8fLpsyR2Jdq1T5Y4Tu4',
    appId: '1:483203222055:web:6663ddc9cb84c3e17fdc02',
    messagingSenderId: '483203222055',
    projectId: 'to-do-list-app-c49fc',
    authDomain: 'to-do-list-app-c49fc.firebaseapp.com',
    storageBucket: 'to-do-list-app-c49fc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeNkKoacfw9Ob68nIKof1VFP_bJ-asey8',
    appId: '1:483203222055:android:7a4428a1fe9ececd7fdc02',
    messagingSenderId: '483203222055',
    projectId: 'to-do-list-app-c49fc',
    storageBucket: 'to-do-list-app-c49fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDDnZDfcZ1dTARDqitaNz6_ETEocPnR5Y',
    appId: '1:483203222055:ios:18b7ac92f7fb4af87fdc02',
    messagingSenderId: '483203222055',
    projectId: 'to-do-list-app-c49fc',
    storageBucket: 'to-do-list-app-c49fc.appspot.com',
    iosBundleId: 'com.example.toDoListApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCDDnZDfcZ1dTARDqitaNz6_ETEocPnR5Y',
    appId: '1:483203222055:ios:18b7ac92f7fb4af87fdc02',
    messagingSenderId: '483203222055',
    projectId: 'to-do-list-app-c49fc',
    storageBucket: 'to-do-list-app-c49fc.appspot.com',
    iosBundleId: 'com.example.toDoListApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-WNUaqAMF1jSc8fLpsyR2Jdq1T5Y4Tu4',
    appId: '1:483203222055:web:f28f1c86a58020197fdc02',
    messagingSenderId: '483203222055',
    projectId: 'to-do-list-app-c49fc',
    authDomain: 'to-do-list-app-c49fc.firebaseapp.com',
    storageBucket: 'to-do-list-app-c49fc.appspot.com',
  );
}
