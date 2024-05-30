import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/components/phone_submit_dialog/phone_submit_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry31_detallesde_q_r_model.dart';
export 'o_k_f_n_payry31_detallesde_q_r_model.dart';

class OKFNPayry31DetallesdeQRWidget extends StatefulWidget {
  const OKFNPayry31DetallesdeQRWidget({
    super.key,
    required this.registraCobroRef,
    required this.createRefund,
    this.detallesCobroRef,
  });

  final DocumentReference? registraCobroRef;
  final bool? createRefund;
  final DocumentReference? detallesCobroRef;

  @override
  State<OKFNPayry31DetallesdeQRWidget> createState() =>
      _OKFNPayry31DetallesdeQRWidgetState();
}

class _OKFNPayry31DetallesdeQRWidgetState
    extends State<OKFNPayry31DetallesdeQRWidget> {
  late OKFNPayry31DetallesdeQRModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry31DetallesdeQRModel());
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
        final oKFNPayry31DetallesdeQRRegistraCobroRecord = snapshot.data!;
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
                  'Detalles de CoDi®',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
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
                  final containerDetallesCobroRecord = snapshot.data!;
                  return Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 18.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
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
                                                oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                    .amount,
                                                formatType: FormatType.custom,
                                                currency: '\$',
                                                format: '#,##0.00##',
                                                locale: 'es_MX',
                                              )} MXN',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                              oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                  .createdTime,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )} a las ${dateTimeFormat(
                                              'h:mm a',
                                              oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                  .createdTime,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
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
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0),
                                  bottomRight: Radius.circular(16.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Concepto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                            .concept,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Nombre',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        containerDetallesCobroRecord
                                                            .nombreBeneficiarioDevolucion,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (containerDetallesCobroRecord
                                                    .hasSucursalId() &&
                                                (containerDetallesCobroRecord
                                                            .sucursalId !=
                                                        null &&
                                                    containerDetallesCobroRecord
                                                            .sucursalId !=
                                                        ''))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sucursal',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                              .sucursalName,
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (containerDetallesCobroRecord !=
                                                null)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Estatus',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        containerDetallesCobroRecord
                                                            .status!.name,
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (containerDetallesCobroRecord !=
                                                null)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'ID rastreo',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        containerDetallesCobroRecord
                                                            .idRastreo
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (containerDetallesCobroRecord !=
                                                null)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Clave rastreo',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmall
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          containerDetallesCobroRecord
                                                              .claveRastreo,
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent3,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await launchURL(
                                                      containerDetallesCobroRecord
                                                          .cepRoute);
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (containerDetallesCobroRecord
                                                                .cepRoute !=
                                                            null &&
                                                        containerDetallesCobroRecord
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
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await launchURL(
                                                                    containerDetallesCobroRecord
                                                                        .cepRoute);
                                                              },
                                                              child: Text(
                                                                'https://www.banxico.org.mx/cep/',
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                style: FlutterFlowTheme.of(
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (!_model.isUpdating)
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                  .qrUrl,
                                              width: 300.0,
                                              height: 300.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      if (_model.isUpdating)
                                        Lottie.asset(
                                          'assets/lottie_animations/Animation_-_1705530950682.json',
                                          width: 301.0,
                                          height: 194.0,
                                          fit: BoxFit.cover,
                                          animate: true,
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 20.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderRadius: 100.0,
                                                borderWidth: 0.0,
                                                buttonSize: 50.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                icon: Icon(
                                                  FFIcons.kcompartir,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 20.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  await actions.shareImage(
                                                    functions.imagePathToString(
                                                        oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                            .shareableQrUrl)!,
                                                  );
                                                },
                                              ),
                                              Text(
                                                'Compartir',
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
                                                borderRadius: 100.0,
                                                borderWidth: 0.0,
                                                buttonSize: 50.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                icon: Icon(
                                                  Icons.file_download_outlined,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 30.0,
                                                ),
                                                showLoadingIndicator: true,
                                                onPressed: () async {
                                                  await launchURL(functions
                                                      .imagePathToString(
                                                          oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                              .qrUrl)!);
                                                },
                                              ),
                                              Text(
                                                'Descargar',
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
                                          if (false)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      AuthUserStreamWidget(
                                                    builder: (context) =>
                                                        FlutterFlowIconButton(
                                                      borderRadius: 100.0,
                                                      borderWidth: 0.0,
                                                      buttonSize: 50.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                      showLoadingIndicator:
                                                          true,
                                                      onPressed: ((containerDetallesCobroRecord
                                                                      .status !=
                                                                  PaymentStatus
                                                                      .PAGADO) ||
                                                              (!widget.createRefund! &&
                                                                  !valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isAdmin,
                                                                      false)) ||
                                                              !functions.isSameDate(
                                                                  containerDetallesCobroRecord
                                                                      .createdTime!))
                                                          ? null
                                                          : () async {
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
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.3,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.9,
                                                                        child:
                                                                            CustomConfirmDialogWidget(
                                                                          title:
                                                                              'Devolver CoDi®',
                                                                          description:
                                                                              '¿Estás seguro de querer devolver el monto de este CoDi®?',
                                                                          buttonText:
                                                                              'Confirmar',
                                                                          showDismissButton:
                                                                              true,
                                                                          dismissAction:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          mainAction:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;
                                                                            _model.refundAC =
                                                                                await StpGroup.refundCall.call(
                                                                              token: FFAppState().serverToken,
                                                                              id: widget.detallesCobroRef?.id,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (getJsonField(
                                                                              (_model.refundAC?.jsonBody ?? ''),
                                                                              r'''$.success''',
                                                                            )) {
                                                                              Navigator.pop(context);
                                                                              await showDialog(
                                                                                barrierDismissible: false,
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.25,
                                                                                        width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                        child: CustomConfirmDialogWidget(
                                                                                          title: 'CoDi® Devuelto',
                                                                                          description: 'La devolución del CoDi® se ha efectuado con éxito.',
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

                                                                              return;
                                                                            } else {
                                                                              Navigator.pop(context);
                                                                              await showDialog(
                                                                                barrierDismissible: false,
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.25,
                                                                                        width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                        child: CustomConfirmDialogWidget(
                                                                                          title: 'Error',
                                                                                          description: getJsonField(
                                                                                            (_model.refundAC?.jsonBody ?? ''),
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

                                                                              if (!functions.includeTheString(
                                                                                  getJsonField(
                                                                                    (_model.refundAC?.jsonBody ?? ''),
                                                                                    r'''$.message''',
                                                                                  ).toString(),
                                                                                  'expirada')!) {
                                                                                return;
                                                                              }

                                                                              context.goNamedAuth('OK_FN_Payry_08_iniciasesion', context.mounted);

                                                                              return;
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              setState(() {});
                                                            },
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Devolver CoDi®',
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
                                            ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) =>
                                                    FlutterFlowIconButton(
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
                                                    FFIcons.kqr,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 24.0,
                                                  ),
                                                  showLoadingIndicator: true,
                                                  onPressed:
                                                      (oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                                  .status ==
                                                              PaymentStatus
                                                                  .CANCELADO)
                                                          ? null
                                                          : () async {
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
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.3,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.9,
                                                                        child:
                                                                            CustomConfirmDialogWidget(
                                                                          title:
                                                                              'Regenerar CoDi®',
                                                                          description:
                                                                              '¿Estás seguro de querer regenerar el CoDi®?',
                                                                          buttonText:
                                                                              'Confirmar',
                                                                          showDismissButton:
                                                                              true,
                                                                          dismissAction:
                                                                              () async {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          mainAction:
                                                                              () async {
                                                                            var _shouldSetState =
                                                                                false;

                                                                            var registraCobroRecordReference =
                                                                                RegistraCobroRecord.collection.doc();
                                                                            await registraCobroRecordReference.set({
                                                                              ...createRegistraCobroRecordData(
                                                                                adminId: valueOrDefault(currentUserDocument?.adminId, ''),
                                                                                amount: oKFNPayry31DetallesdeQRRegistraCobroRecord.amount,
                                                                                concept: oKFNPayry31DetallesdeQRRegistraCobroRecord.concept,
                                                                                uid: currentUserUid,
                                                                                qrUrl: '',
                                                                                shareableQrUrl: '',
                                                                                companyId: '',
                                                                                errorMessage: '',
                                                                                errorOcurs: false,
                                                                                numeroReferenciaComercio: null,
                                                                                type: PaymentType.QR,
                                                                                status: PaymentStatus.PENDIENTE,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'created_time': FieldValue.serverTimestamp(),
                                                                                },
                                                                              ),
                                                                            });
                                                                            _model.codiResp =
                                                                                RegistraCobroRecord.getDocumentFromData({
                                                                              ...createRegistraCobroRecordData(
                                                                                adminId: valueOrDefault(currentUserDocument?.adminId, ''),
                                                                                amount: oKFNPayry31DetallesdeQRRegistraCobroRecord.amount,
                                                                                concept: oKFNPayry31DetallesdeQRRegistraCobroRecord.concept,
                                                                                uid: currentUserUid,
                                                                                qrUrl: '',
                                                                                shareableQrUrl: '',
                                                                                companyId: '',
                                                                                errorMessage: '',
                                                                                errorOcurs: false,
                                                                                numeroReferenciaComercio: null,
                                                                                type: PaymentType.QR,
                                                                                status: PaymentStatus.PENDIENTE,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'created_time': DateTime.now(),
                                                                                },
                                                                              ),
                                                                            }, registraCobroRecordReference);
                                                                            _shouldSetState =
                                                                                true;
                                                                            _model.codiAC =
                                                                                await StpGroup.generateCodiCall.call(
                                                                              id: _model.codiResp?.reference.id,
                                                                              token: FFAppState().serverToken,
                                                                            );
                                                                            _shouldSetState =
                                                                                true;
                                                                            if (getJsonField(
                                                                              (_model.codiAC?.jsonBody ?? ''),
                                                                              r'''$.success''',
                                                                            )) {
                                                                              if (Navigator.of(context).canPop()) {
                                                                                context.pop();
                                                                              }
                                                                              context.pushNamedAuth(
                                                                                'OK_FN_Payry_31_detallesdeQRCode',
                                                                                context.mounted,
                                                                                queryParameters: {
                                                                                  'registraCobroRef': serializeParam(
                                                                                    _model.codiResp?.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                  'createRefund': serializeParam(
                                                                                    false,
                                                                                    ParamType.bool,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              return;
                                                                            } else {
                                                                              await _model.codiResp!.reference.delete();
                                                                              Navigator.pop(context);
                                                                              await showDialog(
                                                                                barrierDismissible: false,
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.25,
                                                                                        width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                        child: CustomConfirmDialogWidget(
                                                                                          title: 'Error',
                                                                                          description: getJsonField(
                                                                                            (_model.codiAC?.jsonBody ?? ''),
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

                                                                              if (!functions.includeTheString(
                                                                                  getJsonField(
                                                                                    (_model.codiAC?.jsonBody ?? ''),
                                                                                    r'''$.message''',
                                                                                  ).toString(),
                                                                                  'expirada')!) {
                                                                                return;
                                                                              }

                                                                              context.goNamedAuth('OK_FN_Payry_08_iniciasesion', context.mounted);

                                                                              return;
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  setState(
                                                                      () {}));

                                                              setState(() {});
                                                            },
                                                ),
                                              ),
                                              Text(
                                                'Regenerar CoDi®',
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
                                                    containerDetallesCobroRecord
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
                                              final containerCompaniesRecord =
                                                  snapshot.data!;
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) =>
                                                          FlutterFlowIconButton(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed:
                                                            (oKFNPayry31DetallesdeQRRegistraCobroRecord
                                                                        .status !=
                                                                    PaymentStatus
                                                                        .PAGADO)
                                                                ? null
                                                                : () async {
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
                                                                              height: MediaQuery.sizeOf(context).height * 0.35,
                                                                              child: PhoneSubmitDialogWidget(
                                                                                companyAlias: containerCompaniesRecord.alias,
                                                                                paymentId: widget.detallesCobroRef!.id,
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
                                                                  },
                                                      ),
                                                    ),
                                                    Text(
                                                      'Compartir recibo',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Lexend',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 5.0)),
                                                ),
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
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
