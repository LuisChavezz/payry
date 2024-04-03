import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/dynamic_switch/dynamic_switch_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/crear_usuarios.dart';
import 'o_k_f_n_payry24_listado_usuarios_widget.dart'
    show OKFNPayry24ListadoUsuariosWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry24ListadoUsuariosModel
    extends FlutterFlowModel<OKFNPayry24ListadoUsuariosWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? crearUsuariosController;
  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    crearUsuariosController?.finish();
    unfocusNode.dispose();
  }
}
