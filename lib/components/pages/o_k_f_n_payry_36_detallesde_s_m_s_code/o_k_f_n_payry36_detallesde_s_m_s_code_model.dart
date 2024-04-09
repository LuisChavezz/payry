import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry36_detallesde_s_m_s_code_widget.dart'
    show OKFNPayry36DetallesdeSMSCodeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry36DetallesdeSMSCodeModel
    extends FlutterFlowModel<OKFNPayry36DetallesdeSMSCodeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  RegistraCobroRecord? dimoResp;
  // Stores action output result for [Backend Call - API (Generate Dimo)] action in IconButton widget.
  ApiCallResponse? dimoAC;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
