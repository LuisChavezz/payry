import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry25_permisos_widget.dart' show OKFNPayry25PermisosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry25PermisosModel
    extends FlutterFlowModel<OKFNPayry25PermisosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CreateQrSwitch widget.
  bool? createQrSwitchValue;
  // State field(s) for ReadQrSwitch widget.
  bool? readQrSwitchValue;
  // State field(s) for CreateSmsSwitch widget.
  bool? createSmsSwitchValue;
  // State field(s) for ReadSmsSwitch widget.
  bool? readSmsSwitchValue;
  // State field(s) for ReadTransfersSwitch widget.
  bool? readTransfersSwitchValue;
  // State field(s) for CreateRefundSwitch widget.
  bool? createRefundSwitchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
