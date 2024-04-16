import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry17_verificar_o_t_p_model.dart';
export 'o_k_f_n_payry17_verificar_o_t_p_model.dart';

class OKFNPayry17VerificarOTPWidget extends StatefulWidget {
  const OKFNPayry17VerificarOTPWidget({
    super.key,
    required this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  State<OKFNPayry17VerificarOTPWidget> createState() =>
      _OKFNPayry17VerificarOTPWidgetState();
}

class _OKFNPayry17VerificarOTPWidgetState
    extends State<OKFNPayry17VerificarOTPWidget> {
  late OKFNPayry17VerificarOTPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry17VerificarOTPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            'Verifica tu número de teléfono',
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
            padding: EdgeInsets.all(18.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Ingresa el código aquí',
                                textAlign: TextAlign.start,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: PinCodeTextField(
                                autoDisposeControllers: false,
                                appContext: context,
                                length: 6,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                enableActiveFill: false,
                                autoFocus: true,
                                enablePinAutofill: false,
                                errorTextSpace: 16.0,
                                showCursor: true,
                                cursorColor: Colors.white,
                                obscureText: false,
                                keyboardType: TextInputType.number,
                                pinTheme: PinTheme(
                                  fieldHeight: 44.0,
                                  fieldWidth: 44.0,
                                  borderWidth: 1.0,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  shape: PinCodeFieldShape.box,
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  inactiveColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  selectedColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  activeFillColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  inactiveFillColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  selectedFillColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                controller: _model.pinCodeController,
                                onChanged: (_) {},
                                autovalidateMode: AutovalidateMode.disabled,
                                validator: _model.pinCodeControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 4.0, 0.0),
                                  child: Text(
                                    'Tiempo restante para verificar código:',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                FlutterFlowTimer(
                                  initialTime: _model.timerMilliseconds,
                                  getDisplayTime: (value) =>
                                      StopWatchTimer.getDisplayTime(
                                    value,
                                    hours: false,
                                    milliSecond: false,
                                  ),
                                  controller: _model.timerController,
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.timerMilliseconds = value;
                                    _model.timerValue = displayTime;
                                    if (shouldUpdate) setState(() {});
                                  },
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        fontSize: 15.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'seg.',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 10.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            if (_model.timerMilliseconds > 0)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: (_model.timerMilliseconds <= 0)
                                          ? null
                                          : () async {
                                              var _shouldSetState = false;
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              _model.otpAC =
                                                  await VerifyPhoneCall.call(
                                                token: FFAppState().serverToken,
                                                otp: _model
                                                    .pinCodeController!.text,
                                              );
                                              _shouldSetState = true;
                                              if (getJsonField(
                                                (_model.otpAC?.jsonBody ?? ''),
                                                r'''$.success''',
                                              )) {
                                                await currentUserReference!
                                                    .update(
                                                        createUsersRecordData(
                                                  phoneNumber:
                                                      widget.phoneNumber,
                                                ));
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
                                                            title: getJsonField(
                                                              (_model.otpAC
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.message''',
                                                            ).toString(),
                                                            description:
                                                                'El número de teléfono ha sido verificado con éxito.',
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
                                                ).then(
                                                    (value) => setState(() {}));

                                                context.goNamed(
                                                    'OK_FN_Payry_15_EditProfile');

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
                                                              (_model.otpAC
                                                                      ?.jsonBody ??
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
                                                ).then(
                                                    (value) => setState(() {}));

                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                      text: 'Verificar',
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
                                              color: Color(0xFFFAF9FE),
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        disabledColor: Color(0x83CCCCCC),
                                        disabledTextColor: Color(0xFFA1A1A1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            if (_model.timerMilliseconds <= 0)
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        _model.rvpAC =
                                            await RequestVerifyPhoneCall.call(
                                          token: FFAppState().serverToken,
                                          phone: widget.phoneNumber,
                                        );
                                        _shouldSetState = true;
                                        if (getJsonField(
                                          (_model.rvpAC?.jsonBody ?? ''),
                                          r'''$.success''',
                                        )) {
                                          _model.timerController.onResetTimer();

                                          _model.timerController.onStartTimer();
                                          if (_shouldSetState) setState(() {});
                                          return;
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
                                                      title: 'Error',
                                                      description: getJsonField(
                                                        (_model.rvpAC
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString(),
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
                                      text: 'Reenviar código',
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
                                              color: Color(0xFFFAF9FE),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
