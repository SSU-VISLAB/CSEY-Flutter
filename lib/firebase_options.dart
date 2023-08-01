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
    apiKey: 'AIzaSyAEU-CHEmYMLlSLnRLpmoABONwqHZGVREw',
    appId: '1:491214968405:web:08e469439f00c3c07ba6dc',
    messagingSenderId: '491214968405',
    projectId: 'test-csey',
    authDomain: 'test-csey.firebaseapp.com',
    storageBucket: 'test-csey.appspot.com',
    measurementId: 'G-JGZP14R2TG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh4snm28_9Nn4jZR2i5lil-vB8xmYpNTc',
    appId: '1:491214968405:android:a4d1d34217d35f327ba6dc',
    messagingSenderId: '491214968405',
    projectId: 'test-csey',
    storageBucket: 'test-csey.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCglwzMN_EPVZNf5ULuz38rB9S-N8MjHx0',
    appId: '1:491214968405:ios:53d25f20fc30ef527ba6dc',
    messagingSenderId: '491214968405',
    projectId: 'test-csey',
    storageBucket: 'test-csey.appspot.com',
    iosClientId: '491214968405-t9ijl8tf168a7ldqp30a8bu2cku1kq0f.apps.googleusercontent.com',
    iosBundleId: 'com.example.csey',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCglwzMN_EPVZNf5ULuz38rB9S-N8MjHx0',
    appId: '1:491214968405:ios:53d25f20fc30ef527ba6dc',
    messagingSenderId: '491214968405',
    projectId: 'test-csey',
    storageBucket: 'test-csey.appspot.com',
    iosClientId: '491214968405-t9ijl8tf168a7ldqp30a8bu2cku1kq0f.apps.googleusercontent.com',
    iosBundleId: 'com.example.csey',
  );
}
