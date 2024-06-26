import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/asignar_permisos_a_usuarios.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry25_permisos_widget.dart' show OKFNPayry25PermisosWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry25PermisosModel
    extends FlutterFlowModel<OKFNPayry25PermisosWidget> {
  ///  Local state fields for this page.

  String? selectedBranchId;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? asignarPermisosAUsuariosController;
  final unfocusNode = FocusNode();
  // State field(s) for branchDropDown widget.
  String? branchDropDownValue;
  FormFieldController<String>? branchDropDownValueController;
  // State field(s) for CreateQrSwitch widget.
  bool? createQrSwitchValue;
  // State field(s) for ReadQrSwitch widget.
  bool? readQrSwitchValue;
  // State field(s) for CreateSmsSwitch widget.
  bool? createSmsSwitchValue;
  // State field(s) for ReadSmsSwitch widget.
  bool? readSmsSwitchValue;
  // State field(s) for CreateRefundSwitch widget.
  bool? createRefundSwitchValue;
  // State field(s) for ReadCompaniesSwitch widget.
  bool? readCompaniesSwitchValue;
  // State field(s) for ReadInvoicesSwitch widget.
  bool? readInvoicesSwitchValue;
  // State field(s) for ReadUsersSwitch widget.
  bool? readUsersSwitchValue;
  // State field(s) for ReadStatisticsSwitch widget.
  bool? readStatisticsSwitchValue;
  // State field(s) for ReadTransfersSwitch widget.
  bool? readTransfersSwitchValue;
  // State field(s) for ReadBranchesSwitch widget.
  bool? readBranchesSwitchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    asignarPermisosAUsuariosController?.finish();
    unfocusNode.dispose();
  }
}
