import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/status_dropdown/status_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry24_listado_usuarios_widget.dart'
    show OKFNPayry24ListadoUsuariosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry24ListadoUsuariosModel
    extends FlutterFlowModel<OKFNPayry24ListadoUsuariosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for StatusDropdown dynamic component.
  late FlutterFlowDynamicModels<StatusDropdownModel> statusDropdownModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    statusDropdownModels =
        FlutterFlowDynamicModels(() => StatusDropdownModel());
  }

  void dispose() {
    unfocusNode.dispose();
    statusDropdownModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
