import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry11_olvidecontrasenanueva_widget.dart'
    show OKFNPayry11OlvidecontrasenanuevaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry11OlvidecontrasenanuevaModel
    extends FlutterFlowModel<OKFNPayry11OlvidecontrasenanuevaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for new-password widget.
  FocusNode? newPasswordFocusNode1;
  TextEditingController? newPasswordController1;
  late bool newPasswordVisibility1;
  String? Function(BuildContext, String?)? newPasswordController1Validator;
  // State field(s) for new-password widget.
  FocusNode? newPasswordFocusNode2;
  TextEditingController? newPasswordController2;
  late bool newPasswordVisibility2;
  String? Function(BuildContext, String?)? newPasswordController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    newPasswordVisibility1 = false;
    newPasswordVisibility2 = false;
  }

  void dispose() {
    newPasswordFocusNode1?.dispose();
    newPasswordController1?.dispose();

    newPasswordFocusNode2?.dispose();
    newPasswordController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
