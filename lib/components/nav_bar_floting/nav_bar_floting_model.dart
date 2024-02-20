import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'nav_bar_floting_widget.dart' show NavBarFlotingWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarFlotingModel extends FlutterFlowModel<NavBarFlotingWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Cloud Function - verifyEmail] action in Column widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailRespN1;
  // Stores action output result for [Cloud Function - verifyEmail] action in Column widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailRespN2;
  // Stores action output result for [Cloud Function - verifyEmail] action in Column widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailRespN3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
