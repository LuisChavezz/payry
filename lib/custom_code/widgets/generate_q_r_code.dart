// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({
    Key? key,
    this.width,
    this.height,
    this.qrData,
    this.qrSize,
    this.qrBackgroundColor,
    this.qrBorderRadius,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? qrData;
  final double? qrSize;
  final Color? qrBackgroundColor;
  final double? qrBorderRadius;

  @override
  _GenerateQRCodeState createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(widget.qrBorderRadius ?? 0),
        child: QrImageView(
          data: widget.qrData ?? '',
          version: QrVersions.auto,
          size: widget.qrSize ?? 200.0,
          padding: EdgeInsets.all(16.0),
          backgroundColor: widget.qrBackgroundColor ?? Colors.white,
        ));
  }
}
