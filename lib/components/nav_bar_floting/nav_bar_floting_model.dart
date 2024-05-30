import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'nav_bar_floting_widget.dart' show NavBarFlotingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NavBarFlotingModel extends FlutterFlowModel<NavBarFlotingWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Verify Email)] action in Column widget.
  ApiCallResponse? verifyACDashNav;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Column widget.
  ApiCallResponse? verifyACCodiNav;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Column widget.
  ApiCallResponse? verifyACDimoNav;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
