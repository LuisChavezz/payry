import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'phone_submit_dialog_widget.dart' show PhoneSubmitDialogWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PhoneSubmitDialogModel extends FlutterFlowModel<PhoneSubmitDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldTextController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? phoneFieldTextControllerValidator;
  String? _phoneFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de teléfono es requerido';
    }

    if (val.length < 10) {
      return 'Debe contener al menos 10 dígitos';
    }

    return null;
  }

  // Stores action output result for [Custom Action - selectContact] action in IconButton widget.
  dynamic? contact;
  // Stores action output result for [Backend Call - API (Send sms)] action in Button widget.
  ApiCallResponse? smsAC;

  @override
  void initState(BuildContext context) {
    phoneFieldTextControllerValidator = _phoneFieldTextControllerValidator;
  }

  @override
  void dispose() {
    phoneFieldFocusNode?.dispose();
    phoneFieldTextController?.dispose();
  }
}
