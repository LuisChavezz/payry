import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'o_k_f_n_payry19_formulario_empresa_widget.dart'
    show OKFNPayry19FormularioEmpresaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OKFNPayry19FormularioEmpresaModel
    extends FlutterFlowModel<OKFNPayry19FormularioEmpresaWidget> {
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
      return FFLocalizations.of(context).getText(
        'ywefvk2q' /* El nombre es requerido */,
      );
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
      return FFLocalizations.of(context).getText(
        'tp3wowqm' /* El correo electrónico es reque... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'fpf8iioc' /* El correo electrónico es invál... */,
      );
    }
    return null;
  }

  // State field(s) for StreetField widget.
  FocusNode? streetFieldFocusNode;
  TextEditingController? streetFieldController;
  String? Function(BuildContext, String?)? streetFieldControllerValidator;
  String? _streetFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jqf4gofj' /* La calle es requerida */,
      );
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
      return FFLocalizations.of(context).getText(
        'bn5m7502' /* El número de calle es requerid... */,
      );
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
      return FFLocalizations.of(context).getText(
        'o0w310ve' /* La colonia es requerida */,
      );
    }

    return null;
  }

  // State field(s) for CityField widget.
  FocusNode? cityFieldFocusNode;
  TextEditingController? cityFieldController;
  String? Function(BuildContext, String?)? cityFieldControllerValidator;
  String? _cityFieldControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'la4d1fmp' /* La ciudad es requerida */,
      );
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
      return FFLocalizations.of(context).getText(
        '7dht57pp' /* El código postal es requerido */,
      );
    }

    if (!RegExp('^\\d{5}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '6qfdmdr8' /* El código postal debe contener... */,
      );
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
      return FFLocalizations.of(context).getText(
        '1e8m9n58' /* El RFC es requerido */,
      );
    }

    return null;
  }

  // State field(s) for TaxRegimeDropDown widget.
  String? taxRegimeDropDownValue;
  FormFieldController<String>? taxRegimeDropDownValueController;
  // State field(s) for CFDIDropDown widget.
  String? cFDIDropDownValue;
  FormFieldController<String>? cFDIDropDownValueController;
  // Stores action output result for [Cloud Function - saveCompany] action in Button widget.
  SaveCompanyCloudFunctionCallResponse? cloudFunctionCompany;

  /// Initialization and disposal methods.

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
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
