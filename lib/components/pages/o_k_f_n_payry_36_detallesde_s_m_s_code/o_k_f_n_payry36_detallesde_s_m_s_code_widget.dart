import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry36_detallesde_s_m_s_code_model.dart';
export 'o_k_f_n_payry36_detallesde_s_m_s_code_model.dart';

class OKFNPayry36DetallesdeSMSCodeWidget extends StatefulWidget {
  const OKFNPayry36DetallesdeSMSCodeWidget({
    super.key,
    required this.registraCobroRef,
    required this.createRefund,
  });

  final DocumentReference? registraCobroRef;
  final bool? createRefund;

  @override
  State<OKFNPayry36DetallesdeSMSCodeWidget> createState() =>
      _OKFNPayry36DetallesdeSMSCodeWidgetState();
}

class _OKFNPayry36DetallesdeSMSCodeWidgetState
    extends State<OKFNPayry36DetallesdeSMSCodeWidget> {
  late OKFNPayry36DetallesdeSMSCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry36DetallesdeSMSCodeModel());
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
        final oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord = snapshot.data!;
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF965EBE), Color(0xFF601C80)],
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 8.0),
                                      child: Text(
                                        '${formatNumber(
                                          oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord
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
                                            ),
                                      ),
                                    ),
                                    Text(
                                      '${dateTimeFormat(
                                        'd MMM y',
                                        oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord
                                            .createdTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} a las ${dateTimeFormat(
                                        'h:mm a',
                                        oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord
                                            .createdTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Colors.white,
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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, -1.0),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Concepto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord
                                                  .concept,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord
                                              .phoneNumber,
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        'Estatus',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          oKFNPayry36DetallesdeSMSCodeRegistraCobroRecord
                                              .status!.name,
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 16.0, 20.0, 32.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderRadius: 100.0,
                                    borderWidth: 0.0,
                                    buttonSize: 60.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).errorRed,
                                    disabledColor: Color(0x83CCCCCC),
                                    disabledIconColor: Color(0xFFA1A1A1),
                                    icon: Icon(
                                      FFIcons.kqrUsuario,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                    onPressed: true
                                        ? null
                                        : () {
                                            print('IconButton pressed ...');
                                          },
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Devolver DiMo®',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ].divide(SizedBox(height: 5.0)),
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
          ),
        );
      },
    );
  }
}
