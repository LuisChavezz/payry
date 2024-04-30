import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry23_invitar_usuario_model.dart';
export 'o_k_f_n_payry23_invitar_usuario_model.dart';

class OKFNPayry23InvitarUsuarioWidget extends StatefulWidget {
  const OKFNPayry23InvitarUsuarioWidget({super.key});

  @override
  State<OKFNPayry23InvitarUsuarioWidget> createState() =>
      _OKFNPayry23InvitarUsuarioWidgetState();
}

class _OKFNPayry23InvitarUsuarioWidgetState
    extends State<OKFNPayry23InvitarUsuarioWidget> {
  late OKFNPayry23InvitarUsuarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry23InvitarUsuarioModel());

    _model.emailFieldTextController ??= TextEditingController();
    _model.emailFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<CompaniesRecord>>(
        stream: queryCompaniesRecord(
          queryBuilder: (companiesRecord) => companiesRecord.where(
            'created_by',
            isEqualTo: valueOrDefault(currentUserDocument?.adminId, ''),
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
          List<CompaniesRecord> oKFNPayry23InvitarUsuarioCompaniesRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final oKFNPayry23InvitarUsuarioCompaniesRecord =
              oKFNPayry23InvitarUsuarioCompaniesRecordList.isNotEmpty
                  ? oKFNPayry23InvitarUsuarioCompaniesRecordList.first
                  : null;
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: InkWell(
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
                title: Text(
                  'Invitar usuario',
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Ingresa el correo electrónico de la persona a la que quieres invitar a tu cuenta de Payry.',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: TextFormField(
                                  controller: _model.emailFieldTextController,
                                  focusNode: _model.emailFieldFocusNode,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Correo electrónico',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    hintText:
                                        'Ingresa un correo electrónico...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: Color(0xFF8788A5),
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 20.0, 24.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  validator: _model
                                      .emailFieldTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              if (oKFNPayry23InvitarUsuarioCompaniesRecord
                                      ?.porSucursal ??
                                  true)
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Theme(
                                      data: ThemeData(
                                        checkboxTheme: CheckboxThemeData(
                                          visualDensity: VisualDensity.compact,
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        unselectedWidgetColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                      child: Checkbox(
                                        value: _model.rememberMeCheckValue ??=
                                            _model.branchCheck,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.rememberMeCheckValue =
                                                  newValue!);
                                          if (newValue!) {
                                            setState(() {
                                              _model.branchCheck =
                                                  !_model.branchCheck;
                                            });
                                          } else {
                                            setState(() {
                                              _model.branchCheck =
                                                  !_model.branchCheck;
                                            });
                                          }
                                        },
                                        side: BorderSide(
                                          width: 2,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        checkColor: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Asignar sucursal',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              if (_model.branchCheck)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sucursal',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 12.0),
                                        child: StreamBuilder<
                                            List<SucursalesRecord>>(
                                          stream: querySucursalesRecord(
                                            queryBuilder: (sucursalesRecord) =>
                                                sucursalesRecord
                                                    .where(
                                                      'empresa_id',
                                                      isEqualTo:
                                                          oKFNPayry23InvitarUsuarioCompaniesRecord
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
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent3,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<SucursalesRecord>
                                                branchDropDownSucursalesRecordList =
                                                snapshot.data!;
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .branchDropDownValueController ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options:
                                                  branchDropDownSucursalesRecordList
                                                      .map((e) => e.nombre)
                                                      .toList(),
                                              onChanged: (val) async {
                                                setState(() => _model
                                                    .branchDropDownValue = val);
                                                setState(() {
                                                  _model.selectedBranchId =
                                                      functions.returnBranchId(
                                                          branchDropDownSucursalesRecordList
                                                              .toList(),
                                                          _model
                                                              .branchDropDownValue!);
                                                });
                                              },
                                              width: double.infinity,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0xFF8788A5),
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Selecciona la sucursal...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        _model.existEmail =
                                            await queryUsersRecordOnce(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'email',
                                            isEqualTo: _model
                                                .emailFieldTextController.text,
                                          ),
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        _shouldSetState = true;
                                        if ((_model.existEmail?.uid == null ||
                                                _model.existEmail?.uid == '') ||
                                            true) {
                                          _model.existUserInvitation =
                                              await queryUserInvitationsRecordOnce(
                                            queryBuilder:
                                                (userInvitationsRecord) =>
                                                    userInvitationsRecord
                                                        .where(
                                                          'admin_id',
                                                          isEqualTo:
                                                              currentUserUid,
                                                        )
                                                        .where(
                                                          'invited_user_email',
                                                          isEqualTo: _model
                                                              .emailFieldTextController
                                                              .text,
                                                        ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          if (_model.existUserInvitation
                                                  ?.reference !=
                                              null) {
                                            await showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Container(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.3,
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      child:
                                                          CustomConfirmDialogWidget(
                                                        title:
                                                            'Ya se ha enviado una invitación a este correo',
                                                        description:
                                                            '¿Deseas reenviar invitación?',
                                                        buttonText: 'Confirmar',
                                                        showDismissButton: true,
                                                        dismissAction:
                                                            () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        mainAction: () async {
                                                          _model.invitationACNoCreateDoc =
                                                              await AuthGroup
                                                                  .sendInvitationCall
                                                                  .call(
                                                            token: FFAppState()
                                                                .serverToken,
                                                            email: _model
                                                                .emailFieldTextController
                                                                .text,
                                                          );
                                                          if (getJsonField(
                                                            (_model.invitationACNoCreateDoc
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.success''',
                                                          )) {
                                                            Navigator.pop(
                                                                context);
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
                                                                            'Invitación enviada',
                                                                        description:
                                                                            'Se ha enviado la invitación a: ${_model.emailFieldTextController.text} con éxito.',
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
                                                          } else {
                                                            Navigator.pop(
                                                                context);
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
                                                                            getJsonField(
                                                                          (_model.invitationACNoCreateDoc?.jsonBody ??
                                                                              ''),
                                                                          r'''$.message''',
                                                                        ).toString(),
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
                                                          }

                                                          context.safePop();
                                                          context.safePop();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            var userInvitationsRecordReference =
                                                UserInvitationsRecord.collection
                                                    .doc();
                                            await userInvitationsRecordReference
                                                .set({
                                              ...createUserInvitationsRecordData(
                                                adminId: valueOrDefault(
                                                    currentUserDocument
                                                        ?.adminId,
                                                    ''),
                                                invitedUserEmail: _model
                                                    .emailFieldTextController
                                                    .text,
                                                accepted: false,
                                                sucursalId: () {
                                                  if ((_model.branchDropDownValue !=
                                                              null &&
                                                          _model.branchDropDownValue !=
                                                              '') &&
                                                      _model.branchCheck) {
                                                    return _model
                                                        .selectedBranchId;
                                                  } else if (!oKFNPayry23InvitarUsuarioCompaniesRecord!
                                                      .porSucursal) {
                                                    return oKFNPayry23InvitarUsuarioCompaniesRecord
                                                        ?.defaultBranchId;
                                                  } else {
                                                    return '';
                                                  }
                                                }(),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'created_time': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                            _model.createdUserInvitation =
                                                UserInvitationsRecord
                                                    .getDocumentFromData({
                                              ...createUserInvitationsRecordData(
                                                adminId: valueOrDefault(
                                                    currentUserDocument
                                                        ?.adminId,
                                                    ''),
                                                invitedUserEmail: _model
                                                    .emailFieldTextController
                                                    .text,
                                                accepted: false,
                                                sucursalId: () {
                                                  if ((_model.branchDropDownValue !=
                                                              null &&
                                                          _model.branchDropDownValue !=
                                                              '') &&
                                                      _model.branchCheck) {
                                                    return _model
                                                        .selectedBranchId;
                                                  } else if (!oKFNPayry23InvitarUsuarioCompaniesRecord!
                                                      .porSucursal) {
                                                    return oKFNPayry23InvitarUsuarioCompaniesRecord
                                                        ?.defaultBranchId;
                                                  } else {
                                                    return '';
                                                  }
                                                }(),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'created_time':
                                                      DateTime.now(),
                                                },
                                              ),
                                            }, userInvitationsRecordReference);
                                            _shouldSetState = true;
                                            _model.invitationAC =
                                                await AuthGroup
                                                    .sendInvitationCall
                                                    .call(
                                              token: FFAppState().serverToken,
                                              email: _model
                                                  .emailFieldTextController
                                                  .text,
                                            );
                                            _shouldSetState = true;
                                            if (getJsonField(
                                              (_model.invitationAC?.jsonBody ??
                                                  ''),
                                              r'''$.success''',
                                            )) {
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.25,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Invitación enviada',
                                                          description:
                                                              'Se ha enviado la invitación a: ${_model.emailFieldTextController.text} con éxito.',
                                                          buttonText: 'Aceptar',
                                                          showDismissButton:
                                                              false,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            } else {
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.25,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title: 'Error',
                                                          description:
                                                              getJsonField(
                                                            (_model.invitationAC
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          buttonText: 'Aceptar',
                                                          showDismissButton:
                                                              false,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            context.safePop();
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        } else {
                                          await showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.25,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.9,
                                                    child:
                                                        CustomConfirmDialogWidget(
                                                      title:
                                                          'Usuario ya  registrado',
                                                      description:
                                                          'Este correo electrónico ya fue registrado.',
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
                                          ).then((value) => setState(() {}));

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      text: 'Enviar invitación',
                                      options: FFButtonOptions(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF5E4A98),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
