import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry30_historial_q_rs_widget.dart'
    show OKFNPayry30HistorialQRsWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class OKFNPayry30HistorialQRsModel
    extends FlutterFlowModel<OKFNPayry30HistorialQRsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode1;
  TextEditingController? searchFieldController1;
  String? Function(BuildContext, String?)? searchFieldController1Validator;
  List<DetallesCobroRecord> simpleSearchResults1 = [];
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode2;
  TextEditingController? searchFieldController2;
  String? Function(BuildContext, String?)? searchFieldController2Validator;
  List<RegistraCobroRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    searchFieldFocusNode1?.dispose();
    searchFieldController1?.dispose();

    searchFieldFocusNode2?.dispose();
    searchFieldController2?.dispose();
  }
}
