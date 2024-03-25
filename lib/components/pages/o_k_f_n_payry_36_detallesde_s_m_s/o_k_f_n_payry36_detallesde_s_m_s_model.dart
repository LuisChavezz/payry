import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/components/phone_submit_dialog/phone_submit_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry36_detallesde_s_m_s_widget.dart'
    show OKFNPayry36DetallesdeSMSWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class OKFNPayry36DetallesdeSMSModel
    extends FlutterFlowModel<OKFNPayry36DetallesdeSMSWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Cloud Function - refund] action in IconButton widget.
  RefundCloudFunctionCallResponse? refundCF;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  RegistraCobroRecord? dimoResp;
  // Stores action output result for [Cloud Function - generateDimo] action in IconButton widget.
  GenerateDimoCloudFunctionCallResponse? dimoCF;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
