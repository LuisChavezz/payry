import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry35_historial_s_m_s_widget.dart'
    show OKFNPayry35HistorialSMSWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class OKFNPayry35HistorialSMSModel
    extends FlutterFlowModel<OKFNPayry35HistorialSMSWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode1;
  TextEditingController? searchFieldTextController1;
  String? Function(BuildContext, String?)? searchFieldTextController1Validator;
  List<DetallesCobroRecord> simpleSearchResults1 = [];
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode2;
  TextEditingController? searchFieldTextController2;
  String? Function(BuildContext, String?)? searchFieldTextController2Validator;
  List<RegistraCobroRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    searchFieldFocusNode1?.dispose();
    searchFieldTextController1?.dispose();

    searchFieldFocusNode2?.dispose();
    searchFieldTextController2?.dispose();
  }
}
