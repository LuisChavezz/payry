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

import 'package:package_info_plus/package_info_plus.dart';

Future<dynamic> getAppInfo() async {
  try {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return {
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
      'buildSignature': packageInfo.buildSignature,
      'installerStore': packageInfo.installerStore,
    };
  } catch (e) {
    print('Error al obtener información de la aplicación: $e');
    return {
      'appName': 'Desconocido',
      'packageName': 'Desconocido',
      'version': 'Desconocido',
      'buildNumber': 'Desconocido',
      'buildSignature': 'Desconocido',
      'installerStore': 'Desconocido',
    };
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
