import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'package:flutter/material.dart';
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
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  String? _nameFieldTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    return null;
  }

  // State field(s) for AliasField widget.
  FocusNode? aliasFieldFocusNode;
  TextEditingController? aliasFieldTextController;
  String? Function(BuildContext, String?)? aliasFieldTextControllerValidator;
  String? _aliasFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El alias es requerido';
    }

    return null;
  }

  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;
  // State field(s) for StreetField widget.
  FocusNode? streetFieldFocusNode;
  TextEditingController? streetFieldTextController;
  String? Function(BuildContext, String?)? streetFieldTextControllerValidator;
  String? _streetFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La calle es requerida';
    }

    return null;
  }

  // State field(s) for StreetNumberField widget.
  FocusNode? streetNumberFieldFocusNode;
  TextEditingController? streetNumberFieldTextController;
  String? Function(BuildContext, String?)?
      streetNumberFieldTextControllerValidator;
  String? _streetNumberFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de calle es requerido';
    }

    return null;
  }

  // State field(s) for NeighborhoodField widget.
  FocusNode? neighborhoodFieldFocusNode;
  TextEditingController? neighborhoodFieldTextController;
  String? Function(BuildContext, String?)?
      neighborhoodFieldTextControllerValidator;
  String? _neighborhoodFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La colonia es requerida';
    }

    return null;
  }

  // State field(s) for CityField widget.
  FocusNode? cityFieldFocusNode;
  TextEditingController? cityFieldTextController;
  String? Function(BuildContext, String?)? cityFieldTextControllerValidator;
  String? _cityFieldTextControllerValidator(BuildContext context, String? val) {
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
  TextEditingController? zipCodeFieldTextController;
  String? Function(BuildContext, String?)? zipCodeFieldTextControllerValidator;
  String? _zipCodeFieldTextControllerValidator(
      BuildContext context, String? val) {
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
  // State field(s) for giroCatDropDown widget.
  String? giroCatDropDownValue;
  FormFieldController<String>? giroCatDropDownValueController;
  // State field(s) for giroDropDown widget.
  String? giroDropDownValue;
  FormFieldController<String>? giroDropDownValueController;
  // State field(s) for RequireBillSwitch widget.
  bool? requireBillSwitchValue;
  // State field(s) for RFCField widget.
  FocusNode? rFCFieldFocusNode;
  TextEditingController? rFCFieldTextController;
  String? Function(BuildContext, String?)? rFCFieldTextControllerValidator;
  String? _rFCFieldTextControllerValidator(BuildContext context, String? val) {
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
  // State field(s) for CouponField widget.
  FocusNode? couponFieldFocusNode;
  TextEditingController? couponFieldTextController;
  String? Function(BuildContext, String?)? couponFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompaniesRecord? companyCreatedResp;
  // Stores action output result for [Backend Call - API (Report Company)] action in Button widget.
  ApiCallResponse? rccAC;
  // Stores action output result for [Backend Call - API (Report Company)] action in Button widget.
  ApiCallResponse? recAC;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = _nameFieldTextControllerValidator;
    aliasFieldTextControllerValidator = _aliasFieldTextControllerValidator;
    streetFieldTextControllerValidator = _streetFieldTextControllerValidator;
    streetNumberFieldTextControllerValidator =
        _streetNumberFieldTextControllerValidator;
    neighborhoodFieldTextControllerValidator =
        _neighborhoodFieldTextControllerValidator;
    cityFieldTextControllerValidator = _cityFieldTextControllerValidator;
    zipCodeFieldTextControllerValidator = _zipCodeFieldTextControllerValidator;
    rFCFieldTextControllerValidator = _rFCFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    aliasFieldFocusNode?.dispose();
    aliasFieldTextController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();

    streetFieldFocusNode?.dispose();
    streetFieldTextController?.dispose();

    streetNumberFieldFocusNode?.dispose();
    streetNumberFieldTextController?.dispose();

    neighborhoodFieldFocusNode?.dispose();
    neighborhoodFieldTextController?.dispose();

    cityFieldFocusNode?.dispose();
    cityFieldTextController?.dispose();

    zipCodeFieldFocusNode?.dispose();
    zipCodeFieldTextController?.dispose();

    rFCFieldFocusNode?.dispose();
    rFCFieldTextController?.dispose();

    couponFieldFocusNode?.dispose();
    couponFieldTextController?.dispose();
  }
}
