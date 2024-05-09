import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dynamic_switch_user_status_widget.dart'
    show DynamicSwitchUserStatusWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DynamicSwitchUserStatusModel
    extends FlutterFlowModel<DynamicSwitchUserStatusWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Switch widget.
  bool switchValue = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
