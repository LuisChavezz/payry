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

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

Future initializeDownloaderPlugin() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterDownloader.initialize(
    debug: false, // Cambia a false en producción
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
}
