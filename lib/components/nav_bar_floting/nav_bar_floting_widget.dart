import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_floting_model.dart';
export 'nav_bar_floting_model.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({
    super.key,
    required this.userPermissions,
    required this.pageName,
  });

  final UserPermissionsRecord? userPermissions;
  final String? pageName;

  @override
  State<NavBarFlotingWidget> createState() => _NavBarFlotingWidgetState();
}

class _NavBarFlotingWidgetState extends State<NavBarFlotingWidget> {
  late NavBarFlotingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarFlotingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: FutureBuilder<List<NotificationRecord>>(
        future: queryNotificationRecordOnce(
          queryBuilder: (notificationRecord) => notificationRecord
              .where(
                'receiver_id',
                isEqualTo: currentUserUid,
              )
              .where(
                'is_read',
                isEqualTo: false,
              ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).accent3,
                  ),
                ),
              ),
            );
          }
          List<NotificationRecord> containerNotificationRecordList =
              snapshot.data!;
          return Container(
            width: double.infinity,
            height: 70.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    5.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 70.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isAdmin, false) ||
                                  widget.userPermissions!.readQr ||
                                  widget.userPermissions!.readSms ||
                                  widget.userPermissions!.createQr ||
                                  widget.userPermissions!.createSms) {
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isValidMail, false)) {
                                  if (valueOrDefault<bool>(
                                          currentUserDocument
                                              ?.isValidPhoneNumber,
                                          false) ==
                                      true) {
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isAdmin, false)
                                        ? valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.isCompanyComplete,
                                            false)
                                        : true) {
                                      context
                                          .goNamed('OK_FN_Payry_26_Dashboard');

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Acceso denegado'),
                                                    content: Text(
                                                        'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
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

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  } else {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Acceso denegado'),
                                                  content: Text(
                                                      'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
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

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  }
                                } else {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Acceso denegado'),
                                                content: Text(
                                                    'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
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
                                                    child: Text('Reenviar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    try {
                                      final result = await FirebaseFunctions
                                          .instance
                                          .httpsCallable('verifyEmail')
                                          .call({
                                        "email": currentUserEmail,
                                      });
                                      _model.verifyEmailRespN1 =
                                          VerifyEmailCloudFunctionCallResponse(
                                        data: result.data,
                                        succeeded: true,
                                        resultAsString: result.data.toString(),
                                        jsonBody: result.data,
                                      );
                                    } on FirebaseFunctionsException catch (error) {
                                      _model.verifyEmailRespN1 =
                                          VerifyEmailCloudFunctionCallResponse(
                                        errorCode: error.code,
                                        succeeded: false,
                                      );
                                    }

                                    _shouldSetState = true;
                                    if (_model.verifyEmailRespN1!.succeeded!) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Verificación enviada'),
                                            content: Text(
                                                'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
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
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Acceso Denegado'),
                                      content: Text(
                                          'No cuentas con permisos suficientes.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  FFIcons.kestadisticas,
                                  color: widget.pageName == 'dashboard'
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 25.0,
                                ),
                                Text(
                                  'Dashboard',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: widget.pageName == 'dashboard'
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isAdmin, false) ||
                                  widget.userPermissions!.createQr) {
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isValidMail, false)) {
                                  if (valueOrDefault<bool>(
                                          currentUserDocument
                                              ?.isValidPhoneNumber,
                                          false) ==
                                      true) {
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isAdmin, false)
                                        ? valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.isCompanyComplete,
                                            false)
                                        : true) {
                                      context.goNamed(
                                        'OK_FN_Payry_27_solicitarQR',
                                        queryParameters: {
                                          'readQr': serializeParam(
                                            widget.userPermissions?.readQr,
                                            ParamType.bool,
                                          ),
                                          'createRefund': serializeParam(
                                            widget
                                                .userPermissions?.createRefunds,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Acceso denegado'),
                                                    content: Text(
                                                        'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
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

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  } else {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Acceso denegado'),
                                                  content: Text(
                                                      'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
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

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  }
                                } else {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Acceso denegado'),
                                                content: Text(
                                                    'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
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
                                                    child: Text('Reenviar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    try {
                                      final result = await FirebaseFunctions
                                          .instance
                                          .httpsCallable('verifyEmail')
                                          .call({
                                        "email": currentUserEmail,
                                      });
                                      _model.verifyEmailRespN2 =
                                          VerifyEmailCloudFunctionCallResponse(
                                        data: result.data,
                                        succeeded: true,
                                        resultAsString: result.data.toString(),
                                        jsonBody: result.data,
                                      );
                                    } on FirebaseFunctionsException catch (error) {
                                      _model.verifyEmailRespN2 =
                                          VerifyEmailCloudFunctionCallResponse(
                                        errorCode: error.code,
                                        succeeded: false,
                                      );
                                    }

                                    _shouldSetState = true;
                                    if (_model.verifyEmailRespN2!.succeeded!) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Verificación enviada'),
                                            content: Text(
                                                'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
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
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Acceso Denegado'),
                                      content: Text(
                                          'No cuentas con permisos suficientes.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  FFIcons.kqr,
                                  color: widget.pageName == 'codi'
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 25.0,
                                ),
                                Text(
                                  'CoDi®',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: widget.pageName == 'codi'
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isAdmin, false) ||
                                  widget.userPermissions!.createSms) {
                                if (valueOrDefault<bool>(
                                    currentUserDocument?.isValidMail, false)) {
                                  if (valueOrDefault<bool>(
                                          currentUserDocument
                                              ?.isValidPhoneNumber,
                                          false) ==
                                      true) {
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isAdmin, false)
                                        ? valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.isCompanyComplete,
                                            false)
                                        : true) {
                                      context.goNamed(
                                        'OK_FN_Payry_32_solicitarSMS',
                                        queryParameters: {
                                          'readSms': serializeParam(
                                            widget.userPermissions?.readSms,
                                            ParamType.bool,
                                          ),
                                          'createRefund': serializeParam(
                                            widget
                                                .userPermissions?.createRefunds,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title:
                                                        Text('Acceso denegado'),
                                                    content: Text(
                                                        'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
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

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  } else {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title:
                                                      Text('Acceso denegado'),
                                                  content: Text(
                                                      'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
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

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }
                                  }
                                } else {
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Acceso denegado'),
                                                content: Text(
                                                    'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
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
                                                    child: Text('Reenviar'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    try {
                                      final result = await FirebaseFunctions
                                          .instance
                                          .httpsCallable('verifyEmail')
                                          .call({
                                        "email": currentUserEmail,
                                      });
                                      _model.verifyEmailRespN3 =
                                          VerifyEmailCloudFunctionCallResponse(
                                        data: result.data,
                                        succeeded: true,
                                        resultAsString: result.data.toString(),
                                        jsonBody: result.data,
                                      );
                                    } on FirebaseFunctionsException catch (error) {
                                      _model.verifyEmailRespN3 =
                                          VerifyEmailCloudFunctionCallResponse(
                                        errorCode: error.code,
                                        succeeded: false,
                                      );
                                    }

                                    _shouldSetState = true;
                                    if (_model.verifyEmailRespN3!.succeeded!) {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Verificación enviada'),
                                            content: Text(
                                                'Se ha enviado la verificación a su correo electrónico, favor de entrar en el enlace enviado.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
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
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Error al enviar verificación de correo electrónico. Porfavor intentelo de nuevo. Si el error persiste póngase en contacto con el soporte técnico.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Acceso Denegado'),
                                      content: Text(
                                          'No cuentas con permisos suficientes.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  FFIcons.ksms,
                                  color: widget.pageName == 'dimo'
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 25.0,
                                ),
                                Text(
                                  'DiMo®',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: widget.pageName == 'dimo'
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(
                                          'OK_FN_Payry_40_Notificaciones');
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FFIcons.knotificaciones,
                                          color:
                                              widget.pageName ==
                                                      'notificaciones'
                                                  ? FlutterFlowTheme.of(context)
                                                      .success
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                          size: 25.0,
                                        ),
                                        Text(
                                          'Notificaciones',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: widget.pageName ==
                                                        'notificaciones'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .success
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                fontSize:
                                                    valueOrDefault<double>(
                                                  () {
                                                    if (MediaQuery.sizeOf(
                                                                context)
                                                            .width <
                                                        375.0) {
                                                      return 7.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        428.0) {
                                                      return 8.0;
                                                    } else if (MediaQuery
                                                                .sizeOf(context)
                                                            .width <
                                                        480.0) {
                                                      return 9.0;
                                                    } else {
                                                      return 10.0;
                                                    }
                                                  }(),
                                                  7.0,
                                                ),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(
                                          height: valueOrDefault<double>(
                                        () {
                                          if (MediaQuery.sizeOf(context).width <
                                              375.0) {
                                            return 8.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              428.0) {
                                            return 7.0;
                                          } else if (MediaQuery.sizeOf(context)
                                                  .width <
                                              480.0) {
                                            return 6.0;
                                          } else {
                                            return 4.0;
                                          }
                                        }(),
                                        4.0,
                                      ))),
                                    ),
                                  ),
                                ),
                              ),
                              if (containerNotificationRecordList.length > 0)
                                Align(
                                  alignment: AlignmentDirectional(0.53, -0.68),
                                  child: Container(
                                    width: 15.0,
                                    height: 15.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF8A71),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.15,
                          decoration: BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.goNamed('OK_FN_Payry_13_Menumas');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  FFIcons.kmas,
                                  color: widget.pageName == 'menu'
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  size: 25.0,
                                ),
                                Text(
                                  'Más',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: widget.pageName == 'menu'
                                            ? FlutterFlowTheme.of(context)
                                                .success
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(SizedBox(height: 4.0)),
                            ),
                          ),
                        ),
                      ],
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
