import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry31_detallesde_q_r_code_widget.dart'
    show OKFNPayry31DetallesdeQRCodeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OKFNPayry31DetallesdeQRCodeModel
    extends FlutterFlowModel<OKFNPayry31DetallesdeQRCodeWidget> {
  ///  Local state fields for this page.

  bool isUpdating = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  RegistraCobroRecord? codiResp;
  // Stores action output result for [Backend Call - API (Generate Codi)] action in IconButton widget.
  ApiCallResponse? codiAC;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
