import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry20_datos_bancarios_v_i_e_w_widget.dart'
    show OKFNPayry20DatosBancariosVIEWWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry20DatosBancariosVIEWModel
    extends FlutterFlowModel<OKFNPayry20DatosBancariosVIEWWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ClabeField widget.
  FocusNode? clabeFieldFocusNode;
  TextEditingController? clabeFieldController;
  String? Function(BuildContext, String?)? clabeFieldControllerValidator;
  String? _clabeFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La CLABE es requerida';
    }

    if (!RegExp('^\\d{18}\$').hasMatch(val)) {
      return 'La CLABE debe contener 18 caracteres';
    }
    return null;
  }

  // State field(s) for BankField widget.
  FocusNode? bankFieldFocusNode;
  TextEditingController? bankFieldController;
  String? Function(BuildContext, String?)? bankFieldControllerValidator;
  String? _bankFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debes agregar una CLABE válida para agregar el Banco automáticamente.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    clabeFieldControllerValidator = _clabeFieldControllerValidator;
    bankFieldControllerValidator = _bankFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    clabeFieldFocusNode?.dispose();
    clabeFieldController?.dispose();

    bankFieldFocusNode?.dispose();
    bankFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
