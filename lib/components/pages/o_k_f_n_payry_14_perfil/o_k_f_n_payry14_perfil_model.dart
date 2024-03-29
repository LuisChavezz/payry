import '/auth/firebase_auth/auth_util.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry14_perfil_widget.dart' show OKFNPayry14PerfilWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry14PerfilModel extends FlutterFlowModel<OKFNPayry14PerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Cloud Function - verifyEmail] action in Row widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp;
  // Stores action output result for [Cloud Function - verifyEmail] action in Row widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp1;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
