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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA5VP3ygTYkHnWqIJ8n0YJrjP_AtGapjhg',
    appId: '1:636757728398:web:0add28b31dc9843d703ddf',
    messagingSenderId: '636757728398',
    projectId: 'eventx-843f6',
    authDomain: 'eventx-843f6.firebaseapp.com',
    storageBucket: 'eventx-843f6.appspot.com',
    measurementId: 'G-TVFJ9L9RQF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2BM7D-Wa3FyKPw2GLgtrTiZBfM_GQqyw',
    appId: '1:636757728398:android:7535e08be6c2030a703ddf',
    messagingSenderId: '636757728398',
    projectId: 'eventx-843f6',
    storageBucket: 'eventx-843f6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAB83FirlnjNF8p9os2Uh3PotXodWeijIg',
    appId: '1:636757728398:ios:22ffc552856e350f703ddf',
    messagingSenderId: '636757728398',
    projectId: 'eventx-843f6',
    storageBucket: 'eventx-843f6.appspot.com',
    iosBundleId: 'com.example.eventx',
  );
}
