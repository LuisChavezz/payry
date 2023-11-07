// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

// NO FUNCIONA!

Future<void> downloadFileFromUrl(String? url) async {
  try {
    if (url != null) {
      final taskId = await FlutterDownloader.enqueue(
        url: url,
        savedDir: (await getExternalStorageDirectory())?.path ?? '',
        showNotification: true, // Mostrar notificación de descarga
        openFileFromNotification: true, // Abrir archivo desde la notificación
        saveInPublicStorage: true, // Guardar en almacenamiento público
      );

      FlutterDownloader.registerCallback((id, status, progress) {
        if (status == DownloadTaskStatus.complete) {
          // La descarga se completó con éxito
          print('Descarga completada. ID de tarea: $id');
        } else if (status == DownloadTaskStatus.failed) {
          // La descarga falló
          print('Descarga fallida. ID de tarea: $id');
        }
      });
    } else {
      print('La URL es nula, no se puede descargar.');
    }
  } catch (e) {
    print('Error: $e');
  }
}
