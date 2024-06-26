import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry38_estadisticas_widget.dart'
    show OKFNPayry38EstadisticasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OKFNPayry38EstadisticasModel
    extends FlutterFlowModel<OKFNPayry38EstadisticasWidget> {
  ///  Local state fields for this page.

  DateTime? statisticsStartDate;

  DateTime? statisticsEndDate;

  bool isOpenCalendar1 = false;

  bool isOpenCalendar2 = false;

  dynamic statisticsCFResp;

  String dateFilter = 'today';

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Statistics)] action in OK_FN_Payry_38_Estadisticas widget.
  ApiCallResponse? statisticsDefaultAC;
  // Stores action output result for [Backend Call - API (Get Statistics)] action in Container widget.
  ApiCallResponse? statisticsTodayAC;
  // Stores action output result for [Backend Call - API (Get Statistics)] action in Container widget.
  ApiCallResponse? statisticsWeekAC;
  // Stores action output result for [Backend Call - API (Get Statistics)] action in Container widget.
  ApiCallResponse? statisticsMonthAC;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Stores action output result for [Backend Call - API (Get Statistics)] action in Button widget.
  ApiCallResponse? statisticsAC;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
