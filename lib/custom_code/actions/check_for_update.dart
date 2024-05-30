// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:new_version_plus/new_version_plus.dart';

final newVersionPlus = NewVersionPlus();

Future<dynamic> checkForUpdate() async {
  try {
    final status = await newVersionPlus.getVersionStatus();
    if (status != null) {
      return {
        'hasUpdate': status.canUpdate ?? false,
        'storeLink': status.appStoreLink ?? '',
      };
    } else {
      return {
        'hasUpdate': false,
        'storeLink': '',
      };
    }
  } catch (e) {
    print('Error al verificar la versión de la aplicación: $e');
    return {
      'hasUpdate': false,
      'storeLink': '',
    };
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
