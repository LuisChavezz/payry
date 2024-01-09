import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_floting_model.dart';
export 'nav_bar_floting_model.dart';

class NavBarFlotingWidget extends StatefulWidget {
  const NavBarFlotingWidget({
    Key? key,
    required this.userPermissions,
  }) : super(key: key);

  final UserPermissionsRecord? userPermissions;

  @override
  _NavBarFlotingWidgetState createState() => _NavBarFlotingWidgetState();
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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 5.0),
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
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.kdashboard,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 25.0,
                      ),
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false) ||
                            widget.userPermissions!.readQr ||
                            widget.userPermissions!.readSms) {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isValidMail, false)) {
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isValidPhoneNumber,
                                    false) ==
                                true) {
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isAdmin, false)
                                  ? valueOrDefault<bool>(
                                      currentUserDocument?.isCompanyComplete,
                                      false)
                                  : true) {
                                context.pushNamed('OK_FN_Payry_26_Dashboard');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Acceso denegado'),
                                          content: Text(
                                              'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Registrar empresa'),
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
                                            title: Text('Acceso denegado'),
                                            content: Text(
                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Verificar número'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                context.pushNamed('OK_FN_Payry_15_EditProfile');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Acceso denegado'),
                                      content: Text(
                                          'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Reenviar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              try {
                                final result = await FirebaseFunctions.instance
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.kqr,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false) ||
                            widget.userPermissions!.createQr ||
                            widget.userPermissions!.readQr) {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isValidMail, false)) {
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isValidPhoneNumber,
                                    false) ==
                                true) {
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isAdmin, false)
                                  ? valueOrDefault<bool>(
                                      currentUserDocument?.isCompanyComplete,
                                      false)
                                  : true) {
                                context.pushNamed('OK_FN_Payry_29_opcionesQR');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Acceso denegado'),
                                          content: Text(
                                              'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Registrar empresa'),
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
                                            title: Text('Acceso denegado'),
                                            content: Text(
                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Verificar número'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                context.pushNamed('OK_FN_Payry_15_EditProfile');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Acceso denegado'),
                                      content: Text(
                                          'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Reenviar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              try {
                                final result = await FirebaseFunctions.instance
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.ksms,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        var _shouldSetState = false;
                        if (valueOrDefault<bool>(
                                currentUserDocument?.isAdmin, false) ||
                            widget.userPermissions!.createSms ||
                            widget.userPermissions!.readSms) {
                          if (valueOrDefault<bool>(
                              currentUserDocument?.isValidMail, false)) {
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isValidPhoneNumber,
                                    false) ==
                                true) {
                              if (valueOrDefault<bool>(
                                      currentUserDocument?.isAdmin, false)
                                  ? valueOrDefault<bool>(
                                      currentUserDocument?.isCompanyComplete,
                                      false)
                                  : true) {
                                context.pushNamed('OK_FN_Payry_34_opcionesSMS');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                var confirmDialogResponse = await showDialog<
                                        bool>(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Acceso denegado'),
                                          content: Text(
                                              'No es posible acceder a esta sección hasta que registres tu empresa y datos bancarios.'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, false),
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext, true),
                                              child: Text('Registrar empresa'),
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
                                            title: Text('Acceso denegado'),
                                            content: Text(
                                                'No es posible acceder ya que falta realizar la verificación de tu número de teléfono.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Verificar número'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                context.pushNamed('OK_FN_Payry_15_EditProfile');

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Acceso denegado'),
                                      content: Text(
                                          'No es posible acceder ya que falta realizar la verificación de tu correo electrónico. Revisa tu email o reenvia para verificar.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Reenviar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              try {
                                final result = await FirebaseFunctions.instance
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
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
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.knotificaciones,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('OK_FN_Payry_40_Notificaciones');
                      },
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        FFIcons.kmas,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pushNamed('OK_FN_Payry_13_Menumas');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
