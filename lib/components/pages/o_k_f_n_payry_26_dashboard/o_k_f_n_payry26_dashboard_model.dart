import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/elementos_en_el_dashboard.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry26_dashboard_widget.dart' show OKFNPayry26DashboardWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OKFNPayry26DashboardModel
    extends FlutterFlowModel<OKFNPayry26DashboardWidget> {
  ///  Local state fields for this page.

  String balance = '';

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? elementosEnElDashboardController;
  final unfocusNode = FocusNode();
  // Stores action output result for [Cloud Function - getBalance] action in OK_FN_Payry_26_Dashboard widget.
  GetBalanceCloudFunctionCallResponse? getBalanceCF;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NavBarFloting component.
  late NavBarFlotingModel navBarFlotingModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    navBarFlotingModel = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    elementosEnElDashboardController?.finish();
    unfocusNode.dispose();
    tabBarController?.dispose();
    navBarFlotingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
