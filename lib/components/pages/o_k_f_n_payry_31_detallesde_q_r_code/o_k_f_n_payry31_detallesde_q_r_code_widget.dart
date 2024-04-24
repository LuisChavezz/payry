import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
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
import 'o_k_f_n_payry31_detallesde_q_r_code_model.dart';
export 'o_k_f_n_payry31_detallesde_q_r_code_model.dart';

class OKFNPayry31DetallesdeQRCodeWidget extends StatefulWidget {
  const OKFNPayry31DetallesdeQRCodeWidget({
    super.key,
    required this.registraCobroRef,
    required this.createRefund,
  });

  final DocumentReference? registraCobroRef;
  final bool? createRefund;

  @override
  State<OKFNPayry31DetallesdeQRCodeWidget> createState() =>
      _OKFNPayry31DetallesdeQRCodeWidgetState();
}

class _OKFNPayry31DetallesdeQRCodeWidgetState
    extends State<OKFNPayry31DetallesdeQRCodeWidget> {
  late OKFNPayry31DetallesdeQRCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry31DetallesdeQRCodeModel());
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
        final oKFNPayry31DetallesdeQRCodeRegistraCobroRecord = snapshot.data!;
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
                                          oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
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
                                        oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                            .createdTime,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )} a las ${dateTimeFormat(
                                        'h:mm a',
                                        oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
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
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                              .hasSucursalId() &&
                                          (oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                      .sucursalId !=
                                                  null &&
                                              oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                      .sucursalId !=
                                                  ''))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Sucursal',
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
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                        .sucursalName,
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
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
                                    ],
                                  ),
                                ),
                                if (!_model.isUpdating)
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
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
                                                  oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                      .shareableQrUrl)!,
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
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 30.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: () async {
                                            await launchURL(
                                                functions.imagePathToString(
                                                    oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
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
                                                FlutterFlowTheme.of(context)
                                                    .errorRed,
                                            disabledColor: Color(0x83CCCCCC),
                                            disabledIconColor:
                                                Color(0xFFA1A1A1),
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color: Colors.white,
                                              size: 30.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed:
                                                (oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                            .status !=
                                                        PaymentStatus.PENDIENTE)
                                                    ? null
                                                    : () async {
                                                        await showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
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
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.9,
                                                                  child:
                                                                      CustomConfirmDialogWidget(
                                                                    title:
                                                                        'Cancelar CoDi®',
                                                                    description:
                                                                        '¿Estás seguro de querer cancelar este CoDi®?',
                                                                    buttonText:
                                                                        'Confirmar',
                                                                    showDismissButton:
                                                                        true,
                                                                    dismissAction:
                                                                        () async {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    mainAction:
                                                                        () async {
                                                                      await oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                                          .reference
                                                                          .update(
                                                                              createRegistraCobroRecordData(
                                                                        status:
                                                                            PaymentStatus.CANCELADO,
                                                                      ));
                                                                      Navigator.pop(
                                                                          context);
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
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: Container(
                                                                                height: MediaQuery.sizeOf(context).height * 0.25,
                                                                                width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                child: CustomConfirmDialogWidget(
                                                                                  title: 'CoDi® cancelado',
                                                                                  description: 'El CoDi® ha sido cancelado con éxito.',
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
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));
                                                      },
                                          ),
                                        ),
                                        Text(
                                          'Cancelar',
                                          style: FlutterFlowTheme.of(context)
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
                                                FlutterFlowTheme.of(context)
                                                    .accent3,
                                            disabledColor: Color(0x83CCCCCC),
                                            disabledIconColor:
                                                Color(0xFFA1A1A1),
                                            icon: Icon(
                                              FFIcons.kqr,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              size: 24.0,
                                            ),
                                            showLoadingIndicator: true,
                                            onPressed:
                                                (oKFNPayry31DetallesdeQRCodeRegistraCobroRecord
                                                            .status ==
                                                        PaymentStatus.CANCELADO)
                                                    ? null
                                                    : () async {
                                                        await showDialog(
                                                          barrierDismissible:
                                                              false,
                                                          context: context,
                                                          builder:
                                                              (dialogContext) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment: AlignmentDirectional(
                                                                      0.0, 0.0)
                                                                  .resolve(
                                                                      Directionality.of(
                                                                          context)),
                                                              child:
                                                                  GestureDetector(
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
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
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
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    mainAction:
                                                                        () async {
                                                                      var _shouldSetState =
                                                                          false;

                                                                      var registraCobroRecordReference = RegistraCobroRecord
                                                                          .collection
                                                                          .doc();
                                                                      await registraCobroRecordReference
                                                                          .set({
                                                                        ...createRegistraCobroRecordData(
                                                                          adminId: valueOrDefault(
                                                                              currentUserDocument?.adminId,
                                                                              ''),
                                                                          amount:
                                                                              oKFNPayry31DetallesdeQRCodeRegistraCobroRecord.amount,
                                                                          concept:
                                                                              oKFNPayry31DetallesdeQRCodeRegistraCobroRecord.concept,
                                                                          uid:
                                                                              currentUserUid,
                                                                          qrUrl:
                                                                              '',
                                                                          shareableQrUrl:
                                                                              '',
                                                                          companyId:
                                                                              '',
                                                                          errorMessage:
                                                                              '',
                                                                          errorOcurs:
                                                                              false,
                                                                          numeroReferenciaComercio:
                                                                              null,
                                                                          type:
                                                                              PaymentType.QR,
                                                                          status:
                                                                              PaymentStatus.PENDIENTE,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'created_time':
                                                                                FieldValue.serverTimestamp(),
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.codiResp =
                                                                          RegistraCobroRecord
                                                                              .getDocumentFromData({
                                                                        ...createRegistraCobroRecordData(
                                                                          adminId: valueOrDefault(
                                                                              currentUserDocument?.adminId,
                                                                              ''),
                                                                          amount:
                                                                              oKFNPayry31DetallesdeQRCodeRegistraCobroRecord.amount,
                                                                          concept:
                                                                              oKFNPayry31DetallesdeQRCodeRegistraCobroRecord.concept,
                                                                          uid:
                                                                              currentUserUid,
                                                                          qrUrl:
                                                                              '',
                                                                          shareableQrUrl:
                                                                              '',
                                                                          companyId:
                                                                              '',
                                                                          errorMessage:
                                                                              '',
                                                                          errorOcurs:
                                                                              false,
                                                                          numeroReferenciaComercio:
                                                                              null,
                                                                          type:
                                                                              PaymentType.QR,
                                                                          status:
                                                                              PaymentStatus.PENDIENTE,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'created_time':
                                                                                DateTime.now(),
                                                                          },
                                                                        ),
                                                                      }, registraCobroRecordReference);
                                                                      _shouldSetState =
                                                                          true;
                                                                      _model.codiAC = await StpGroup
                                                                          .generateCodiCall
                                                                          .call(
                                                                        id: _model
                                                                            .codiResp
                                                                            ?.reference
                                                                            .id,
                                                                        token: FFAppState()
                                                                            .serverToken,
                                                                      );
                                                                      _shouldSetState =
                                                                          true;
                                                                      if (getJsonField(
                                                                        (_model.codiAC?.jsonBody ??
                                                                            ''),
                                                                        r'''$.success''',
                                                                      )) {
                                                                        if (Navigator.of(context)
                                                                            .canPop()) {
                                                                          context
                                                                              .pop();
                                                                        }
                                                                        context
                                                                            .pushNamedAuth(
                                                                          'OK_FN_Payry_31_detallesdeQRCode',
                                                                          context
                                                                              .mounted,
                                                                          queryParameters:
                                                                              {
                                                                            'registraCobroRef':
                                                                                serializeParam(
                                                                              _model.codiResp?.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                            'createRefund':
                                                                                serializeParam(
                                                                              false,
                                                                              ParamType.bool,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        return;
                                                                      } else {
                                                                        await _model
                                                                            .codiResp!
                                                                            .reference
                                                                            .delete();
                                                                        Navigator.pop(
                                                                            context);
                                                                        await showDialog(
                                                                          barrierDismissible:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
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
                                                                        ).then((value) =>
                                                                            setState(() {}));

                                                                        if (!functions.includeTheString(
                                                                            getJsonField(
                                                                              (_model.codiAC?.jsonBody ?? ''),
                                                                              r'''$.message''',
                                                                            ).toString(),
                                                                            'expirada')!) {
                                                                          return;
                                                                        }

                                                                        context.goNamedAuth(
                                                                            'OK_FN_Payry_08_iniciasesion',
                                                                            context.mounted);

                                                                        return;
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        setState(() {});
                                                      },
                                          ),
                                        ),
                                        Text(
                                          'Regenerar CoDi®',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
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
