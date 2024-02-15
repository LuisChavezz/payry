import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry31_detallesde_q_r_model.dart';
export 'o_k_f_n_payry31_detallesde_q_r_model.dart';

class OKFNPayry31DetallesdeQRWidget extends StatefulWidget {
  const OKFNPayry31DetallesdeQRWidget({
    super.key,
    required this.qrDocReference,
    required this.createRefund,
  });

  final DocumentReference? qrDocReference;
  final bool? createRefund;

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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<QrRecord>(
      stream: QrRecord.getDocument(widget.qrDocReference!),
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
        final oKFNPayry31DetallesdeQRQrRecord = snapshot.data!;
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
                  'Detalles de QR',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
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
                                          oKFNPayry31DetallesdeQRQrRecord
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
                                        oKFNPayry31DetallesdeQRQrRecord
                                            .createdTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} a las ${dateTimeFormat(
                                        'h:mm a',
                                        oKFNPayry31DetallesdeQRQrRecord
                                            .createdTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Colors.white,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
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
                                              'Concepto',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  oKFNPayry31DetallesdeQRQrRecord
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
                                                      ),
                                            ),
                                            Text(
                                              oKFNPayry31DetallesdeQRQrRecord
                                                  .status,
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!_model.isUpdating)
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        oKFNPayry31DetallesdeQRQrRecord.qrUrl,
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
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 20.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: () async {
                                            await actions.shareImage(
                                              functions.imagePathToString(
                                                  oKFNPayry31DetallesdeQRQrRecord
                                                      .qrUrl)!,
                                            );
                                          },
                                        ),
                                        Text(
                                          'Compartir',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 14.0,
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 30.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: () async {
                                            await launchURL(
                                                functions.imagePathToString(
                                                    oKFNPayry31DetallesdeQRQrRecord
                                                        .qrUrl)!);
                                          },
                                        ),
                                        Text(
                                          'Descargar',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 14.0,
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
                                          disabledColor: Color(0x83CCCCCC),
                                          disabledIconColor: Color(0xFFA1A1A1),
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 30.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed:
                                              (oKFNPayry31DetallesdeQRQrRecord
                                                          .status !=
                                                      'PENDIENTE')
                                                  ? null
                                                  : () async {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Cancelar QR'),
                                                                    content: Text(
                                                                        '¿Estás seguro de querer cancelar este QR?'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            'No'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            'Si'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        await oKFNPayry31DetallesdeQRQrRecord
                                                            .reference
                                                            .update(
                                                                createQrRecordData(
                                                          status: 'CANCELADO',
                                                        ));

                                                        await QrHistoryRecord
                                                            .collection
                                                            .doc()
                                                            .set({
                                                          ...createQrHistoryRecordData(
                                                            qrId:
                                                                oKFNPayry31DetallesdeQRQrRecord
                                                                    .reference
                                                                    .id,
                                                            status: 'CANCELADO',
                                                            modifiedBy:
                                                                currentUserUid,
                                                          ),
                                                          ...mapToFirestore(
                                                            {
                                                              'created_time':
                                                                  FieldValue
                                                                      .serverTimestamp(),
                                                            },
                                                          ),
                                                        });
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'QR cancelado'),
                                                              content: Text(
                                                                  'El QR ha sido cancelado con éxito.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        return;
                                                      } else {
                                                        return;
                                                      }
                                                    },
                                        ),
                                        Text(
                                          'Cancelar',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 5.0)),
                                    ),
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
                                            disabledColor: Color(0x83CCCCCC),
                                            disabledIconColor:
                                                Color(0xFFA1A1A1),
                                            icon: Icon(
                                              FFIcons.kqrUsuario,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed:
                                                ((oKFNPayry31DetallesdeQRQrRecord
                                                                .status !=
                                                            'PAGADO') ||
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
                                                                          'Devolver QR'),
                                                                      content: Text(
                                                                          '¿Estás seguro de querer devolver el monto de este QR?'),
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
                                                              "id":
                                                                  oKFNPayry31DetallesdeQRQrRecord
                                                                      .reference
                                                                      .id,
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
                                                            await QrHistoryRecord
                                                                .collection
                                                                .doc()
                                                                .set({
                                                              ...createQrHistoryRecordData(
                                                                qrId: oKFNPayry31DetallesdeQRQrRecord
                                                                    .reference
                                                                    .id,
                                                                status:
                                                                    'DEVUELTO',
                                                                modifiedBy:
                                                                    currentUserUid,
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'created_time':
                                                                      FieldValue
                                                                          .serverTimestamp(),
                                                                },
                                                              ),
                                                            });
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'QR Devulto'),
                                                                  content: Text(
                                                                      'La devolución del QR se ha efectuado con éxito.'),
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
                                          'Devolver QR',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 14.0,
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
                                          disabledColor: Color(0x83CCCCCC),
                                          disabledIconColor: Color(0xFFA1A1A1),
                                          icon: Icon(
                                            FFIcons.kqr,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 24.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed:
                                              (oKFNPayry31DetallesdeQRQrRecord
                                                          .status !=
                                                      'PENDIENTE')
                                                  ? null
                                                  : () async {
                                                      var _shouldSetState =
                                                          false;
                                                      setState(() {
                                                        _model.isUpdating =
                                                            true;
                                                      });
                                                      try {
                                                        final result =
                                                            await FirebaseFunctions
                                                                .instance
                                                                .httpsCallable(
                                                                    'crearMovimientoQR')
                                                                .call({
                                                          "monto":
                                                              oKFNPayry31DetallesdeQRQrRecord
                                                                  .amount
                                                                  .toString(),
                                                          "concepto":
                                                              oKFNPayry31DetallesdeQRQrRecord
                                                                  .concept,
                                                          "token": FFAppState()
                                                              .serverToken,
                                                          "qrId":
                                                              oKFNPayry31DetallesdeQRQrRecord
                                                                  .reference.id,
                                                        });
                                                        _model.generateQrResp =
                                                            CrearMovimientoQRCloudFunctionCallResponse(
                                                          data: result.data,
                                                          succeeded: true,
                                                          resultAsString: result
                                                              .data
                                                              .toString(),
                                                          jsonBody: result.data,
                                                        );
                                                      } on FirebaseFunctionsException catch (error) {
                                                        _model.generateQrResp =
                                                            CrearMovimientoQRCloudFunctionCallResponse(
                                                          errorCode: error.code,
                                                          succeeded: false,
                                                        );
                                                      }

                                                      _shouldSetState = true;
                                                      if (getJsonField(
                                                        _model.generateQrResp!
                                                            .jsonBody,
                                                        r'''$.success''',
                                                      )) {
                                                        await widget
                                                            .qrDocReference!
                                                            .update(
                                                                createQrRecordData(
                                                          qrUrl: getJsonField(
                                                            _model
                                                                .generateQrResp
                                                                ?.jsonBody,
                                                            r'''$.data''',
                                                          ).toString(),
                                                        ));
                                                        setState(() {
                                                          _model.isUpdating =
                                                              false;
                                                        });
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Error'),
                                                              content: Text(
                                                                  getJsonField(
                                                                _model
                                                                    .generateQrResp!
                                                                    .jsonBody,
                                                                r'''$.message''',
                                                              ).toString()),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        setState(() {
                                                          _model.isUpdating =
                                                              false;
                                                        });
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                        ),
                                        Text(
                                          'Regenerar QR',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ].divide(SizedBox(height: 5.0)),
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
            ),
          ),
        );
      },
    );
  }
}
