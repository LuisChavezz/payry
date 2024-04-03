import '/auth/firebase_auth/auth_util.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'phone_submit_dialog_widget.dart' show PhoneSubmitDialogWidget;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PhoneSubmitDialogModel extends FlutterFlowModel<PhoneSubmitDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  String? _phoneFieldControllerValidator(BuildContext context, String? val) {
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
  // Stores action output result for [Cloud Function - sendSms] action in Button widget.
  SendSmsCloudFunctionCallResponse? smsResp;

  @override
  void initState(BuildContext context) {
    phoneFieldControllerValidator = _phoneFieldControllerValidator;
  }

  @override
  void dispose() {
    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();
  }
}
