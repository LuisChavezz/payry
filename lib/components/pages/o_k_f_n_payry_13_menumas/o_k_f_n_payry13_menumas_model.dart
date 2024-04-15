import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/primeros_pasos_menu_mas.dart';
import 'o_k_f_n_payry13_menumas_widget.dart' show OKFNPayry13MenumasWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry13MenumasModel
    extends FlutterFlowModel<OKFNPayry13MenumasWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? primerosPasosMenuMasController;
  // Stores action output result for [Backend Call - API (Generate Token)] action in Container widget.
  ApiCallResponse? verifyACCodiMenu;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Container widget.
  ApiCallResponse? verifyACDimoMenu;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Container widget.
  ApiCallResponse? verifyACCompanyMenu;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Container widget.
  ApiCallResponse? verifyACStatisticsMenu;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Container widget.
  ApiCallResponse? verifyACUsersMenu;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Container widget.
  ApiCallResponse? verifyACFactsMenu;
  // Stores action output result for [Backend Call - API (Verify Email)] action in Container widget.
  ApiCallResponse? verifyACTransferMenu;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  @override
  void initState(BuildContext context) {
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    primerosPasosMenuMasController?.finish();
    navBarFlotingModel.dispose();
  }
}
