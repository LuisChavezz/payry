import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/asignar_permisos_a_usuarios.dart';
import 'o_k_f_n_payry25_permisos_widget.dart' show OKFNPayry25PermisosWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry25PermisosModel
    extends FlutterFlowModel<OKFNPayry25PermisosWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  TutorialCoachMark? asignarPermisosAUsuariosController;
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

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    asignarPermisosAUsuariosController?.finish();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onSkip: () {
          return true;
        },
      );
}
