import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'o_k_f_n_payry35_historial_s_m_s_model.dart';
export 'o_k_f_n_payry35_historial_s_m_s_model.dart';

class OKFNPayry35HistorialSMSWidget extends StatefulWidget {
  const OKFNPayry35HistorialSMSWidget({
    super.key,
    required this.readAll,
    required this.createRefund,
  });

  final bool? readAll;
  final bool? createRefund;

  @override
  State<OKFNPayry35HistorialSMSWidget> createState() =>
      _OKFNPayry35HistorialSMSWidgetState();
}

class _OKFNPayry35HistorialSMSWidgetState
    extends State<OKFNPayry35HistorialSMSWidget> {
  late OKFNPayry35HistorialSMSModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry35HistorialSMSModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().isSearch = false;
    });

    _model.searchFieldController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();
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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<SmsRecord>>(
        stream: querySmsRecord(
          queryBuilder: (smsRecord) => smsRecord
              .where(
                'admin_id',
                isEqualTo: valueOrDefault(currentUserDocument?.adminId, ''),
              )
              .where(
                'uid',
                isEqualTo: widget.readAll! ||
                        valueOrDefault<bool>(
                            currentUserDocument?.isAdmin, false)
                    ? null
                    : currentUserUid,
              )
              .orderBy('created_time', descending: true),
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
          List<SmsRecord> oKFNPayry35HistorialSMSSmsRecordList = snapshot.data!;
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
                  'Historial de SMS',
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
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Buscar concepto de SMS',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                  ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.searchFieldController,
                                      focusNode: _model.searchFieldFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.searchFieldController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          if (_model.searchFieldController
                                                      .text ==
                                                  null ||
                                              _model.searchFieldController
                                                      .text ==
                                                  '') {
                                            setState(() {
                                              FFAppState().isSearch = false;
                                            });
                                            return;
                                          } else {
                                            return;
                                          }
                                        },
                                      ),
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Buscar...',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF8788A5),
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF8788A5),
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                          ),
                                      validator: _model
                                          .searchFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      safeSetState(() {
                                        _model.simpleSearchResults = TextSearch(
                                          oKFNPayry35HistorialSMSSmsRecordList
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record,
                                                        [record.concept!]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model
                                                .searchFieldController.text)
                                            .map((r) => r.object)
                                            .toList();
                                        ;
                                      });
                                      if (_model.searchFieldController.text !=
                                              null &&
                                          _model.searchFieldController.text !=
                                              '') {
                                        FFAppState().isSearch = true;
                                        return;
                                      } else {
                                        FFAppState().isSearch = false;
                                        return;
                                      }
                                    },
                                    child: Icon(
                                      Icons.search_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 28.0,
                                    ),
                                  ),
                                  if (FFAppState().isSearch)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          6.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _model.searchFieldController?.text =
                                                '';
                                          });
                                          setState(() {
                                            FFAppState().isSearch = false;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 28.0,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!FFAppState().isSearch)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final smsItem1 =
                                        oKFNPayry35HistorialSMSSmsRecordList
                                            .toList();
                                    if (smsItem1.isEmpty) {
                                      return Container(
                                        height: 100.0,
                                        child: EmptyListWidget(
                                          title: 'No hay SMS\'s',
                                          message:
                                              'Aun no hay transacciones por SMS',
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: smsItem1.length,
                                      itemBuilder: (context, smsItem1Index) {
                                        final smsItem1Item =
                                            smsItem1[smsItem1Index];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 18.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'OK_FN_Payry_36_detallesdeSMS',
                                                pathParameters: {
                                                  'smsDocReference':
                                                      serializeParam(
                                                    smsItem1Item.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                queryParameters: {
                                                  'createRefund':
                                                      serializeParam(
                                                    widget.createRefund,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'd MMM, y',
                                                      smsItem1Item.createdTime!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            FFIcons.ksms,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                smsItem1Item
                                                                    .concept
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 25,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                              Text(
                                                                smsItem1Item
                                                                    .status,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        smsItem1Item.amount,
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: '',
                                                        format: '#,##0.00##',
                                                        locale: 'es_MX',
                                                      ),
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            if (FFAppState().isSearch)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final smsItem2 =
                                        _model.simpleSearchResults.toList();
                                    if (smsItem2.isEmpty) {
                                      return Container(
                                        height: 100.0,
                                        child: EmptyListWidget(
                                          title: 'No hay SMS\'s',
                                          message:
                                              'No hubo resultados de tu búsqueda',
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: smsItem2.length,
                                      itemBuilder: (context, smsItem2Index) {
                                        final smsItem2Item =
                                            smsItem2[smsItem2Index];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 18.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'OK_FN_Payry_36_detallesdeSMS',
                                                pathParameters: {
                                                  'smsDocReference':
                                                      serializeParam(
                                                    smsItem2Item.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                                queryParameters: {
                                                  'createRefund':
                                                      serializeParam(
                                                    widget.createRefund,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 8.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                      'd MMM, y',
                                                      smsItem2Item.createdTime!,
                                                      locale:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .languageCode,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 40.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            FFIcons.ksms,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .accent3,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                smsItem2Item
                                                                    .concept
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 25,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                    ),
                                                              ),
                                                              Text(
                                                                smsItem2Item
                                                                    .status,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent3,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      formatNumber(
                                                        smsItem2Item.amount,
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: '',
                                                        format: '#,##0.00##',
                                                        locale: 'es_MX',
                                                      ),
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                          ],
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
