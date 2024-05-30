import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dynamic_switch_branch_status/dynamic_switch_branch_status_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'o_k_f_n_payry_sucursales_widget.dart' show OKFNPayrySucursalesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class OKFNPayrySucursalesModel
    extends FlutterFlowModel<OKFNPayrySucursalesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<SucursalesRecord> simpleSearchResults = [];
  // Models for dynamicSwitchBranchStatus dynamic component.
  late FlutterFlowDynamicModels<DynamicSwitchBranchStatusModel>
      dynamicSwitchBranchStatusModels1;
  // Models for dynamicSwitchBranchStatus dynamic component.
  late FlutterFlowDynamicModels<DynamicSwitchBranchStatusModel>
      dynamicSwitchBranchStatusModels2;

  @override
  void initState(BuildContext context) {
    dynamicSwitchBranchStatusModels1 =
        FlutterFlowDynamicModels(() => DynamicSwitchBranchStatusModel());
    dynamicSwitchBranchStatusModels2 =
        FlutterFlowDynamicModels(() => DynamicSwitchBranchStatusModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    dynamicSwitchBranchStatusModels1.dispose();
    dynamicSwitchBranchStatusModels2.dispose();
  }
}
