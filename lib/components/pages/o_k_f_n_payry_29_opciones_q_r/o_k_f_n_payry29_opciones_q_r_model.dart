import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry29_opciones_q_r_widget.dart'
    show OKFNPayry29OpcionesQRWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry29OpcionesQRModel
    extends FlutterFlowModel<OKFNPayry29OpcionesQRWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    navBarFlotingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
