import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyARwOirQ9DBOlaOSRyb-r7qEf7FI1iNOu4",
            authDomain: "kincepayry.firebaseapp.com",
            projectId: "kincepayry",
            storageBucket: "kincepayry.appspot.com",
            messagingSenderId: "833185029970",
            appId: "1:833185029970:web:2f782af218724bd060a48b",
            measurementId: "G-66SFH5YRWF"));
  } else {
    await Firebase.initializeApp();
  }
}
