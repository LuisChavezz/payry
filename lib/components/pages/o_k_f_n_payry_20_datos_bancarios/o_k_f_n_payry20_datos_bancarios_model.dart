import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/agregar_datos_bancarios.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry20_datos_bancarios_widget.dart'
    show OKFNPayry20DatosBancariosWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry20DatosBancariosModel
    extends FlutterFlowModel<OKFNPayry20DatosBancariosWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? agregarDatosBancariosController;
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ClabeField widget.
  FocusNode? clabeFieldFocusNode;
  TextEditingController? clabeFieldTextController;
  String? Function(BuildContext, String?)? clabeFieldTextControllerValidator;
  String? _clabeFieldTextControllerValidator(
      BuildContext context, String? val) {
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
  TextEditingController? bankFieldTextController;
  String? Function(BuildContext, String?)? bankFieldTextControllerValidator;
  String? _bankFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debes agregar una CLABE válida para agregar el Banco automáticamente.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SucursalesRecord? createdBranch;
  // Stores action output result for [Backend Call - API (Report Company)] action in Button widget.
  ApiCallResponse? rcAC;

  @override
  void initState(BuildContext context) {
    clabeFieldTextControllerValidator = _clabeFieldTextControllerValidator;
    bankFieldTextControllerValidator = _bankFieldTextControllerValidator;
  }

  @override
  void dispose() {
    agregarDatosBancariosController?.finish();
    unfocusNode.dispose();
    clabeFieldFocusNode?.dispose();
    clabeFieldTextController?.dispose();

    bankFieldFocusNode?.dispose();
    bankFieldTextController?.dispose();
  }
}
