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
    apiKey: 'AIzaSyARFiApoJIW4vFbKxTxGiGo3m3tFJrQDLc',
    appId: '1:986495727605:web:22b2c5692b5aab2a5412bc',
    messagingSenderId: '986495727605',
    projectId: 'klubo-406509',
    authDomain: 'klubo-406509.firebaseapp.com',
    storageBucket: 'klubo-406509.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCfd1Fk21zS945Ibc_M1jdVOGDbR_43zl4',
    appId: '1:986495727605:android:c514a1dd8f1c02d55412bc',
    messagingSenderId: '986495727605',
    projectId: 'klubo-406509',
    storageBucket: 'klubo-406509.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC-gZBwNFm6r4yPEbZg4igh1aAhI6MP6yw',
    appId: '1:986495727605:ios:c464c9ee4c80caff5412bc',
    messagingSenderId: '986495727605',
    projectId: 'klubo-406509',
    storageBucket: 'klubo-406509.appspot.com',
    iosBundleId: 'com.fab.klubo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC-gZBwNFm6r4yPEbZg4igh1aAhI6MP6yw',
    appId: '1:986495727605:ios:7675898d6846f6205412bc',
    messagingSenderId: '986495727605',
    projectId: 'klubo-406509',
    storageBucket: 'klubo-406509.appspot.com',
    iosBundleId: 'com.example.klubo.RunnerTests',
  );
}
