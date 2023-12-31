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
import '/auth/firebase_auth/auth_util.dart';

String? getFirstThreeCharacters(String? inputString) {
  /// Verifica si la longitud de la cadena es mayor o igual a 3
  if (inputString != null && inputString.length >= 3) {
    /// Devuelve los primeros 3 caracteres
    return inputString.substring(0, 3);
  } else {
    /// Si la cadena es más corta que 3 caracteres, devuelve la cadena completa
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
