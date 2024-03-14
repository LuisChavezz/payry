import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/verificar_telefono.dart';
import 'o_k_f_n_payry15_edit_profile_widget.dart'
    show OKFNPayry15EditProfileWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class OKFNPayry15EditProfileModel
    extends FlutterFlowModel<OKFNPayry15EditProfileWidget> {
  ///  Local state fields for this page.

  bool show = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  TutorialCoachMark? verificarTelefonoController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldController;
  String? Function(BuildContext, String?)? nameFieldControllerValidator;
  String? _nameFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    return null;
  }

  // State field(s) for PhoneField widget.
  FocusNode? phoneFieldFocusNode;
  TextEditingController? phoneFieldController;
  final phoneFieldMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for StatusSwitch widget.
  bool? statusSwitchValue;
  // Stores action output result for [Cloud Function - reportUser] action in Button widget.
  ReportUserCloudFunctionCallResponse? reportUserCF;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    verificarTelefonoController?.finish();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    phoneFieldFocusNode?.dispose();
    phoneFieldController?.dispose();
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
