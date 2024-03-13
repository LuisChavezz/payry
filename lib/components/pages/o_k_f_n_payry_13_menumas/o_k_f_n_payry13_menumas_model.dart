import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/primeros_pasos_menu_mas.dart';
import 'o_k_f_n_payry13_menumas_widget.dart' show OKFNPayry13MenumasWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry13MenumasModel
    extends FlutterFlowModel<OKFNPayry13MenumasWidget> {
  ///  Local state fields for this page.

  String? testValue;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Cloud Function - testCloudFunction] action in OK_FN_Payry_13_Menumas widget.
  TestCloudFunctionCloudFunctionCallResponse? cloudFunctiono6o;
  TutorialCoachMark? primerosPasosMenuMasController;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp1;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp2;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp3;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp4;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp5;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp6;
  // Stores action output result for [Cloud Function - verifyEmail] action in Container widget.
  VerifyEmailCloudFunctionCallResponse? verifyEmailResp7;
  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    primerosPasosMenuMasController?.finish();
    navBarFlotingModel.dispose();
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
