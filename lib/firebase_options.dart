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
    apiKey: 'AIzaSyD1cAlIbnlQhgP48K3eGA8rUbBywC2nXZc',
    appId: '1:152305990941:web:f5b83e288f2c732f13f5f4',
    messagingSenderId: '152305990941',
    projectId: 'e-com-beauty',
    authDomain: 'e-com-beauty.firebaseapp.com',
    databaseURL: 'https://e-com-beauty-default-rtdb.firebaseio.com',
    storageBucket: 'e-com-beauty.appspot.com',
    measurementId: 'G-KR68WQ0X0W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjap9Wo50-Dp5dwZsm6OLdMzZO5HzXkb8',
    appId: '1:152305990941:android:c60cf6491f8a621d13f5f4',
    messagingSenderId: '152305990941',
    projectId: 'e-com-beauty',
    databaseURL: 'https://e-com-beauty-default-rtdb.firebaseio.com',
    storageBucket: 'e-com-beauty.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKpbxzUJNaybrD6bzAKlBFTekwqEC9E-M',
    appId: '1:152305990941:ios:875a7ea9745aea6d13f5f4',
    messagingSenderId: '152305990941',
    projectId: 'e-com-beauty',
    databaseURL: 'https://e-com-beauty-default-rtdb.firebaseio.com',
    storageBucket: 'e-com-beauty.appspot.com',
    iosClientId: '152305990941-mh45100do4vfees6qjcl3ri97eghrrh6.apps.googleusercontent.com',
    iosBundleId: 'com.example.beautyECommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBKpbxzUJNaybrD6bzAKlBFTekwqEC9E-M',
    appId: '1:152305990941:ios:875a7ea9745aea6d13f5f4',
    messagingSenderId: '152305990941',
    projectId: 'e-com-beauty',
    databaseURL: 'https://e-com-beauty-default-rtdb.firebaseio.com',
    storageBucket: 'e-com-beauty.appspot.com',
    iosClientId: '152305990941-mh45100do4vfees6qjcl3ri97eghrrh6.apps.googleusercontent.com',
    iosBundleId: 'com.example.beautyECommerce',
  );
}