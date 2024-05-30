import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/como_generar_un_co_di.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry27_solicitar_q_r_model.dart';
export 'o_k_f_n_payry27_solicitar_q_r_model.dart';

class OKFNPayry27SolicitarQRWidget extends StatefulWidget {
  const OKFNPayry27SolicitarQRWidget({
    super.key,
    required this.readQr,
    required this.createRefund,
  });

  final bool? readQr;
  final bool? createRefund;

  @override
  State<OKFNPayry27SolicitarQRWidget> createState() =>
      _OKFNPayry27SolicitarQRWidgetState();
}

class _OKFNPayry27SolicitarQRWidgetState
    extends State<OKFNPayry27SolicitarQRWidget> {
  late OKFNPayry27SolicitarQRModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry27SolicitarQRModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (valueOrDefault(currentUserDocument?.sucursalId, '') != null &&
          valueOrDefault(currentUserDocument?.sucursalId, '') != '') {
        setState(() {
          _model.selectedBranchId =
              valueOrDefault(currentUserDocument?.sucursalId, '');
        });
      }
      if (getJsonField(
        FFAppState().walkthroughs,
        r'''$.create_codi''',
      )) {
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          _model.show = true;
        });
        safeSetState(() => _model.comoGenerarUnCoDiController =
            createPageWalkthrough(context));
        _model.comoGenerarUnCoDiController?.show(context: context);
        return;
      } else {
        setState(() {
          _model.show = true;
        });
        return;
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.conceptFieldTextController ??= TextEditingController();
    _model.conceptFieldFocusNode ??= FocusNode();

    _model.amountFieldTextController ??= TextEditingController();
    _model.amountFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserPermissionsRecord>>(
      stream: queryUserPermissionsRecord(
        queryBuilder: (userPermissionsRecord) => userPermissionsRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).accent3,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserPermissionsRecord>
            oKFNPayry27SolicitarQRUserPermissionsRecordList = snapshot.data!;
        final oKFNPayry27SolicitarQRUserPermissionsRecord =
            oKFNPayry27SolicitarQRUserPermissionsRecordList.isNotEmpty
                ? oKFNPayry27SolicitarQRUserPermissionsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: Visibility(
                  visible: false,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pop();
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cobrar con CoDi®  ',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: 20.0,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
                      icon: FaIcon(
                        FontAwesomeIcons.questionCircle,
                        color: FlutterFlowTheme.of(context).accent1,
                        size: 24.0,
                      ),
                      onPressed: () async {
                        safeSetState(() => _model.comoGenerarUnCoDiController =
                            createPageWalkthrough(context));
                        _model.comoGenerarUnCoDiController
                            ?.show(context: context);
                      },
                    ),
                  ],
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    if (_model.show)
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  18.0, 0.0, 18.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<CompaniesRecord>>(
                                  stream: queryCompaniesRecord(
                                    queryBuilder: (companiesRecord) =>
                                        companiesRecord.where(
                                      'created_by',
                                      isEqualTo: valueOrDefault(
                                          currentUserDocument?.adminId, ''),
                                    ),
                                    singleRecord: true,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .accent3,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CompaniesRecord>
                                        containerCompaniesRecordList =
                                        snapshot.data!;
                                    final containerCompaniesRecord =
                                        containerCompaniesRecordList.isNotEmpty
                                            ? containerCompaniesRecordList.first
                                            : null;
                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child:
                                          StreamBuilder<List<SucursalesRecord>>(
                                        stream: querySucursalesRecord(
                                          queryBuilder: (sucursalesRecord) =>
                                              sucursalesRecord
                                                  .where(
                                                    'empresa_id',
                                                    isEqualTo:
                                                        containerCompaniesRecord
                                                            ?.reference.id,
                                                  )
                                                  .where(
                                                    'status',
                                                    isEqualTo: true,
                                                  )
                                                  .orderBy('nombre'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<SucursalesRecord>
                                              qrFormSucursalesRecordList =
                                              snapshot.data!;
                                          return Form(
                                            key: _model.formKey,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .conceptFieldTextController,
                                                      focusNode: _model
                                                          .conceptFieldFocusNode,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .sentences,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Concepto',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        hintText:
                                                            'Ingresa el concepto de cobro...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Color(
                                                                      0xFF8788A5),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            color: Color(
                                                                0xFF8788A5),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      maxLength: 20,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      validator: _model
                                                          .conceptFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ).addWalkthrough(
                                                      textFieldY48usnf1,
                                                      _model
                                                          .comoGenerarUnCoDiController,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 12.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .amountFieldTextController,
                                                      focusNode: _model
                                                          .amountFieldFocusNode,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Importe',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        hintText:
                                                            'Ingresa el importe (Max \$8,000)...',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Color(
                                                                      0xFF8788A5),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    24.0,
                                                                    20.0,
                                                                    24.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            color: Color(
                                                                0xFF8788A5),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true),
                                                      validator: _model
                                                          .amountFieldTextControllerValidator
                                                          .asValidator(context),
                                                    ).addWalkthrough(
                                                      textFieldHb4avouw,
                                                      _model
                                                          .comoGenerarUnCoDiController,
                                                    ),
                                                  ),
                                                  if (containerCompaniesRecord!
                                                          .porSucursal &&
                                                      (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.sucursalId,
                                                                  '') ==
                                                              null ||
                                                          valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.sucursalId,
                                                                  '') ==
                                                              ''))
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Sucursal',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      4.0,
                                                                      0.0,
                                                                      12.0),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .branchDropDownValueController ??=
                                                                FormFieldController<
                                                                    String>(
                                                              _model.branchDropDownValue ??= functions.returnBranchName(
                                                                  qrFormSucursalesRecordList
                                                                      .toList(),
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.sucursalId,
                                                                      '')),
                                                            ),
                                                            options:
                                                                qrFormSucursalesRecordList
                                                                    .map((e) =>
                                                                        e.nombre)
                                                                    .toList(),
                                                            onChanged:
                                                                (val) async {
                                                              setState(() =>
                                                                  _model.branchDropDownValue =
                                                                      val);
                                                              setState(() {
                                                                _model.selectedBranchId =
                                                                    functions.returnBranchId(
                                                                        qrFormSucursalesRecordList
                                                                            .toList(),
                                                                        _model
                                                                            .branchDropDownValue!);
                                                              });
                                                            },
                                                            width:
                                                                double.infinity,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: Color(
                                                                          0xFF8788A5),
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintText:
                                                                'Selecciona la sucursal...',
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            elevation: 1.0,
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            borderWidth: 1.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                            hidesUnderline:
                                                                true,
                                                            disabled: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.sucursalId,
                                                                        '') !=
                                                                    null &&
                                                                valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.sucursalId,
                                                                        '') !=
                                                                    '',
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          var _shouldSetState =
                                                              false;
                                                          if (_model.formKey
                                                                      .currentState ==
                                                                  null ||
                                                              !_model.formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                            return;
                                                          }
                                                          if (functions
                                                              .amountLimit(_model
                                                                  .amountFieldTextController
                                                                  .text)!) {
                                                            if (containerCompaniesRecord!
                                                                .porSucursal) {
                                                              if (!(qrFormSucursalesRecordList
                                                                  .isNotEmpty)) {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.isAdmin,
                                                                    false)) {
                                                                  await showDialog(
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.3,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.9,
                                                                            child:
                                                                                CustomConfirmDialogWidget(
                                                                              title: 'Sin sucursales',
                                                                              description: 'No hay sucursales registradas. Debe haber al menos una sucursal registrada para realizar la operación.',
                                                                              buttonText: 'Registrar sucursal',
                                                                              showDismissButton: true,
                                                                              dismissAction: () async {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              mainAction: () async {
                                                                                Navigator.pop(context);

                                                                                context.pushNamed(
                                                                                  'OK_FN_Payry_sucursales',
                                                                                  queryParameters: {
                                                                                    'companyId': serializeParam(
                                                                                      containerCompaniesRecord?.reference.id,
                                                                                      ParamType.String,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                } else {
                                                                  await showDialog(
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.25,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.9,
                                                                            child:
                                                                                CustomConfirmDialogWidget(
                                                                              title: 'Sin sucursales',
                                                                              description: 'No hay sucursales registradas. Debe haber al menos una sucursal registrada para realizar la operación.',
                                                                              buttonText: 'Aceptar',
                                                                              showDismissButton: false,
                                                                              dismissAction: () async {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              mainAction: () async {
                                                                                Navigator.pop(context);
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                  return;
                                                                }
                                                              }
                                                              if (!(_model.selectedBranchId !=
                                                                      null &&
                                                                  _model.selectedBranchId !=
                                                                      '')) {
                                                                await showDialog(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.25,
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.9,
                                                                          child:
                                                                              CustomConfirmDialogWidget(
                                                                            title:
                                                                                'Error',
                                                                            description:
                                                                                'Debes seleccionar una sucursal',
                                                                            buttonText:
                                                                                'Aceptar',
                                                                            showDismissButton:
                                                                                false,
                                                                            dismissAction:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            mainAction:
                                                                                () async {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }
                                                            }

                                                            var registraCobroRecordReference =
                                                                RegistraCobroRecord
                                                                    .collection
                                                                    .doc();
                                                            await registraCobroRecordReference
                                                                .set({
                                                              ...createRegistraCobroRecordData(
                                                                adminId: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.adminId,
                                                                    ''),
                                                                amount: double
                                                                    .tryParse(_model
                                                                        .amountFieldTextController
                                                                        .text),
                                                                concept: _model
                                                                    .conceptFieldTextController
                                                                    .text,
                                                                uid:
                                                                    currentUserUid,
                                                                qrUrl: '',
                                                                shareableQrUrl:
                                                                    '',
                                                                companyId: '',
                                                                errorMessage:
                                                                    '',
                                                                errorOcurs:
                                                                    false,
                                                                numeroReferenciaComercio:
                                                                    null,
                                                                type:
                                                                    PaymentType
                                                                        .QR,
                                                                status:
                                                                    PaymentStatus
                                                                        .PENDIENTE,
                                                                sucursalId: containerCompaniesRecord!
                                                                        .porSucursal
                                                                    ? _model
                                                                        .selectedBranchId
                                                                    : containerCompaniesRecord
                                                                        ?.defaultBranchId,
                                                                sucursalName: functions.returnBranchName(
                                                                    qrFormSucursalesRecordList
                                                                        .toList(),
                                                                    containerCompaniesRecord!.porSucursal
                                                                        ? _model
                                                                            .selectedBranchId!
                                                                        : containerCompaniesRecord!
                                                                            .defaultBranchId),
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'created_time':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            _model.codiResp =
                                                                RegistraCobroRecord
                                                                    .getDocumentFromData({
                                                              ...createRegistraCobroRecordData(
                                                                adminId: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.adminId,
                                                                    ''),
                                                                amount: double
                                                                    .tryParse(_model
                                                                        .amountFieldTextController
                                                                        .text),
                                                                concept: _model
                                                                    .conceptFieldTextController
                                                                    .text,
                                                                uid:
                                                                    currentUserUid,
                                                                qrUrl: '',
                                                                shareableQrUrl:
                                                                    '',
                                                                companyId: '',
                                                                errorMessage:
                                                                    '',
                                                                errorOcurs:
                                                                    false,
                                                                numeroReferenciaComercio:
                                                                    null,
                                                                type:
                                                                    PaymentType
                                                                        .QR,
                                                                status:
                                                                    PaymentStatus
                                                                        .PENDIENTE,
                                                                sucursalId: containerCompaniesRecord!
                                                                        .porSucursal
                                                                    ? _model
                                                                        .selectedBranchId
                                                                    : containerCompaniesRecord
                                                                        ?.defaultBranchId,
                                                                sucursalName: functions.returnBranchName(
                                                                    qrFormSucursalesRecordList
                                                                        .toList(),
                                                                    containerCompaniesRecord!.porSucursal
                                                                        ? _model
                                                                            .selectedBranchId!
                                                                        : containerCompaniesRecord!
                                                                            .defaultBranchId),
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'created_time':
                                                                      DateTime
                                                                          .now(),
                                                                },
                                                              ),
                                                            }, registraCobroRecordReference);
                                                            _shouldSetState =
                                                                true;
                                                            _model.codiAC =
                                                                await StpGroup
                                                                    .generateCodiCall
                                                                    .call(
                                                              id: _model
                                                                  .codiResp
                                                                  ?.reference
                                                                  .id,
                                                              token: FFAppState()
                                                                  .serverToken,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.codiAC
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              setState(() {
                                                                FFAppState()
                                                                        .transactionsCount =
                                                                    FFAppState()
                                                                            .transactionsCount +
                                                                        1.0;
                                                              });
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context
                                                                  .pushNamedAuth(
                                                                'OK_FN_Payry_31_detallesdeQRCode',
                                                                context.mounted,
                                                                queryParameters:
                                                                    {
                                                                  'registraCobroRef':
                                                                      serializeParam(
                                                                    _model
                                                                        .codiResp
                                                                        ?.reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'createRefund':
                                                                      serializeParam(
                                                                    false,
                                                                    ParamType
                                                                        .bool,
                                                                  ),
                                                                }.withoutNulls,
                                                              );

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            } else {
                                                              await _model
                                                                  .codiResp!
                                                                  .reference
                                                                  .delete();
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.25,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.9,
                                                                        child:
                                                                            CustomConfirmDialogWidget(
                                                                          title:
                                                                              'Error',
                                                                          description:
                                                                              getJsonField(
                                                                            (_model.codiAC?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString(),
                                                                          buttonText:
                                                                              'Aceptar',
                                                                          showDismissButton:
                                                                              false,
                                                                          dismissAction:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          mainAction:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              if (!functions.includeTheString(
                                                                  getJsonField(
                                                                    (_model.codiAC
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                    r'''$.message''',
                                                                  ).toString(),
                                                                  'expirada')!) {
                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                                return;
                                                              }

                                                              GoRouter.of(
                                                                      context)
                                                                  .prepareAuthEvent();
                                                              await authManager
                                                                  .signOut();
                                                              GoRouter.of(
                                                                      context)
                                                                  .clearRedirectLocation();

                                                              context.goNamedAuth(
                                                                  'OK_FN_Payry_08_iniciasesion',
                                                                  context
                                                                      .mounted);

                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }
                                                          } else {
                                                            await showDialog(
                                                              barrierDismissible:
                                                                  false,
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Container(
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.25,
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.9,
                                                                      child:
                                                                          CustomConfirmDialogWidget(
                                                                        title:
                                                                            'Error',
                                                                        description:
                                                                            'El límite del monto es de \$8,000. Por favor ingresa una cantidad menor a esta.',
                                                                        buttonText:
                                                                            'Aceptar',
                                                                        showDismissButton:
                                                                            false,
                                                                        dismissAction:
                                                                            () async {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        mainAction:
                                                                            () async {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                                        text: 'Generar CoDi®',
                                                        options:
                                                            FFButtonOptions(
                                                          width:
                                                              double.infinity,
                                                          height: 50.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFF5E4A98),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                      ).addWalkthrough(
                                                        buttonEpcgn4br,
                                                        _model
                                                            .comoGenerarUnCoDiController,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsets.all(36.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'OK_FN_Payry_30_historialQRs',
                                      queryParameters: {
                                        'readAll': serializeParam(
                                          widget.readQr,
                                          ParamType.bool,
                                        ),
                                        'createRefund': serializeParam(
                                          widget.createRefund,
                                          ParamType.bool,
                                        ),
                                        'readAllBranches': serializeParam(
                                          oKFNPayry27SolicitarQRUserPermissionsRecord
                                              ?.readBranches,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Consultar CoDi®',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).accent4,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: Color(0xFF5E4A98),
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ).addWalkthrough(
                                  buttonRbdslzww,
                                  _model.comoGenerarUnCoDiController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 18.0),
                          child: wrapWithModel(
                            model: _model.navBarFlotingModel,
                            updateCallback: () => setState(() {}),
                            child: NavBarFlotingWidget(
                              userPermissions:
                                  oKFNPayry27SolicitarQRUserPermissionsRecord!,
                              pageName: 'codi',
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.comoGenerarUnCoDiController = null);
          FFAppState().walkthroughs = <String, bool?>{
            'menu_mas': getJsonField(
              FFAppState().walkthroughs,
              r'''$.menu_mas''',
            ),
            'dashboard': getJsonField(
              FFAppState().walkthroughs,
              r'''$.dashboard''',
            ),
            'datos_bancarios': getJsonField(
              FFAppState().walkthroughs,
              r'''$.datos_bancarios''',
            ),
            'add_users': getJsonField(
              FFAppState().walkthroughs,
              r'''$.add_users''',
            ),
            'user_permissions': getJsonField(
              FFAppState().walkthroughs,
              r'''$.user_permissions''',
            ),
            'create_codi': false,
            'create_dimo': getJsonField(
              FFAppState().walkthroughs,
              r'''$.create_dimo''',
            ),
            'edit_profile': getJsonField(
              FFAppState().walkthroughs,
              r'''$.edit_profile''',
            ),
          };
        },
        onSkip: () {
          () async {
            FFAppState().walkthroughs = <String, bool?>{
              'menu_mas': getJsonField(
                FFAppState().walkthroughs,
                r'''$.menu_mas''',
              ),
              'dashboard': getJsonField(
                FFAppState().walkthroughs,
                r'''$.dashboard''',
              ),
              'datos_bancarios': getJsonField(
                FFAppState().walkthroughs,
                r'''$.datos_bancarios''',
              ),
              'add_users': getJsonField(
                FFAppState().walkthroughs,
                r'''$.add_users''',
              ),
              'user_permissions': getJsonField(
                FFAppState().walkthroughs,
                r'''$.user_permissions''',
              ),
              'create_codi': false,
              'create_dimo': getJsonField(
                FFAppState().walkthroughs,
                r'''$.create_dimo''',
              ),
              'edit_profile': getJsonField(
                FFAppState().walkthroughs,
                r'''$.edit_profile''',
              ),
            };
          }();
          return true;
        },
      );
}
