import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry_editar_sucursal_widget.dart'
    show OKFNPayryEditarSucursalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayryEditarSucursalModel
    extends FlutterFlowModel<OKFNPayryEditarSucursalWidget> {
  ///  Local state fields for this page.

  String? bankId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    return null;
  }

  // State field(s) for StreetField widget.
  FocusNode? streetFieldFocusNode;
  TextEditingController? streetFieldTextController;
  String? Function(BuildContext, String?)? streetFieldTextControllerValidator;
  String? _streetFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La calle es requerida';
    }

    return null;
  }

  // State field(s) for StreetNumberField widget.
  FocusNode? streetNumberFieldFocusNode;
  TextEditingController? streetNumberFieldTextController;
  String? Function(BuildContext, String?)?
      streetNumberFieldTextControllerValidator;
  String? _streetNumberFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número es requerido';
    }

    return null;
  }

  // State field(s) for check widget.
  bool? checkValue;
  // State field(s) for ClabeField widget.
  FocusNode? clabeFieldFocusNode;
  TextEditingController? clabeFieldTextController;
  String? Function(BuildContext, String?)? clabeFieldTextControllerValidator;
  // Stores action output result for [Custom Action - clabeClipboard] action in ClabeField widget.
  String? clabeParsed;
  // Stores action output result for [Firestore Query - Query a collection] action in ClabeField widget.
  BankCatalogueRecord? bankCatalogueDocument;
  // State field(s) for BankField widget.
  FocusNode? bankFieldFocusNode;
  TextEditingController? bankFieldTextController;
  String? Function(BuildContext, String?)? bankFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    streetFieldTextControllerValidator = _streetFieldTextControllerValidator;
    streetNumberFieldTextControllerValidator =
        _streetNumberFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    streetFieldFocusNode?.dispose();
    streetFieldTextController?.dispose();

    streetNumberFieldFocusNode?.dispose();
    streetNumberFieldTextController?.dispose();

    clabeFieldFocusNode?.dispose();
    clabeFieldTextController?.dispose();

    bankFieldFocusNode?.dispose();
    bankFieldTextController?.dispose();
  }
}
