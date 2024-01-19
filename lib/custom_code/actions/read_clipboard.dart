// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future<String> readClipboard() async {
  try {
    // Obtener datos del portapapeles
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);

    // Verificar si hay datos de texto en el portapapeles
    if (data != null && data.text != null) {
      String textoDelPortapapeles = data.text!;
      return textoDelPortapapeles;
    } else {
      return 'FAILED';
    }
  } catch (e) {
    return 'CATCH ERROR';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
