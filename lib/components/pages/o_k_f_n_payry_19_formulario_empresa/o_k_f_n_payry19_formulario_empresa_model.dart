import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'o_k_f_n_payry19_formulario_empresa_widget.dart'
    show OKFNPayry19FormularioEmpresaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry19FormularioEmpresaModel
    extends FlutterFlowModel<OKFNPayry19FormularioEmpresaWidget> {
  ///  Local state fields for this page.

  GirosRecord? girosDocSelected;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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

  // State field(s) for AliasField widget.
  FocusNode? aliasFieldFocusNode;
  TextEditingController? aliasFieldController;
  String? Function(BuildContext, String?)? aliasFieldControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  String? _emailFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electrónico es requerido';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'El correo electrónico es inválido';
    }
    return null;
  }

  // State field(s) for StreetField widget.
  FocusNode? streetFieldFocusNode;
  TextEditingController? streetFieldController;
  String? Function(BuildContext, String?)? streetFieldControllerValidator;
  String? _streetFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La calle es requerida';
    }

    return null;
  }

  // State field(s) for StreetNumberField widget.
  FocusNode? streetNumberFieldFocusNode;
  TextEditingController? streetNumberFieldController;
  String? Function(BuildContext, String?)? streetNumberFieldControllerValidator;
  String? _streetNumberFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de calle es requerido';
    }

    return null;
  }

  // State field(s) for NeighborhoodField widget.
  FocusNode? neighborhoodFieldFocusNode;
  TextEditingController? neighborhoodFieldController;
  String? Function(BuildContext, String?)? neighborhoodFieldControllerValidator;
  String? _neighborhoodFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La colonia es requerida';
    }

    return null;
  }

  // State field(s) for CityField widget.
  FocusNode? cityFieldFocusNode;
  TextEditingController? cityFieldController;
  String? Function(BuildContext, String?)? cityFieldControllerValidator;
  String? _cityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La ciudad es requerida';
    }

    return null;
  }

  // State field(s) for StateDropDown widget.
  String? stateDropDownValue;
  FormFieldController<String>? stateDropDownValueController;
  // State field(s) for CountryDropDown widget.
  String? countryDropDownValue;
  FormFieldController<String>? countryDropDownValueController;
  // State field(s) for ZipCodeField widget.
  FocusNode? zipCodeFieldFocusNode;
  TextEditingController? zipCodeFieldController;
  String? Function(BuildContext, String?)? zipCodeFieldControllerValidator;
  String? _zipCodeFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El código postal es requerido';
    }

    if (!RegExp('^\\d{5}\$').hasMatch(val)) {
      return 'El código postal debe contener exactamente 5 dígitos';
    }
    return null;
  }

  // State field(s) for StatusDropDown widget.
  String? statusDropDownValue;
  FormFieldController<String>? statusDropDownValueController;
  // State field(s) for RequireBillSwitch widget.
  bool? requireBillSwitchValue;
  // State field(s) for RFCField widget.
  FocusNode? rFCFieldFocusNode;
  TextEditingController? rFCFieldController;
  String? Function(BuildContext, String?)? rFCFieldControllerValidator;
  String? _rFCFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El RFC es requerido';
    }

    if (!RegExp('^[a-zA-Z0-9]{12,13}\$').hasMatch(val)) {
      return 'Debe ser entre 12 y 13 dígitos';
    }
    return null;
  }

  // State field(s) for TaxRegimeDropDown widget.
  String? taxRegimeDropDownValue;
  FormFieldController<String>? taxRegimeDropDownValueController;
  // State field(s) for CFDIDropDown widget.
  String? cFDIDropDownValue;
  FormFieldController<String>? cFDIDropDownValueController;
  // State field(s) for giroCatDropDown widget.
  String? giroCatDropDownValue;
  FormFieldController<String>? giroCatDropDownValueController;
  // State field(s) for giroDropDown widget.
  String? giroDropDownValue;
  FormFieldController<String>? giroDropDownValueController;
  // State field(s) for CouponField widget.
  FocusNode? couponFieldFocusNode;
  TextEditingController? couponFieldController;
  String? Function(BuildContext, String?)? couponFieldControllerValidator;
  // Stores action output result for [Cloud Function - generateToken] action in Button widget.
  GenerateTokenCloudFunctionCallResponse? genToken;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameFieldControllerValidator = _nameFieldControllerValidator;
    emailFieldControllerValidator = _emailFieldControllerValidator;
    streetFieldControllerValidator = _streetFieldControllerValidator;
    streetNumberFieldControllerValidator =
        _streetNumberFieldControllerValidator;
    neighborhoodFieldControllerValidator =
        _neighborhoodFieldControllerValidator;
    cityFieldControllerValidator = _cityFieldControllerValidator;
    zipCodeFieldControllerValidator = _zipCodeFieldControllerValidator;
    rFCFieldControllerValidator = _rFCFieldControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldController?.dispose();

    aliasFieldFocusNode?.dispose();
    aliasFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    streetFieldFocusNode?.dispose();
    streetFieldController?.dispose();

    streetNumberFieldFocusNode?.dispose();
    streetNumberFieldController?.dispose();

    neighborhoodFieldFocusNode?.dispose();
    neighborhoodFieldController?.dispose();

    cityFieldFocusNode?.dispose();
    cityFieldController?.dispose();

    zipCodeFieldFocusNode?.dispose();
    zipCodeFieldController?.dispose();

    rFCFieldFocusNode?.dispose();
    rFCFieldController?.dispose();

    couponFieldFocusNode?.dispose();
    couponFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
