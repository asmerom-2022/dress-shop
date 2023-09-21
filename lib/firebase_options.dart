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
    apiKey: 'AIzaSyAeRlZPczkxSoTKyDs2Ubq9ZgmW3tM5G_U',
    appId: '1:451041953313:web:f8b6e1869e8ad572c58560',
    messagingSenderId: '451041953313',
    projectId: 'dress-shop-f3293',
    authDomain: 'dress-shop-f3293.firebaseapp.com',
    storageBucket: 'dress-shop-f3293.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXXLu0mMsgAMClzgFmJqPVGR7vEouUTIs',
    appId: '1:451041953313:android:8d400c058f8ac0ddc58560',
    messagingSenderId: '451041953313',
    projectId: 'dress-shop-f3293',
    storageBucket: 'dress-shop-f3293.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfqpoXScbWYEtgLSmIrIPScaSHJ3wza3g',
    appId: '1:451041953313:ios:6ab33c334eca2b9dc58560',
    messagingSenderId: '451041953313',
    projectId: 'dress-shop-f3293',
    storageBucket: 'dress-shop-f3293.appspot.com',
    androidClientId: '451041953313-pl466dca4ednb3m0ndm360dqo7085mq4.apps.googleusercontent.com',
    iosClientId: '451041953313-kf8ns0u1lubbaraoof2t30u97fk29kr3.apps.googleusercontent.com',
    iosBundleId: 'com.example.dressShop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfqpoXScbWYEtgLSmIrIPScaSHJ3wza3g',
    appId: '1:451041953313:ios:a30b836987fa34cdc58560',
    messagingSenderId: '451041953313',
    projectId: 'dress-shop-f3293',
    storageBucket: 'dress-shop-f3293.appspot.com',
    androidClientId: '451041953313-pl466dca4ednb3m0ndm360dqo7085mq4.apps.googleusercontent.com',
    iosClientId: '451041953313-gjc8m16v450qu06626ij7sg0lcu7nq4g.apps.googleusercontent.com',
    iosBundleId: 'com.example.dressShop.RunnerTests',
  );
}
