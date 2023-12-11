import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry05_register_inv_widget.dart'
    show OKFNPayry05RegisterInvWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry05RegisterInvModel
    extends FlutterFlowModel<OKFNPayry05RegisterInvWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for InvNameField widget.
  FocusNode? invNameFieldFocusNode;
  TextEditingController? invNameFieldController;
  String? Function(BuildContext, String?)? invNameFieldControllerValidator;
  // State field(s) for InvEmailField widget.
  FocusNode? invEmailFieldFocusNode;
  TextEditingController? invEmailFieldController;
  String? Function(BuildContext, String?)? invEmailFieldControllerValidator;
  // State field(s) for inv-password-Create widget.
  FocusNode? invPasswordCreateFocusNode;
  TextEditingController? invPasswordCreateController;
  late bool invPasswordCreateVisibility;
  String? Function(BuildContext, String?)? invPasswordCreateControllerValidator;
  // State field(s) for invPasswordConfirm widget.
  FocusNode? invPasswordConfirmFocusNode;
  TextEditingController? invPasswordConfirmController;
  late bool invPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      invPasswordConfirmControllerValidator;
  // Stores action output result for [Cloud Function - generateToken] action in Button widget.
  GenerateTokenCloudFunctionCallResponse? cloudFunctionGT;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    invPasswordCreateVisibility = false;
    invPasswordConfirmVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    invNameFieldFocusNode?.dispose();
    invNameFieldController?.dispose();

    invEmailFieldFocusNode?.dispose();
    invEmailFieldController?.dispose();

    invPasswordCreateFocusNode?.dispose();
    invPasswordCreateController?.dispose();

    invPasswordConfirmFocusNode?.dispose();
    invPasswordConfirmController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
