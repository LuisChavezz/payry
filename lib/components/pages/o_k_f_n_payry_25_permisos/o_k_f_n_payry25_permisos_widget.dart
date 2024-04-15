import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/asignar_permisos_a_usuarios.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry25_permisos_model.dart';
export 'o_k_f_n_payry25_permisos_model.dart';

class OKFNPayry25PermisosWidget extends StatefulWidget {
  const OKFNPayry25PermisosWidget({
    super.key,
    required this.uid,
    required this.userName,
    required this.userEmail,
  });

  final String? uid;
  final String? userName;
  final String? userEmail;

  @override
  State<OKFNPayry25PermisosWidget> createState() =>
      _OKFNPayry25PermisosWidgetState();
}

class _OKFNPayry25PermisosWidgetState extends State<OKFNPayry25PermisosWidget> {
  late OKFNPayry25PermisosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry25PermisosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (getJsonField(
        FFAppState().walkthroughs,
        r'''$.user_permissions''',
      )) {
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          _model.show = true;
        });
        safeSetState(() => _model.asignarPermisosAUsuariosController =
            createPageWalkthrough(context));
        _model.asignarPermisosAUsuariosController?.show(context: context);
        return;
      } else {
        setState(() {
          _model.show = true;
        });
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UserPermissionsRecord>>(
      stream: queryUserPermissionsRecord(
        queryBuilder: (userPermissionsRecord) => userPermissionsRecord.where(
          'uid',
          isEqualTo: widget.uid,
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
            oKFNPayry25PermisosUserPermissionsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final oKFNPayry25PermisosUserPermissionsRecord =
            oKFNPayry25PermisosUserPermissionsRecordList.isNotEmpty
                ? oKFNPayry25PermisosUserPermissionsRecordList.first
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
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Text(
                      'Permisos  ',
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: FlutterFlowIconButton(
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
                        safeSetState(() =>
                            _model.asignarPermisosAUsuariosController =
                                createPageWalkthrough(context));
                        _model.asignarPermisosAUsuariosController
                            ?.show(context: context);
                      },
                    ),
                  ),
                ],
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Visibility(
                visible: _model.show,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          oKFNPayry25PermisosUserPermissionsRecord!
                                                              .createQr
                                                              .toString()),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              Text('Confirm'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                      },
                                      child: Text(
                                        widget.userName!,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    widget.userEmail,
                                    'a',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kqr,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Generar CoDi®',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.createQrSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .createQr,
                                        onChanged: (newValue) async {
                                          setState(() => _model
                                              .createQrSwitchValue = newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              createQr:
                                                  _model.createQrSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              createQr:
                                                  _model.createQrSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ).addWalkthrough(
                                    rowJdrrafp7,
                                    _model.asignarPermisosAUsuariosController,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kqrUsuario,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Consultar CoDi® de todos \nlos usuarios',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.readQrSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readQr,
                                        onChanged: (newValue) async {
                                          setState(() => _model
                                              .readQrSwitchValue = newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readQr: _model.readQrSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readQr: _model.readQrSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.ksms,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Generar DiMo®',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.createSmsSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .createSms,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.createSmsSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              createSms:
                                                  _model.createSmsSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              createSms:
                                                  _model.createSmsSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.ksmsUsuario,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Consultar DiMo® de todos\nlos usuarios',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.readSmsSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readSms,
                                        onChanged: (newValue) async {
                                          setState(() => _model
                                              .readSmsSwitchValue = newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readSms:
                                                  _model.readSmsSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readSms:
                                                  _model.readSmsSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kmoneda,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Generar devoluciones',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model
                                                .createRefundSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .createRefunds,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.createRefundSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              createRefunds: _model
                                                  .createRefundSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              createRefunds: _model
                                                  .createRefundSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kempresa,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Ver Datos de Empresa',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model
                                                .readCompaniesSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readCompanies,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.readCompaniesSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readCompanies: _model
                                                  .readCompaniesSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readCompanies: _model
                                                  .readCompaniesSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kfactura,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Ver Facturas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model
                                                .readInvoicesSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readInvoices,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.readInvoicesSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readInvoices: _model
                                                  .readInvoicesSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readInvoices: _model
                                                  .readInvoicesSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kvariosUsuarios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Ver Datos de usuarios',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model.readUsersSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readUsers,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.readUsersSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readUsers:
                                                  _model.readUsersSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readUsers: _model
                                                  .readInvoicesSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kestadisticas,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Ver estadísticas',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model
                                                .readStatisticsSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readStatistics,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.readStatisticsSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readStatistics: _model
                                                  .readStatisticsSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readStatistics: _model
                                                  .readStatisticsSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Icon(
                                                FFIcons.kcargarDeNuevo,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                            ),
                                            Text(
                                              'Ver transferencias',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch.adaptive(
                                        value: _model
                                                .readTransfersSwitchValue ??=
                                            oKFNPayry25PermisosUserPermissionsRecord!
                                                .readTransfers,
                                        onChanged: (newValue) async {
                                          setState(() =>
                                              _model.readTransfersSwitchValue =
                                                  newValue!);
                                          if (newValue!) {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readTransfers: _model
                                                  .readTransfersSwitchValue,
                                            ));
                                          } else {
                                            await oKFNPayry25PermisosUserPermissionsRecord!
                                                .reference
                                                .update(
                                                    createUserPermissionsRecordData(
                                              readTransfers: _model
                                                  .readTransfersSwitchValue,
                                            ));
                                          }
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .accent1,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        inactiveThumbColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                    ],
                                  ),
                                ].divide(SizedBox(height: 5.0)),
                              ),
                            ),
                          ],
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
          safeSetState(() => _model.asignarPermisosAUsuariosController = null);
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
            'user_permissions': false,
            'create_codi': getJsonField(
              FFAppState().walkthroughs,
              r'''$.create_codi''',
            ),
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
              'user_permissions': false,
              'create_codi': getJsonField(
                FFAppState().walkthroughs,
                r'''$.create_codi''',
              ),
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
