import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/primeros_pasos_menu_mas.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry13_menumas_model.dart';
export 'o_k_f_n_payry13_menumas_model.dart';

class OKFNPayry13MenumasWidget extends StatefulWidget {
  const OKFNPayry13MenumasWidget({super.key});

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
      await Future.delayed(const Duration(milliseconds: 15));
      _model.primerosPasosMenuMasController =
          _model.createPageWalkthrough(context);
      _model.primerosPasosMenuMasController?.show(context: context);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 36.0, 18.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Más opciones',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                      ),
                                    ),
                                  ],
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
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .createQr) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                                    'readQr': serializeParam(
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
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Acceso denegado'),
                                                              content: Text(
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Registrar empresa'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp1 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp1 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp1!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .createQr
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.kqr,
                                                  color: valueOrDefault<bool>(
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
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      fontSize: 14.0,
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
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .createSms) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                                    'readSms': serializeParam(
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
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Acceso denegado'),
                                                              content: Text(
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Registrar empresa'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp2 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp2 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp2!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .createSms
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.ksms,
                                                  color: valueOrDefault<bool>(
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
                                                                  .createSms
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                      fontSize: MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              375.0
                                                          ? 12.0
                                                          : 14.0,
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
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
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .readCompanies) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp3 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp3 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp3!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .readCompanies
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.kempresa,
                                                  color: valueOrDefault<bool>(
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
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
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
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .readStatistics) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Acceso denegado'),
                                                              content: Text(
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Registrar empresa'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp4 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp4 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp4!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .readStatistics
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.kestadisticas,
                                                  color: valueOrDefault<bool>(
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
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .readUsers) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Acceso denegado'),
                                                              content: Text(
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Registrar empresa'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp5 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp5 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp5!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .readUsers
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.kvariosUsuarios,
                                                  color: valueOrDefault<bool>(
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
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .readInvoices) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Acceso denegado'),
                                                              content: Text(
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Registrar empresa'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp6 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp6 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp6!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    true ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .readInvoices
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.kfactura,
                                                  color: valueOrDefault<bool>(
                                                              currentUserDocument
                                                                  ?.isAdmin,
                                                              false) ||
                                                          true
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
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : Color(0xFFA1A1A1),
                                                    ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var _shouldSetState = false;
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry13MenumasUserPermissionsRecord!
                                                .readTransfers) {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument?.isValidMail,
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
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Acceso denegado'),
                                                              content: Text(
                                                                  'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Registrar empresa'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_19_formularioEmpresa');

                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                } else {
                                                  if (_shouldSetState)
                                                    setState(() {});
                                                  return;
                                                }
                                              }
                                            } else {
                                              var confirmDialogResponse =
                                                  await showDialog<bool>(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Acceso denegado'),
                                                            content: Text(
                                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        false),
                                                                child: Text(
                                                                    'Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext,
                                                                        true),
                                                                child: Text(
                                                                    'Verificar número'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ) ??
                                                      false;
                                              if (confirmDialogResponse) {
                                                context.pushNamed(
                                                    'OK_FN_Payry_15_EditProfile');

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              } else {
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Acceso denegado'),
                                                          content: Text(
                                                              'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Reenviar'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              try {
                                                final result =
                                                    await FirebaseFunctions
                                                        .instance
                                                        .httpsCallable(
                                                            'verifyEmail')
                                                        .call({
                                                  "email": currentUserEmail,
                                                });
                                                _model.verifyEmailResp7 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  data: result.data,
                                                  succeeded: true,
                                                  resultAsString:
                                                      result.data.toString(),
                                                  jsonBody: result.data,
                                                );
                                              } on FirebaseFunctionsException catch (error) {
                                                _model.verifyEmailResp7 =
                                                    VerifyEmailCloudFunctionCallResponse(
                                                  errorCode: error.code,
                                                  succeeded: false,
                                                );
                                              }

                                              _shouldSetState = true;
                                              if (_model.verifyEmailResp7!
                                                  .succeeded!) {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verificación enviada'),
                                                      content: Text(
                                                          'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
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
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Error'),
                                                      content: Text(
                                                          'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
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
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .readTransfers
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  FFIcons.kcompartir,
                                                  color: valueOrDefault<bool>(
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
                                                    FlutterFlowTheme.of(context)
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
                                                                  0xFFA1A1A1),
                                                          fontSize:
                                                              valueOrDefault<
                                                                  double>(
                                                            MediaQuery.sizeOf(
                                                                            context)
                                                                        .width <
                                                                    390.0
                                                                ? 11.0
                                                                : 14.0,
                                                            11.0,
                                                          ),
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
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
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                      context.pushNamed('OK_FN_Payry_41_FAQs');
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
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: MediaQuery.sizeOf(
                                                                        context)
                                                                    .width <
                                                                375.0
                                                            ? 12.0
                                                            : 14.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 5.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (currentUserUid ==
                                      'eC3f6n6aq1e1Ow99VQ1I41eXPox1')
                                    AuthUserStreamWidget(
                                      builder: (context) => Container(
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
                                          color: valueOrDefault<Color>(
                                            valueOrDefault<bool>(
                                                        currentUserDocument
                                                            ?.isAdmin,
                                                        false) ||
                                                    oKFNPayry13MenumasUserPermissionsRecord!
                                                        .readTransfers
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : Color(0x83CCCCCC),
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
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
                                                  Icons.engineering_outlined,
                                                  color: valueOrDefault<bool>(
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
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
    );
  }
}
