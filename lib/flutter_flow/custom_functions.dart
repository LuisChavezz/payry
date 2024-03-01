import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? getFirstThreeCharacters(String inputString) {
  if (inputString.length >= 3) {
    return inputString.substring(0, 3);
  } else {
    return inputString;
  }
}

bool? validateMinimumLength(
  String? inputString,
  int? minLength,
) {
  if (inputString != null &&
      minLength != null &&
      inputString.length >= minLength) {
    return true;
  } else {
    return false;
  }
}

String? formatSharedQRText(
  String imagePath,
  double qrAmount,
  String qrConcept,
) {
  // Formatea el monto con dos decimales y símbolo de dólar
  final formattedAmount = '\$${qrAmount.toStringAsFixed(2)}';

  // Construye la cadena de salida
  final output = '${imagePath}\nConcepto: $qrConcept\nMonto: $formattedAmount';

  return output;
}

String? imagePathToString(String? imagePath) {
  if (imagePath != null) {
    return imagePath;
  }
  return null;
}

String? toUppercase(String? text) {
  if (text == null) {
    return null;
  }
  return text.toUpperCase();
}

dynamic notificationRedirect(
  String? url,
  String? subject,
) {
  try {
    if (url == null || subject == null) {
      return {'redirect': false, 'type': '', 'id': ''};
    }

    Uri uri = Uri.parse(url);
    String path = uri.queryParameters['link'] ?? '';
    String id = path.substring(path.lastIndexOf('/') + 1);

    bool redirect = subject.toLowerCase().contains('codi') ||
        subject.toLowerCase().contains('dimo');
    String type = redirect
        ? (subject.toLowerCase().contains('codi') ? 'codi' : 'dimo')
        : '';

    // Return the result as a JSON map
    return {'redirect': redirect, 'type': type, 'id': id};
  } catch (e) {
    return {'redirect': false, 'type': '', 'id': ''};
  }
}

DocumentReference? jsonPathToSmsDocRef(String? id) {
  try {
    return FirebaseFirestore.instance.collection('sms').doc(id);
  } catch (e) {
    throw e;
  }
}

String? jsonPathToString(String? jsonPath) {
  return jsonPath;
}

DocumentReference? jsonPathToQrDocRef(String? id) {
  try {
    return FirebaseFirestore.instance.collection('qr').doc(id);
  } catch (e) {
    throw e;
  }
}

bool? includeTheString(
  String message,
  String text,
) {
  String lowerCaseMessage = message.toLowerCase();
  String lowerCaseText = text.toLowerCase();

  return lowerCaseMessage.contains(lowerCaseText);
}

bool? amountLimit(String amountString) {
  try {
    double amount = double.parse(amountString);

    if (amount <= 8000.00) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // Capturar cualquier error de conversión
    print('Error: $e');
    return null;
  }
}

List<String> returnGirosArray(GirosRecord document) {
  List<String> giros = [];

  if (document != null && document.giros != null) {
    giros.addAll(document.giros!);
  }

  return giros;
}

DocumentReference? jsonPathToRegistraCobroDocRef(String? id) {
  try {
    return FirebaseFirestore.instance.collection('registraCobro').doc(id);
  } catch (e) {
    throw e;
  }
}
