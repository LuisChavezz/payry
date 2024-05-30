import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry11_olvidecontrasenanueva_widget.dart'
    show OKFNPayry11OlvidecontrasenanuevaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry11OlvidecontrasenanuevaModel
    extends FlutterFlowModel<OKFNPayry11OlvidecontrasenanuevaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for new-password widget.
  FocusNode? newPasswordFocusNode1;
  TextEditingController? newPasswordTextController1;
  late bool newPasswordVisibility1;
  String? Function(BuildContext, String?)? newPasswordTextController1Validator;
  // State field(s) for new-password widget.
  FocusNode? newPasswordFocusNode2;
  TextEditingController? newPasswordTextController2;
  late bool newPasswordVisibility2;
  String? Function(BuildContext, String?)? newPasswordTextController2Validator;

  @override
  void initState(BuildContext context) {
    newPasswordVisibility1 = false;
    newPasswordVisibility2 = false;
  }

  @override
  void dispose() {
    newPasswordFocusNode1?.dispose();
    newPasswordTextController1?.dispose();

    newPasswordFocusNode2?.dispose();
    newPasswordTextController2?.dispose();
  }
}
