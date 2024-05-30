import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry05_register_inv_widget.dart'
    show OKFNPayry05RegisterInvWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry05RegisterInvModel
    extends FlutterFlowModel<OKFNPayry05RegisterInvWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for InvNameField widget.
  FocusNode? invNameFieldFocusNode;
  TextEditingController? invNameFieldTextController;
  String? Function(BuildContext, String?)? invNameFieldTextControllerValidator;
  // State field(s) for InvEmailField widget.
  FocusNode? invEmailFieldFocusNode;
  TextEditingController? invEmailFieldTextController;
  String? Function(BuildContext, String?)? invEmailFieldTextControllerValidator;
  // State field(s) for inv-password-Create widget.
  FocusNode? invPasswordCreateFocusNode;
  TextEditingController? invPasswordCreateTextController;
  late bool invPasswordCreateVisibility;
  String? Function(BuildContext, String?)?
      invPasswordCreateTextControllerValidator;
  // State field(s) for invPasswordConfirm widget.
  FocusNode? invPasswordConfirmFocusNode;
  TextEditingController? invPasswordConfirmTextController;
  late bool invPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      invPasswordConfirmTextControllerValidator;
  // Stores action output result for [Backend Call - API (Generate Token)] action in Button widget.
  ApiCallResponse? tokenAC;
  // State field(s) for acceptCheck widget.
  bool? acceptCheckValue;

  @override
  void initState(BuildContext context) {
    invPasswordCreateVisibility = false;
    invPasswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    invNameFieldFocusNode?.dispose();
    invNameFieldTextController?.dispose();

    invEmailFieldFocusNode?.dispose();
    invEmailFieldTextController?.dispose();

    invPasswordCreateFocusNode?.dispose();
    invPasswordCreateTextController?.dispose();

    invPasswordConfirmFocusNode?.dispose();
    invPasswordConfirmTextController?.dispose();
  }
}
