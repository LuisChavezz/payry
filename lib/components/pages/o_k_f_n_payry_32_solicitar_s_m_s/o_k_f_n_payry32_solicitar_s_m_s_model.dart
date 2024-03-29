import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/como_crear_un_di_mo.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'o_k_f_n_payry32_solicitar_s_m_s_widget.dart'
    show OKFNPayry32SolicitarSMSWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class OKFNPayry32SolicitarSMSModel
    extends FlutterFlowModel<OKFNPayry32SolicitarSMSWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? comoCrearUnDiMoController;
  final unfocusNode = FocusNode();
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

    return null;
  }

  // Stores action output result for [Custom Action - selectContact] action in IconButton widget.
  dynamic? contact;
  // State field(s) for ConceptField widget.
  FocusNode? conceptFieldFocusNode;
  TextEditingController? conceptFieldController;
  String? Function(BuildContext, String?)? conceptFieldControllerValidator;
  String? _conceptFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El concepto es requerido';
    }

    if (val.length < 1) {
      return 'El concepto debe contener al menos 1 caracteres';
    }
    if (val.length > 20) {
      return 'El concepto solo puede contener un máximo de 20 caracteres';
    }

    return null;
  }

  // State field(s) for AmountField widget.
  FocusNode? amountFieldFocusNode;
  TextEditingController? amountFieldController;
  String? Function(BuildContext, String?)? amountFieldControllerValidator;
  String? _amountFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El importe es requerido';
    }

    if (!RegExp('^(?!0*(\\.0{1,2})?\$)([1-9]\\d{0,3}|0)(?:\\.\\d{1,2})?\$')
        .hasMatch(val)) {
      return 'El formato del importe es inválido.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RegistraCobroRecord? dimoResp;
  // Stores action output result for [Cloud Function - generateDimo] action in Button widget.
  GenerateDimoCloudFunctionCallResponse? dimoCF;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  @override
  void initState(BuildContext context) {
    phoneFieldControllerValidator = _phoneFieldControllerValidator;
    conceptFieldControllerValidator = _conceptFieldControllerValidator;
    amountFieldControllerValidator = _amountFieldControllerValidator;
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    comoCrearUnDiMoController?.finish();
    unfocusNode.dispose();
    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();

    conceptFieldFocusNode?.dispose();
    conceptFieldController?.dispose();

    amountFieldFocusNode?.dispose();
    amountFieldController?.dispose();

    navBarFlotingModel.dispose();
  }
}
