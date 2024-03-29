import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/como_generar_un_co_di.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry27_solicitar_q_r_widget.dart'
    show OKFNPayry27SolicitarQRWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry27SolicitarQRModel
    extends FlutterFlowModel<OKFNPayry27SolicitarQRWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? comoGenerarUnCoDiController;
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ConceptField widget.
  FocusNode? conceptFieldFocusNode;
  TextEditingController? conceptFieldController;
  String? Function(BuildContext, String?)? conceptFieldControllerValidator;
  String? _conceptFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El concepto es requerido';
    }

    if (val.length < 1) {
      return 'El concepto debe contener al menos 1 caracter';
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
  RegistraCobroRecord? codiResp;
  // Stores action output result for [Cloud Function - generateCodi] action in Button widget.
  GenerateCodiCloudFunctionCallResponse? codiCF;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  @override
  void initState(BuildContext context) {
    conceptFieldControllerValidator = _conceptFieldControllerValidator;
    amountFieldControllerValidator = _amountFieldControllerValidator;
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    comoGenerarUnCoDiController?.finish();
    unfocusNode.dispose();
    conceptFieldFocusNode?.dispose();
    conceptFieldController?.dispose();

    amountFieldFocusNode?.dispose();
    amountFieldController?.dispose();

    navBarFlotingModel.dispose();
  }
}
