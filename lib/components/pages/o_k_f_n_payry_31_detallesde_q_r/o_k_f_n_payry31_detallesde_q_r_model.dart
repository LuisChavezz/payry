import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/components/phone_submit_dialog/phone_submit_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry31_detallesde_q_r_widget.dart'
    show OKFNPayry31DetallesdeQRWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OKFNPayry31DetallesdeQRModel
    extends FlutterFlowModel<OKFNPayry31DetallesdeQRWidget> {
  ///  Local state fields for this page.

  bool isUpdating = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Cloud Function - refund] action in IconButton widget.
  RefundCloudFunctionCallResponse? refundCF;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  RegistraCobroRecord? codiResp;
  // Stores action output result for [Cloud Function - generateCodi] action in IconButton widget.
  GenerateCodiCloudFunctionCallResponse? codiCF;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
