import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webRecaptchaSiteKey: '6LeFCAUoAAAAAOf9_lfx6L83Vn5hzKMGVLCDpaSF',
      androidProvider: AndroidProvider.playIntegrity,
    );
