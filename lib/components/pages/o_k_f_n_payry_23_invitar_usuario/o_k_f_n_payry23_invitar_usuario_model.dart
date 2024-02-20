import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry23_invitar_usuario_widget.dart'
    show OKFNPayry23InvitarUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry23InvitarUsuarioModel
    extends FlutterFlowModel<OKFNPayry23InvitarUsuarioWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  String? _emailFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debes ingresar un correo electrónico';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Correo electrónico inválido';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? existEmail;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserInvitationsRecord? existUserInvitation;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserInvitationsRecord? createdUserInvitation;
  // Stores action output result for [Cloud Function - sendInvitation] action in Button widget.
  SendInvitationCloudFunctionCallResponse? sendInvCF;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailFieldControllerValidator = _emailFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
