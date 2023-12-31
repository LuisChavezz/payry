import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry27_solicitar_q_r_widget.dart'
    show OKFNPayry27SolicitarQRWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry27SolicitarQRModel
    extends FlutterFlowModel<OKFNPayry27SolicitarQRWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ConceptField widget.
  FocusNode? conceptFieldFocusNode;
  TextEditingController? conceptFieldController;
  String? Function(BuildContext, String?)? conceptFieldControllerValidator;
  String? _conceptFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El concepto es requerido';
    }

    if (val.length < 10) {
      return 'El concepto debe contener al menos 10 caracteres';
    }

    return null;
  }

  // State field(s) for AmountField widget.
  FocusNode? amountFieldFocusNode;
  TextEditingController? amountFieldController;
  String? Function(BuildContext, String?)? amountFieldControllerValidator;
  String? _amountFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El importe es requerido';
    }

    if (!RegExp('^[1-9]\\d*(\\.\\d{1,2})?\$').hasMatch(val)) {
      return 'El formato del importe es inválido';
    }
    return null;
  }

  // Stores action output result for [Cloud Function - crearMovimientoQR] action in Button widget.
  CrearMovimientoQRCloudFunctionCallResponse? cloudFunctionik3;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  QrRecord? createdQR;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    conceptFieldControllerValidator = _conceptFieldControllerValidator;
    amountFieldControllerValidator = _amountFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    conceptFieldFocusNode?.dispose();
    conceptFieldController?.dispose();

    amountFieldFocusNode?.dispose();
    amountFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
