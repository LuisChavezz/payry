import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry23_invitar_usuario_widget.dart'
    show OKFNPayry23InvitarUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry23InvitarUsuarioModel
    extends FlutterFlowModel<OKFNPayry23InvitarUsuarioWidget> {
  ///  Local state fields for this page.

  bool branchCheck = false;

  String? selectedBranchId;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  String? _emailFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Debes ingresar un correo electrónico';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Correo electrónico inválido';
    }
    return null;
  }

  // State field(s) for RememberMeCheck widget.
  bool? rememberMeCheckValue;
  // State field(s) for branchDropDown widget.
  String? branchDropDownValue;
  FormFieldController<String>? branchDropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? existEmail;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserInvitationsRecord? existUserInvitation;
  // Stores action output result for [Backend Call - API (Send Invitation)] action in Button widget.
  ApiCallResponse? invitationACNoCreateDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserInvitationsRecord? createdUserInvitation;
  // Stores action output result for [Backend Call - API (Send Invitation)] action in Button widget.
  ApiCallResponse? invitationAC;

  @override
  void initState(BuildContext context) {
    emailFieldTextControllerValidator = _emailFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();
  }
}
