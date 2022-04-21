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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCNhyPl7v5Yt3cuZC5ZWJp8AJ3RpvCrF3Q',
    appId: '1:790666937629:web:575748263846b492c9cdf4',
    messagingSenderId: '790666937629',
    projectId: 'gradeaid',
    authDomain: 'gradeaid.firebaseapp.com',
    storageBucket: 'gradeaid.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKUFJj3b097UGojohrPUNwm97jPDS-62c',
    appId: '1:790666937629:android:328d95dad559bd7ac9cdf4',
    messagingSenderId: '790666937629',
    projectId: 'gradeaid',
    storageBucket: 'gradeaid.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA62tE5mGEYXdwc_7Y6fMUmQ1ppvRVVfSU',
    appId: '1:790666937629:ios:2194b01e7bf35eaac9cdf4',
    messagingSenderId: '790666937629',
    projectId: 'gradeaid',
    storageBucket: 'gradeaid.appspot.com',
    iosClientId: '790666937629-6n3g2adf1h4bqbicr6i79kdgi2scjgd8.apps.googleusercontent.com',
    iosBundleId: 'be.ap.gradeaid',
  );
}
