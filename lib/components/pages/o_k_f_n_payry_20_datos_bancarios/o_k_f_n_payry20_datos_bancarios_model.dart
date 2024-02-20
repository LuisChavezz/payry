import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry20_datos_bancarios_widget.dart'
    show OKFNPayry20DatosBancariosWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry20DatosBancariosModel
    extends FlutterFlowModel<OKFNPayry20DatosBancariosWidget> {
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

  // Stores action output result for [Custom Action - clabeClipboard] action in ClabeField widget.
  String? clabeParsed;
  // Stores action output result for [Firestore Query - Query a collection] action in ClabeField widget.
  BankCatalogueRecord? bankCatalogueDocument;
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

  // Stores action output result for [Cloud Function - saveBankCompany] action in Button widget.
  SaveBankCompanyCloudFunctionCallResponse? cloudFunctionBankCompany;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    clabeFieldControllerValidator = _clabeFieldControllerValidator;
    bankFieldControllerValidator = _bankFieldControllerValidator;
  }

  @override
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
