// lib/firebase_options.dart

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyCvSyjxT5KFL71Uvvw3vcig6I7QeyUHY0w",
    appId: '1:640771551936:android:01688bb0fe4e93026f3325',
    messagingSenderId: '640771551936',
    projectId: 'realestateapp-f0737',
    storageBucket: 'realestateapp-f0737.appspot.com',
  );
}
