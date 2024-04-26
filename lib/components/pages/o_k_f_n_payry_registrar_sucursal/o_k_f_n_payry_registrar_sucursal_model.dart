import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'o_k_f_n_payry_registrar_sucursal_widget.dart'
    show OKFNPayryRegistrarSucursalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayryRegistrarSucursalModel
    extends FlutterFlowModel<OKFNPayryRegistrarSucursalWidget> {
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

  // State field(s) for StreetAddressField widget.
  FocusNode? streetAddressFieldFocusNode;
  TextEditingController? streetAddressFieldTextController;
  String? Function(BuildContext, String?)?
      streetAddressFieldTextControllerValidator;
  String? _streetAddressFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La dirección es requerida';
    }

    return null;
  }

  // State field(s) for ClabeField widget.
  FocusNode? clabeFieldFocusNode;
  TextEditingController? clabeFieldTextController;
  String? Function(BuildContext, String?)? clabeFieldTextControllerValidator;
  String? _clabeFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^\\d{18}\$').hasMatch(val)) {
      return 'La CLABE debe contener 18 caracteres';
    }
    return null;
  }

  // Stores action output result for [Custom Action - clabeClipboard] action in ClabeField widget.
  String? clabeParsed;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SucursalesRecord? createdBranch;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    streetAddressFieldTextControllerValidator =
        _streetAddressFieldTextControllerValidator;
    clabeFieldTextControllerValidator = _clabeFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    streetAddressFieldFocusNode?.dispose();
    streetAddressFieldTextController?.dispose();

    clabeFieldFocusNode?.dispose();
    clabeFieldTextController?.dispose();
  }
}
