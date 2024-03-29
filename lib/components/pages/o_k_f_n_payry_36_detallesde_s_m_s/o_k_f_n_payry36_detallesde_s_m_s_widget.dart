import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/components/phone_submit_dialog/phone_submit_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'o_k_f_n_payry36_detallesde_s_m_s_model.dart';
export 'o_k_f_n_payry36_detallesde_s_m_s_model.dart';

class OKFNPayry36DetallesdeSMSWidget extends StatefulWidget {
  const OKFNPayry36DetallesdeSMSWidget({
    super.key,
    required this.registraCobroRef,
    required this.createRefund,
    this.detallesCobroRef,
  });

  final DocumentReference? registraCobroRef;
  final bool? createRefund;
  final DocumentReference? detallesCobroRef;

  @override
  State<OKFNPayry36DetallesdeSMSWidget> createState() =>
      _OKFNPayry36DetallesdeSMSWidgetState();
}

class _OKFNPayry36DetallesdeSMSWidgetState
    extends State<OKFNPayry36DetallesdeSMSWidget> {
  late OKFNPayry36DetallesdeSMSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry36DetallesdeSMSModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<RegistraCobroRecord>(
      stream: RegistraCobroRecord.getDocument(widget.registraCobroRef!),
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
        final oKFNPayry36DetallesdeSMSRegistraCobroRecord = snapshot.data!;
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
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  'Detalles de DiMo®',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              actions: [
                Container(
                  width: 60.0,
                  height: 100.0,
                  decoration: BoxDecoration(),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 18.0),
                child: StreamBuilder<DetallesCobroRecord>(
                  stream:
                      DetallesCobroRecord.getDocument(widget.detallesCobroRef!),
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
                    final columnDetallesCobroRecord = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF965EBE),
                                    Color(0xFF601C80)
                                  ],
                                  stops: [0.0, 1.0],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 40.0, 12.0, 40.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 8.0),
                                          child: Text(
                                            '${formatNumber(
                                              oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                  .amount,
                                              formatType: FormatType.custom,
                                              currency: '\$',
                                              format: '#,##0.00##',
                                              locale: 'es_MX',
                                            )} MXN',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineLarge
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          '${dateTimeFormat(
                                            'd MMM y',
                                            oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                .createdTime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )} a las ${dateTimeFormat(
                                            'h:mm a',
                                            oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                .createdTime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    -1.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Concepto',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                      .concept,
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Número',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                  .phoneNumber,
                                              textAlign: TextAlign.end,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (columnDetallesCobroRecord != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Estatus',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                columnDetallesCobroRecord
                                                    .status!.name,
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (columnDetallesCobroRecord != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'ID rastreo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                columnDetallesCobroRecord
                                                    .idRastreo
                                                    .toString(),
                                                textAlign: TextAlign.end,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (columnDetallesCobroRecord != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Clave rastreo',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  columnDetallesCobroRecord
                                                      .claveRastreo,
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (columnDetallesCobroRecord != null)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (columnDetallesCobroRecord
                                                        .cepRoute !=
                                                    null &&
                                                columnDetallesCobroRecord
                                                        .cepRoute !=
                                                    '')
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await launchURL(
                                                            columnDetallesCobroRecord
                                                                .cepRoute);
                                                      },
                                                      child: Text(
                                                        'https://www.banxico.org.mx/cep/',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: Color(
                                                                      0xFF80BFFF),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .accent4,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 32.0),
                                    child: Wrap(
                                      spacing: 24.0,
                                      runSpacing: 24.0,
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FlutterFlowIconButton(
                                                borderRadius: 100.0,
                                                borderWidth: 0.0,
                                                buttonSize: 50.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .errorRed,
                                                disabledColor:
                                                    Color(0x83CCCCCC),
                                                disabledIconColor:
                                                    Color(0xFFA1A1A1),
                                                icon: Icon(
                                                  FFIcons.kqrUsuario,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                                onPressed: ((columnDetallesCobroRecord
                                                                .status !=
                                                            PaymentStatus
                                                                .PAGADO) ||
                                                        (!widget.createRefund! &&
                                                            !valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isAdmin,
                                                                false)))
                                                    ? null
                                                    : () async {
                                                        var _shouldSetState =
                                                            false;
                                                        var confirmDialogResponse =
                                                            await showDialog<
                                                                    bool>(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (alertDialogContext) {
                                                                    return AlertDialog(
                                                                      title: Text(
                                                                          'Devolver SMS'),
                                                                      content: Text(
                                                                          '¿Estás seguro de querer devolver el monto de este SMS?'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              false),
                                                                          child:
                                                                              Text('No'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              alertDialogContext,
                                                                              true),
                                                                          child:
                                                                              Text('Si'),
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
                                                                        'refund')
                                                                    .call({
                                                              "token": FFAppState()
                                                                  .serverToken,
                                                              "id": widget
                                                                  .detallesCobroRef
                                                                  ?.id,
                                                              "test": false,
                                                            });
                                                            _model.refundCF =
                                                                RefundCloudFunctionCallResponse(
                                                              data: result.data,
                                                              succeeded: true,
                                                              resultAsString:
                                                                  result.data
                                                                      .toString(),
                                                              jsonBody:
                                                                  result.data,
                                                            );
                                                          } on FirebaseFunctionsException catch (error) {
                                                            _model.refundCF =
                                                                RefundCloudFunctionCallResponse(
                                                              errorCode:
                                                                  error.code,
                                                              succeeded: false,
                                                            );
                                                          }

                                                          _shouldSetState =
                                                              true;
                                                          if (getJsonField(
                                                            _model.refundCF!
                                                                .jsonBody,
                                                            r'''$.success''',
                                                          )) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'DiMo® Devulto'),
                                                                  content: Text(
                                                                      'La devolución del DiMo® se ha efectuado con éxito.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Error'),
                                                                  content: Text(
                                                                      'Ha ocurrido un error en ejecución de su solicitud.'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            if (!functions
                                                                .includeTheString(
                                                                    getJsonField(
                                                                      _model
                                                                          .refundCF!
                                                                          .jsonBody,
                                                                      r'''$.message''',
                                                                    ).toString(),
                                                                    'expirada')!) {
                                                              if (_shouldSetState)
                                                                setState(() {});
                                                              return;
                                                            }

                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();
                                                            await authManager
                                                                .signOut();
                                                            GoRouter.of(context)
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
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                              ),
                                            ),
                                            Text(
                                              'Devolver DiMo®',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 100.0,
                                              borderWidth: 0.0,
                                              buttonSize: 50.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                              disabledColor: Color(0x83CCCCCC),
                                              disabledIconColor:
                                                  Color(0xFFA1A1A1),
                                              icon: Icon(
                                                FFIcons.ksms,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 24.0,
                                              ),
                                              showLoadingIndicator: true,
                                              onPressed:
                                                  (columnDetallesCobroRecord
                                                              .status ==
                                                          PaymentStatus
                                                              .CANCELADO)
                                                      ? null
                                                      : () async {
                                                          var _shouldSetState =
                                                              false;
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            '¿Estás seguro?'),
                                                                        content:
                                                                            Text('¿Estás seguro de querer reenviar este DiMo®?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancelar'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Aceptar'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
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
                                                                amount:
                                                                    oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                        .amount,
                                                                concept:
                                                                    oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                        .concept,
                                                                phoneNumber:
                                                                    oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                        .phoneNumber,
                                                                uid:
                                                                    currentUserUid,
                                                                companyId: '',
                                                                errorMessage:
                                                                    '',
                                                                errorOcurs:
                                                                    false,
                                                                status:
                                                                    PaymentStatus
                                                                        .PENDIENTE,
                                                                type:
                                                                    PaymentType
                                                                        .SMS,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'created_time':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            _model.dimoResp =
                                                                RegistraCobroRecord
                                                                    .getDocumentFromData({
                                                              ...createRegistraCobroRecordData(
                                                                adminId: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.adminId,
                                                                    ''),
                                                                amount:
                                                                    oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                        .amount,
                                                                concept:
                                                                    oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                        .concept,
                                                                phoneNumber:
                                                                    oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                        .phoneNumber,
                                                                uid:
                                                                    currentUserUid,
                                                                companyId: '',
                                                                errorMessage:
                                                                    '',
                                                                errorOcurs:
                                                                    false,
                                                                status:
                                                                    PaymentStatus
                                                                        .PENDIENTE,
                                                                type:
                                                                    PaymentType
                                                                        .SMS,
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
                                                            try {
                                                              final result =
                                                                  await FirebaseFunctions
                                                                      .instance
                                                                      .httpsCallable(
                                                                          'generateDimo')
                                                                      .call({
                                                                "id": _model
                                                                    .dimoResp!
                                                                    .reference
                                                                    .id,
                                                                "test": false,
                                                                "token":
                                                                    FFAppState()
                                                                        .serverToken,
                                                              });
                                                              _model.dimoCF =
                                                                  GenerateDimoCloudFunctionCallResponse(
                                                                data:
                                                                    result.data,
                                                                succeeded: true,
                                                                resultAsString:
                                                                    result.data
                                                                        .toString(),
                                                                jsonBody:
                                                                    result.data,
                                                              );
                                                            } on FirebaseFunctionsException catch (error) {
                                                              _model.dimoCF =
                                                                  GenerateDimoCloudFunctionCallResponse(
                                                                errorCode:
                                                                    error.code,
                                                                succeeded:
                                                                    false,
                                                              );
                                                            }

                                                            _shouldSetState =
                                                                true;
                                                            if (getJsonField(
                                                              _model.dimoCF!
                                                                  .jsonBody,
                                                              r'''$.success''',
                                                            )) {
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Completado'),
                                                                    content: Text(
                                                                        'El DiMo® se ha generado con éxito.'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              if (Navigator.of(
                                                                      context)
                                                                  .canPop()) {
                                                                context.pop();
                                                              }
                                                              context
                                                                  .pushNamedAuth(
                                                                'OK_FN_Payry_36_detallesdeSMSCode',
                                                                context.mounted,
                                                                queryParameters:
                                                                    {
                                                                  'registraCobroRef':
                                                                      serializeParam(
                                                                    _model
                                                                        .dimoResp
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
                                                                  .dimoResp!
                                                                  .reference
                                                                  .delete();
                                                              await showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Error'),
                                                                    content: Text(
                                                                        getJsonField(
                                                                      _model
                                                                          .dimoCF!
                                                                          .jsonBody,
                                                                      r'''$.message''',
                                                                    ).toString()),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                        child: Text(
                                                                            'Ok'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                              if (!functions.includeTheString(
                                                                  getJsonField(
                                                                    _model
                                                                        .dimoCF!
                                                                        .jsonBody,
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
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                        },
                                            ),
                                            Text(
                                              'Reenviar DiMo®',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 5.0)),
                                        ),
                                        StreamBuilder<CompaniesRecord>(
                                          stream: CompaniesRecord.getDocument(
                                              functions.jsonPathToCompanyRef(
                                                  columnDetallesCobroRecord
                                                      .companyId)!),
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
                                            final columnCompaniesRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 100.0,
                                                    borderWidth: 0.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent3,
                                                    disabledColor:
                                                        Color(0x83CCCCCC),
                                                    disabledIconColor:
                                                        Color(0xFFA1A1A1),
                                                    icon: Icon(
                                                      FFIcons.kcompartir,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 20.0,
                                                    ),
                                                    showLoadingIndicator: true,
                                                    onPressed:
                                                        (columnDetallesCobroRecord
                                                                    .status !=
                                                                PaymentStatus
                                                                    .PAGADO)
                                                            ? null
                                                            : () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Compartir Recibo'),
                                                                              content: Text('¿Deseas compartir este recibo al número \"${oKFNPayry36DetallesdeSMSRegistraCobroRecord.phoneNumber}\"?'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: Text('Otro'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: Text('Confirmar'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  if (isiOS) {
                                                                    await launchUrl(
                                                                        Uri.parse(
                                                                            "sms:${oKFNPayry36DetallesdeSMSRegistraCobroRecord.phoneNumber}&body=${Uri.encodeComponent('Revisa tu recibo de ${columnCompaniesRecord.alias}: https://www.payry.mx/rdp/?id=${columnDetallesCobroRecord.reference.id}')}"));
                                                                  } else {
                                                                    await launchUrl(
                                                                        Uri(
                                                                      scheme:
                                                                          'sms',
                                                                      path: oKFNPayry36DetallesdeSMSRegistraCobroRecord
                                                                          .phoneNumber,
                                                                      queryParameters: <String,
                                                                          String>{
                                                                        'body':
                                                                            'Revisa tu recibo de ${columnCompaniesRecord.alias}: https://www.payry.mx/rdp/?id=${columnDetallesCobroRecord.reference.id}',
                                                                      },
                                                                    ));
                                                                  }

                                                                  try {
                                                                    final result = await FirebaseFunctions
                                                                        .instance
                                                                        .httpsCallable(
                                                                            'sendSms')
                                                                        .call({
                                                                      "token":
                                                                          FFAppState()
                                                                              .serverToken,
                                                                      "phoneNumber":
                                                                          '+52${oKFNPayry36DetallesdeSMSRegistraCobroRecord.phoneNumber}',
                                                                      "message":
                                                                          'Revisa tu recibo de ${columnCompaniesRecord.alias}: https://www.payry.mx/rdp/?id=${columnDetallesCobroRecord.reference.id}',
                                                                      "test":
                                                                          false,
                                                                    });
                                                                    _model.smsResp =
                                                                        SendSmsCloudFunctionCallResponse(
                                                                      data: result
                                                                          .data,
                                                                      succeeded:
                                                                          true,
                                                                      resultAsString: result
                                                                          .data
                                                                          .toString(),
                                                                      jsonBody:
                                                                          result
                                                                              .data,
                                                                    );
                                                                  } on FirebaseFunctionsException catch (error) {
                                                                    _model.smsResp =
                                                                        SendSmsCloudFunctionCallResponse(
                                                                      errorCode:
                                                                          error
                                                                              .code,
                                                                      succeeded:
                                                                          false,
                                                                    );
                                                                  }

                                                                  _shouldSetState =
                                                                      true;
                                                                  if (getJsonField(
                                                                    _model
                                                                        .smsResp!
                                                                        .jsonBody,
                                                                    r'''$.success''',
                                                                  )) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('SMS enviado'),
                                                                          content:
                                                                              Text('Se ha compartido el recibo a través de un SMS de manera exitosa.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              Text('Error'),
                                                                          content:
                                                                              Text(getJsonField(
                                                                            _model.smsResp!.jsonBody,
                                                                            r'''$.message''',
                                                                          ).toString()),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (!functions.includeTheString(
                                                                        getJsonField(
                                                                          _model
                                                                              .smsResp!
                                                                              .jsonBody,
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
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }
                                                                } else {
                                                                  await showDialog(
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
                                                                                MediaQuery.sizeOf(context).height * 0.35,
                                                                            child:
                                                                                PhoneSubmitDialogWidget(
                                                                              companyAlias: columnCompaniesRecord.alias,
                                                                              paymentId: columnDetallesCobroRecord.reference.id,
                                                                              dismissAction: () async {
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

                                                                if (_shouldSetState)
                                                                  setState(
                                                                      () {});
                                                              },
                                                  ),
                                                ),
                                                Text(
                                                  'Compartir recibo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(height: 5.0)),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
