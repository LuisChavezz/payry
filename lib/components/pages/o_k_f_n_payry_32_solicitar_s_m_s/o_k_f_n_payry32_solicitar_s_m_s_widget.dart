import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry32_solicitar_s_m_s_model.dart';
export 'o_k_f_n_payry32_solicitar_s_m_s_model.dart';

class OKFNPayry32SolicitarSMSWidget extends StatefulWidget {
  const OKFNPayry32SolicitarSMSWidget({Key? key}) : super(key: key);

  @override
  _OKFNPayry32SolicitarSMSWidgetState createState() =>
      _OKFNPayry32SolicitarSMSWidgetState();
}

class _OKFNPayry32SolicitarSMSWidgetState
    extends State<OKFNPayry32SolicitarSMSWidget> {
  late OKFNPayry32SolicitarSMSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry32SolicitarSMSModel());

    _model.phoneFieldController ??= TextEditingController();
    _model.phoneFieldFocusNode ??= FocusNode();

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
            'Solicitar pago con SMS',
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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Opacity(
                                          opacity: 0.8,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/mx_flag.png',
                                              width: 35.0,
                                              height: 23.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 6.0, 0.0, 0.0),
                                          child: Text(
                                            '+52',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 10.0, 12.0),
                                        child: TextFormField(
                                          controller:
                                              _model.phoneFieldController,
                                          focusNode: _model.phoneFieldFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Celular',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Ingresa tu celular...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF8788A5),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 20.0, 24.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          keyboardType: TextInputType.phone,
                                          validator: _model
                                              .phoneFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
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
                                        color: Color(0xFF8788A5),
                                        fontWeight: FontWeight.normal,
                                      ),
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
                                        color: Color(0xFF8788A5),
                                        fontWeight: FontWeight.normal,
                                      ),
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  validator: _model
                                      .amountFieldControllerValidator
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
                                    try {
                                      final result = await FirebaseFunctions
                                          .instance
                                          .httpsCallable('crearMovimientoSMS')
                                          .call({
                                        "monto":
                                            _model.amountFieldController.text,
                                        "concepto":
                                            _model.conceptFieldController.text,
                                        "token": FFAppState().serverToken,
                                        "celularcliente":
                                            _model.phoneFieldController.text,
                                      });
                                      _model.smsCloudFunction =
                                          CrearMovimientoSMSCloudFunctionCallResponse(
                                        data: result.data,
                                        succeeded: true,
                                        resultAsString: result.data.toString(),
                                        jsonBody: result.data,
                                      );
                                    } on FirebaseFunctionsException catch (error) {
                                      _model.smsCloudFunction =
                                          CrearMovimientoSMSCloudFunctionCallResponse(
                                        errorCode: error.code,
                                        succeeded: false,
                                      );
                                    }

                                    _shouldSetState = true;
                                    if (_model.smsCloudFunction!.succeeded!) {
                                      var smsRecordReference =
                                          SmsRecord.collection.doc();
                                      await smsRecordReference.set({
                                        ...createSmsRecordData(
                                          uid: currentUserUid,
                                          adminId: valueOrDefault(
                                              currentUserDocument?.adminId, ''),
                                          smsId: '',
                                          amount: double.tryParse(_model
                                              .amountFieldController.text),
                                          concept: _model
                                              .conceptFieldController.text,
                                          status: 'PENDIENTE',
                                          voucherUrl: '',
                                          phoneNumber:
                                              _model.phoneFieldController.text,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time':
                                                FieldValue.serverTimestamp(),
                                          },
                                        ),
                                      });
                                      _model.createdSms =
                                          SmsRecord.getDocumentFromData({
                                        ...createSmsRecordData(
                                          uid: currentUserUid,
                                          adminId: valueOrDefault(
                                              currentUserDocument?.adminId, ''),
                                          smsId: '',
                                          amount: double.tryParse(_model
                                              .amountFieldController.text),
                                          concept: _model
                                              .conceptFieldController.text,
                                          status: 'PENDIENTE',
                                          voucherUrl: '',
                                          phoneNumber:
                                              _model.phoneFieldController.text,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'created_time': DateTime.now(),
                                          },
                                        ),
                                      }, smsRecordReference);
                                      _shouldSetState = true;

                                      await SmsHistoryRecord.collection
                                          .doc()
                                          .set({
                                        ...createSmsHistoryRecordData(
                                          smsId:
                                              _model.createdSms?.reference.id,
                                          status: _model.createdSms?.status,
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
                                      context.pushNamed(
                                        'OK_FN_Payry_36_detallesdeSMS',
                                        queryParameters: {
                                          'smsDocReference': serializeParam(
                                            _model.createdSms?.reference,
                                            ParamType.DocumentReference,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'FALSE',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      if (_shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  text: 'Solicitar Pago con SMS',
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
                ),
                Padding(
                  padding: EdgeInsets.all(40.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('OK_FN_Payry_34_opcionesSMS');
                    },
                    text: 'Más opciones de SMS',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 10.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
