// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'dart:io';

// Nueva custom action para compartir la imagen
Future<void> shareImage(String imageUrl) async {
  if (imageUrl != null && imageUrl.isNotEmpty) {
    try {
      // Descargar la imagen desde la URL
      final response = await http.get(Uri.parse(imageUrl));
      Uint8List bytes = response.bodyBytes;

      // Guardar la imagen en un archivo temporal
      String tempPath = (await getTemporaryDirectory()).path;
      String imagePath = '$tempPath/myItem.png';
      await File(imagePath).writeAsBytes(bytes);

      // Compartir la imagen utilizando la librería share_plus
      await Share.shareFiles([imagePath]);
    } catch (e) {}
  } else {}
}
