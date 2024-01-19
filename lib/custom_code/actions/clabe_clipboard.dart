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

Future<String> clabeClipboard(String clabe) async {
  if (clabe.length < 18) {
    return clabe;
  }

  try {
    // Get clipboard data
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);

    // Check if clipboard data is not null and has text
    if (data != null && data.text != null) {
      String clipboardText = data.text!;

      // Remove all spaces
      clipboardText = clipboardText.replaceAll(' ', '');

      // Check if clipboard data have 18 digits (CPF)
      RegExp regex = RegExp(r'^\d{18}$');
      if (regex.hasMatch(clipboardText)) {
        return clipboardText;
      } else {
        await Clipboard.setData(ClipboardData(text: '')); // Clean the clipboard
        return clabe;
      }
    } else {
      // If clipboard is empty or null
      return clabe;
    }
  } catch (e) {
    return clabe;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
