import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/primeros_pasos_menu_mas.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry13_menumas_model.dart';
export 'o_k_f_n_payry13_menumas_model.dart';

class OKFNPayry13MenumasWidget extends StatefulWidget {
  const OKFNPayry13MenumasWidget({
    super.key,
    bool? showWT,
  }) : this.showWT = showWT ?? true;

  final bool showWT;

  @override
  State<OKFNPayry13MenumasWidget> createState() =>
      _OKFNPayry13MenumasWidgetState();
}

class _OKFNPayry13MenumasWidgetState extends State<OKFNPayry13MenumasWidget> {
  late OKFNPayry13MenumasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry13MenumasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkedForUpdate = await actions.checkForUpdate();
      if (getJsonField(
        _model.checkedForUpdate,
        r'''$.hasUpdate''',
      )) {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.25,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: CustomConfirmDialogWidget(
                  title: 'Actualización disponible',
                  description:
                      'Hay una nueva versión disponible en la tienda. Es necesario actualizar la aplicación para seguir utilizandola. Favor de descargar.',
                  buttonText: 'Actualizar',
                  showDismissButton: false,
                  dismissAction: () async {
                    Navigator.pop(context);
                  },
                  mainAction: () async {
                    await launchURL(getJsonField(
                      _model.checkedForUpdate,
                      r'''$.storeLink''',
                    ).toString().toString());
                  },
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }
      if ((FFAppState().transactionsCount >= 20.0) &&
          !functions.isSameDate(FFAppState().rateAppSkipDay!) &&
          !FFAppState().isRatedApp) {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.3,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: CustomConfirmDialogWidget(
                  title: '¿Qué tal te ha parecido Payry?',
                  description:
                      'Por favor califica nuestra aplicación y cuéntanos tu experiencia.',
                  buttonText: 'Reenviar',
                  showDismissButton: true,
                  dismissAction: () async {
                    setState(() {
                      FFAppState().rateAppSkipDay = functions.todayFilter();
                      FFAppState().isRatedApp = false;
                    });
                    Navigator.pop(context);
                  },
                  mainAction: () async {
                    await actions.requestReview();
                    setState(() {
                      FFAppState().isRatedApp = true;
                    });
                  },
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }
      if (FFAppState().walkthroughs == null) {
        FFAppState().walkthroughs = <String, bool?>{
          'menu_mas': true,
          'dashboard': true,
          'datos_bancarios': true,
          'add_users': true,
          'user_permissions': true,
          'create_codi': true,
          'create_dimo': true,
          'edit_profile': true,
        };
        setState(() {
          _model.show = true;
        });
      } else {
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

    return Builder(
      builder: (context) => StreamBuilder<List<UserPermissionsRecord>>(
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
              oKFNPayry13MenumasUserPermissionsRecordList = snapshot.data!;
          final oKFNPayry13MenumasUserPermissionsRecord =
              oKFNPayry13MenumasUserPermissionsRecordList.isNotEmpty
                  ? oKFNPayry13MenumasUserPermissionsRecordList.first
                  : null;
          return WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 36.0, 18.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Más opciones  ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    icon: FaIcon(
                                      FontAwesomeIcons.questionCircle,
                                      color:
                                          FlutterFlowTheme.of(context).accent1,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      safeSetState(() => _model
                                              .primerosPasosMenuMasController =
                                          createPageWalkthrough(context));
                                      _model.primerosPasosMenuMasController
                                          ?.show(context: context);
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 72.0),
                                child: Wrap(
                                  spacing: 10.0,
                                  runSpacing: 16.0,
                                  alignment: WrapAlignment.spaceBetween,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .createQr) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isAdmin,
                                                          false)
                                                      ? valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isCompanyComplete,
                                                          false)
                                                      : true) {
                                                    context.pushNamed(
                                                      'OK_FN_Payry_27_solicitarQR',
                                                      queryParameters: {
                                                        'readQr':
                                                            serializeParam(
                                                          oKFNPayry13MenumasUserPermissionsRecord
                                                              ?.readQr,
                                                          ParamType.bool,
                                                        ),
                                                        'createRefund':
                                                            serializeParam(
                                                          oKFNPayry13MenumasUserPermissionsRecord
                                                              ?.createRefunds,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
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
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                CustomConfirmDialogWidget(
                                                              title:
                                                                  'Acceso denegado',
                                                              description:
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.',
                                                              buttonText:
                                                                  'Registrar empresa',
                                                              showDismissButton:
                                                                  true,
                                                              dismissAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              mainAction:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'OK_FN_Payry_19_formularioEmpresa');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACCodiMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACCodiMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACCodiMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .createQr
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kqr,
                                                      color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false) ||
                                                              oKFNPayry13MenumasUserPermissionsRecord!
                                                                  .createQr
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'CoDi®',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isAdmin,
                                                                      false) ||
                                                                  oKFNPayry13MenumasUserPermissionsRecord!
                                                                      .createQr
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFFA1A1A1),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ).addWalkthrough(
                                          container4zzotb73,
                                          _model.primerosPasosMenuMasController,
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .createSms) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isAdmin,
                                                          false)
                                                      ? valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isCompanyComplete,
                                                          false)
                                                      : true) {
                                                    context.pushNamed(
                                                      'OK_FN_Payry_32_solicitarSMS',
                                                      queryParameters: {
                                                        'readSms':
                                                            serializeParam(
                                                          oKFNPayry13MenumasUserPermissionsRecord
                                                              ?.readSms,
                                                          ParamType.bool,
                                                        ),
                                                        'createRefund':
                                                            serializeParam(
                                                          oKFNPayry13MenumasUserPermissionsRecord
                                                              ?.createRefunds,
                                                          ParamType.bool,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
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
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                CustomConfirmDialogWidget(
                                                              title:
                                                                  'Acceso denegado',
                                                              description:
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.',
                                                              buttonText:
                                                                  'Registrar empresa',
                                                              showDismissButton:
                                                                  true,
                                                              dismissAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              mainAction:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'OK_FN_Payry_19_formularioEmpresa');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACDimoMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACDimoMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACDimoMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .createSms
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.ksms,
                                                      color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false) ||
                                                              oKFNPayry13MenumasUserPermissionsRecord!
                                                                  .createSms
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'DiMo®',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend',
                                                              color: valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.isAdmin,
                                                                          false) ||
                                                                      oKFNPayry13MenumasUserPermissionsRecord!
                                                                          .createSms
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : Color(
                                                                      0xFFA1A1A1),
                                                              fontSize:
                                                                  MediaQuery.sizeOf(context)
                                                                              .width <
                                                                          375.0
                                                                      ? 12.0
                                                                      : 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed('OK_FN_Payry_14_Perfil');
                                      },
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              390.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.42);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              480.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              900.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1025.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.23);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1300.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1600.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1);
                                          }
                                        }(),
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kusuario,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                'Mi perfil',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ).addWalkthrough(
                                      containerBkgp3rtd,
                                      _model.primerosPasosMenuMasController,
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .readCompanies) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACCompayMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACCompayMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACCompayMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .readCompanies
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kempresa,
                                                      color: valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.isAdmin,
                                                              false)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Empresa',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFFA1A1A1),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ).addWalkthrough(
                                          containerUroenb4x,
                                          _model.primerosPasosMenuMasController,
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .readStatistics) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isAdmin,
                                                          false)
                                                      ? valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isCompanyComplete,
                                                          false)
                                                      : true) {
                                                    context.pushNamed(
                                                        'OK_FN_Payry_38_Estadisticas');

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
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
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                CustomConfirmDialogWidget(
                                                              title:
                                                                  'Acceso denegado',
                                                              description:
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.',
                                                              buttonText:
                                                                  'Registrar empresa',
                                                              showDismissButton:
                                                                  true,
                                                              dismissAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              mainAction:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'OK_FN_Payry_19_formularioEmpresa');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACStatisticsMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACStatisticsMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACStatisticsMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .readStatistics
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kestadisticas,
                                                      color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false) ||
                                                              oKFNPayry13MenumasUserPermissionsRecord!
                                                                  .readStatistics
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Estadísticas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isAdmin,
                                                                      false) ||
                                                                  oKFNPayry13MenumasUserPermissionsRecord!
                                                                      .readStatistics
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFFA1A1A1),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .readUsers) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isAdmin,
                                                          false)
                                                      ? valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isCompanyComplete,
                                                          false)
                                                      : true) {
                                                    context.pushNamed(
                                                        'OK_FN_Payry_24_listadoUsuarios');

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
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
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                CustomConfirmDialogWidget(
                                                              title:
                                                                  'Acceso denegado',
                                                              description:
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.',
                                                              buttonText:
                                                                  'Registrar empresa',
                                                              showDismissButton:
                                                                  true,
                                                              dismissAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              mainAction:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'OK_FN_Payry_19_formularioEmpresa');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACUserMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACUserMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.message''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACUserMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .readUsers
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kvariosUsuarios,
                                                      color: valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.isAdmin,
                                                              false)
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Usuarios',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false)
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFFA1A1A1),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .readInvoices) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isAdmin,
                                                          false)
                                                      ? valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isCompanyComplete,
                                                          false)
                                                      : true) {
                                                    context.pushNamed(
                                                        'OK_FN_Payry_37_facturas');

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
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
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                CustomConfirmDialogWidget(
                                                              title:
                                                                  'Acceso denegado',
                                                              description:
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.',
                                                              buttonText:
                                                                  'Registrar empresa',
                                                              showDismissButton:
                                                                  true,
                                                              dismissAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              mainAction:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'OK_FN_Payry_19_formularioEmpresa');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACBillMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACBillMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACBillMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .readInvoices
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kfactura,
                                                      color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false) ||
                                                              oKFNPayry13MenumasUserPermissionsRecord!
                                                                  .readInvoices
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Facturas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isAdmin,
                                                                      false) ||
                                                                  oKFNPayry13MenumasUserPermissionsRecord!
                                                                      .readInvoices
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : Color(
                                                                  0xFFA1A1A1),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) =>
                                          AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var _shouldSetState = false;
                                            if (valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isAdmin,
                                                    false) ||
                                                oKFNPayry13MenumasUserPermissionsRecord!
                                                    .readTransfers) {
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.isValidMail,
                                                  false)) {
                                                if (valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isValidPhoneNumber,
                                                        false) ==
                                                    true) {
                                                  if (valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isAdmin,
                                                          false)
                                                      ? valueOrDefault<bool>(
                                                          currentUserDocument
                                                              ?.isCompanyComplete,
                                                          false)
                                                      : true) {
                                                    context.pushNamed(
                                                        'OK_FN_Payry_44_historialTransactions');

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
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
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            child:
                                                                CustomConfirmDialogWidget(
                                                              title:
                                                                  'Acceso denegado',
                                                              description:
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.',
                                                              buttonText:
                                                                  'Registrar empresa',
                                                              showDismissButton:
                                                                  true,
                                                              dismissAction:
                                                                  () async {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              mainAction:
                                                                  () async {
                                                                context.pushNamed(
                                                                    'OK_FN_Payry_19_formularioEmpresa');
                                                              },
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));

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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.3,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Acceso denegado',
                                                            description:
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.',
                                                            buttonText:
                                                                'Verificar número',
                                                            showDismissButton:
                                                                true,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));

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
                                                      child: Container(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.3,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.9,
                                                        child:
                                                            CustomConfirmDialogWidget(
                                                          title:
                                                              'Acceso denegado',
                                                          description:
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.',
                                                          buttonText:
                                                              'Reenviar',
                                                          showDismissButton:
                                                              true,
                                                          dismissAction:
                                                              () async {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          mainAction: () async {
                                                            var _shouldSetState =
                                                                false;
                                                            _model.verifyACTransferMenu =
                                                                await AuthGroup
                                                                    .verifyEmailCall
                                                                    .call(
                                                              email:
                                                                  currentUserEmail,
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              (_model.verifyACTransferMenu
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.success''',
                                                            )) {
                                                              Navigator.pop(
                                                                  context);
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
                                                                            'Verificación enviada',
                                                                        description:
                                                                            'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.',
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            } else {
                                                              Navigator.pop(
                                                                  context);
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
                                                                          (_model.verifyACTransferMenu?.jsonBody ??
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
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              return;
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .readTransfers
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      FFIcons.kcompartir,
                                                      color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false) ||
                                                              oKFNPayry13MenumasUserPermissionsRecord!
                                                                  .readTransfers
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Transferencias',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend',
                                                              color: valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.isAdmin,
                                                                          false) ||
                                                                      oKFNPayry13MenumasUserPermissionsRecord!
                                                                          .readTransfers
                                                                  ? (valueOrDefault<bool>(
                                                                              currentUserDocument
                                                                                  ?.isAdmin,
                                                                              false) ||
                                                                          oKFNPayry13MenumasUserPermissionsRecord!
                                                                              .readTransfers
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText
                                                                      : Color(
                                                                          0x808F8F8F))
                                                                  : Color(
                                                                      0xFFA1A1A1),
                                                              fontSize:
                                                                  valueOrDefault<
                                                                      double>(
                                                                MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        390.0
                                                                    ? 11.0
                                                                    : 14.0,
                                                                11.0,
                                                              ),
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            'OK_FN_Payry_42_Terminosycondiciones');
                                      },
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              390.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.42);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              480.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              900.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1025.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.23);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1300.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1600.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1);
                                          }
                                        }(),
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kporcentaje,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                'Términos y\ncondiciones',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            'OK_FN_Payry_43_Politicadeprivacidad');
                                      },
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              390.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.42);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              480.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              900.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1025.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.23);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1300.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1600.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1);
                                          }
                                        }(),
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  FFIcons.khoja,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                'Política de\nprivacidad',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed('OK_FN_Payry_41_FAQs');
                                      },
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              390.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.42);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              480.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              900.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1025.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.23);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1300.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1600.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1);
                                          }
                                        }(),
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons.help_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                              Text(
                                                'FAQ\'s',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (Theme.of(context).brightness ==
                                            Brightness.light) {
                                          setDarkModeSetting(
                                              context, ThemeMode.dark);
                                          return;
                                        } else {
                                          setDarkModeSetting(
                                              context, ThemeMode.light);
                                          return;
                                        }
                                      },
                                      child: Container(
                                        width: () {
                                          if (MediaQuery.sizeOf(context).width <
                                              390.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.42);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              480.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.44);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              900.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1025.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.23);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1300.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.18);
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              1600.0) {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.14);
                                          } else {
                                            return (MediaQuery.sizeOf(context)
                                                    .width *
                                                0.1);
                                          }
                                        }(),
                                        height: 75.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  FFIcons.ksol,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 20.0,
                                                ),
                                              ),
                                              Text(
                                                Theme.of(context).brightness ==
                                                        Brightness.light
                                                    ? 'Modo oscuro'
                                                    : 'Modo claro',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  375.0
                                                              ? 12.0
                                                              : 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (currentUserUid ==
                                        'cyG5Cl4EbQWZorqiCXuWGdnViJh1')
                                      AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.storeVersionInfo =
                                                await actions.checkForUpdate();
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Store Update'),
                                                  content: Text(_model
                                                      .storeVersionInfo!
                                                      .toString()),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                            setState(() {});
                                          },
                                          child: Container(
                                            width: () {
                                              if (MediaQuery.sizeOf(context)
                                                      .width <
                                                  390.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.42);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  480.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.44);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  900.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.3);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1025.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.23);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1300.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.18);
                                              } else if (MediaQuery.sizeOf(
                                                          context)
                                                      .width <
                                                  1600.0) {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.14);
                                              } else {
                                                return (MediaQuery.sizeOf(
                                                            context)
                                                        .width *
                                                    0.1);
                                              }
                                            }(),
                                            height: 75.0,
                                            decoration: BoxDecoration(
                                              color: valueOrDefault<Color>(
                                                valueOrDefault<bool>(
                                                            currentUserDocument
                                                                ?.isAdmin,
                                                            false) ||
                                                        oKFNPayry13MenumasUserPermissionsRecord!
                                                            .readTransfers
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground
                                                    : Color(0x83CCCCCC),
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Icon(
                                                      Icons
                                                          .engineering_outlined,
                                                      color: valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isAdmin,
                                                                  false) ||
                                                              oKFNPayry13MenumasUserPermissionsRecord!
                                                                  .readTransfers
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0x808F8F8F),
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Test',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isAdmin,
                                                                      false) ||
                                                                  oKFNPayry13MenumasUserPermissionsRecord!
                                                                      .readTransfers
                                                              ? (valueOrDefault<
                                                                              bool>(
                                                                          currentUserDocument
                                                                              ?.isAdmin,
                                                                          false) ||
                                                                      oKFNPayry13MenumasUserPermissionsRecord!
                                                                          .readTransfers
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText
                                                                  : Color(
                                                                      0x808F8F8F))
                                                              : Color(
                                                                  0x808F8F8F),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(SizedBox(width: 5.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                        child: wrapWithModel(
                          model: _model.navBarFlotingModel,
                          updateCallback: () => setState(() {}),
                          child: NavBarFlotingWidget(
                            userPermissions:
                                oKFNPayry13MenumasUserPermissionsRecord!,
                            pageName: 'menu',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.primerosPasosMenuMasController = null);
          FFAppState().walkthroughs = <String, bool?>{
            'menu_mas': false,
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
              'menu_mas': false,
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
