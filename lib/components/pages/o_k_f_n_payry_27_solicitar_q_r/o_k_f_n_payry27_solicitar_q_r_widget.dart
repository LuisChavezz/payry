import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry27_solicitar_q_r_model.dart';
export 'o_k_f_n_payry27_solicitar_q_r_model.dart';

class OKFNPayry27SolicitarQRWidget extends StatefulWidget {
  const OKFNPayry27SolicitarQRWidget({super.key});

  @override
  State<OKFNPayry27SolicitarQRWidget> createState() =>
      _OKFNPayry27SolicitarQRWidgetState();
}

class _OKFNPayry27SolicitarQRWidgetState
    extends State<OKFNPayry27SolicitarQRWidget> {
  late OKFNPayry27SolicitarQRModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry27SolicitarQRModel());

    _model.conceptFieldController ??= TextEditingController();
    _model.conceptFieldFocusNode ??= FocusNode();

    _model.amountFieldController ??= TextEditingController();
    _model.amountFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
            'Solicitar pago con QR',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Lexend',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: TextFormField(
                                controller: _model.conceptFieldController,
                                focusNode: _model.conceptFieldFocusNode,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Concepto',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Ingresa el concepto de pago...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: Color(0xFF8788A5),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8788A5),
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
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
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
                                      color: Color(0xFF8788A5),
                                      fontWeight: FontWeight.normal,
                                    ),
                                maxLength: 20,
                                validator: _model
                                    .conceptFieldControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 12.0),
                              child: TextFormField(
                                controller: _model.amountFieldController,
                                focusNode: _model.amountFieldFocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Importe',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  hintText: 'Ingresa el importe...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: Color(0xFF8788A5),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF8788A5),
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
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
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
                                      color: Color(0xFF8788A5),
                                      fontWeight: FontWeight.normal,
                                    ),
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                validator: _model.amountFieldControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }

                                  var qrRecordReference =
                                      QrRecord.collection.doc();
                                  await qrRecordReference.set({
                                    ...createQrRecordData(
                                      uid: currentUserUid,
                                      adminId: valueOrDefault(
                                          currentUserDocument?.adminId, ''),
                                      qrId: '',
                                      amount: double.tryParse(
                                          _model.amountFieldController.text),
                                      concept:
                                          _model.conceptFieldController.text,
                                      status: 'PENDIENTE',
                                      qrUrl: '',
                                      voucherUrl: '',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time':
                                            FieldValue.serverTimestamp(),
                                      },
                                    ),
                                  });
                                  _model.createdQR =
                                      QrRecord.getDocumentFromData({
                                    ...createQrRecordData(
                                      uid: currentUserUid,
                                      adminId: valueOrDefault(
                                          currentUserDocument?.adminId, ''),
                                      qrId: '',
                                      amount: double.tryParse(
                                          _model.amountFieldController.text),
                                      concept:
                                          _model.conceptFieldController.text,
                                      status: 'PENDIENTE',
                                      qrUrl: '',
                                      voucherUrl: '',
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'created_time': DateTime.now(),
                                      },
                                    ),
                                  }, qrRecordReference);
                                  _shouldSetState = true;
                                  try {
                                    final result = await FirebaseFunctions
                                        .instance
                                        .httpsCallable('crearMovimientoQR')
                                        .call({
                                      "monto":
                                          _model.amountFieldController.text,
                                      "concepto":
                                          _model.conceptFieldController.text,
                                      "token": FFAppState().serverToken,
                                      "qrId": _model.createdQR?.reference.id,
                                    });
                                    _model.qrCloundFunction =
                                        CrearMovimientoQRCloudFunctionCallResponse(
                                      data: result.data,
                                      succeeded: true,
                                      resultAsString: result.data.toString(),
                                      jsonBody: result.data,
                                    );
                                  } on FirebaseFunctionsException catch (error) {
                                    _model.qrCloundFunction =
                                        CrearMovimientoQRCloudFunctionCallResponse(
                                      errorCode: error.code,
                                      succeeded: false,
                                    );
                                  }

                                  _shouldSetState = true;
                                  if (getJsonField(
                                    _model.qrCloundFunction!.jsonBody,
                                    r'''$.success''',
                                  )) {
                                    await _model.createdQR!.reference
                                        .update(createQrRecordData(
                                      qrUrl: getJsonField(
                                        _model.qrCloundFunction?.jsonBody,
                                        r'''$.data''',
                                      ).toString(),
                                    ));

                                    await QrHistoryRecord.collection.doc().set({
                                      ...createQrHistoryRecordData(
                                        qrId: _model.createdQR?.reference.id,
                                        status: _model.createdQR?.status,
                                        modifiedBy: currentUserUid,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'created_time':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamedAuth(
                                      'OK_FN_Payry_31_detallesdeQR',
                                      context.mounted,
                                      pathParameters: {
                                        'qrDocReference': serializeParam(
                                          _model.createdQR?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    await _model.createdQR!.reference.delete();
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Error'),
                                          content: Text(getJsonField(
                                            _model.qrCloundFunction!.jsonBody,
                                            r'''$.message''',
                                          ).toString()),
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
                                    if (!functions.includeTheString(
                                        getJsonField(
                                          _model.qrCloundFunction!.jsonBody,
                                          r'''$.message''',
                                        ).toString(),
                                        'expirada')!) {
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    GoRouter.of(context).prepareAuthEvent();
                                    await authManager.signOut();
                                    GoRouter.of(context)
                                        .clearRedirectLocation();

                                    context.goNamedAuth(
                                        'OK_FN_Payry_08_iniciasesion',
                                        context.mounted);

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                text: 'Generar QR',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF5E4A98),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: Colors.white,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: EdgeInsets.all(36.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('OK_FN_Payry_29_opcionesQR');
                      },
                      text: 'Consultar QR',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: EdgeInsets.all(0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent4,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend',
                                  color: Color(0xFF5E4A98),
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
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
  }
}
