import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry19_formulario_empresa_model.dart';
export 'o_k_f_n_payry19_formulario_empresa_model.dart';

class OKFNPayry19FormularioEmpresaWidget extends StatefulWidget {
  const OKFNPayry19FormularioEmpresaWidget({super.key});

  @override
  State<OKFNPayry19FormularioEmpresaWidget> createState() =>
      _OKFNPayry19FormularioEmpresaWidgetState();
}

class _OKFNPayry19FormularioEmpresaWidgetState
    extends State<OKFNPayry19FormularioEmpresaWidget> {
  late OKFNPayry19FormularioEmpresaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry19FormularioEmpresaModel());

    _model.nameFieldFocusNode ??= FocusNode();

    _model.aliasFieldFocusNode ??= FocusNode();

    _model.emailFieldFocusNode ??= FocusNode();

    _model.streetFieldFocusNode ??= FocusNode();

    _model.streetNumberFieldFocusNode ??= FocusNode();

    _model.neighborhoodFieldFocusNode ??= FocusNode();

    _model.cityFieldFocusNode ??= FocusNode();

    _model.zipCodeFieldFocusNode ??= FocusNode();

    _model.rFCFieldFocusNode ??= FocusNode();

    _model.couponFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<CompaniesRecord>>(
      stream: queryCompaniesRecord(
        queryBuilder: (companiesRecord) => companiesRecord.where(
          'created_by',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
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
        List<CompaniesRecord> oKFNPayry19FormularioEmpresaCompaniesRecordList =
            snapshot.data!;
        final oKFNPayry19FormularioEmpresaCompaniesRecord =
            oKFNPayry19FormularioEmpresaCompaniesRecordList.isNotEmpty
                ? oKFNPayry19FormularioEmpresaCompaniesRecordList.first
                : null;
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
              title: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 50.0, 0.0),
                  child: Text(
                    'Datos de Empresa',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final selectedMedia = await selectMedia(
                                        maxWidth: 1080.00,
                                        maxHeight: 1080.00,
                                        imageQuality: 100,
                                        mediaSource: MediaSource.photoGallery,
                                        multiImage: false,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        setState(() =>
                                            _model.isDataUploading = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        var downloadUrls = <String>[];
                                        try {
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();

                                          downloadUrls = (await Future.wait(
                                            selectedMedia.map(
                                              (m) async => await uploadData(
                                                  m.storagePath, m.bytes),
                                            ),
                                          ))
                                              .where((u) => u != null)
                                              .map((u) => u!)
                                              .toList();
                                        } finally {
                                          _model.isDataUploading = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                                selectedMedia.length &&
                                            downloadUrls.length ==
                                                selectedMedia.length) {
                                          setState(() {
                                            _model.uploadedLocalFile =
                                                selectedUploadedFiles.first;
                                            _model.uploadedFileUrl =
                                                downloadUrls.first;
                                          });
                                        } else {
                                          setState(() {});
                                          return;
                                        }
                                      }
                                    },
                                    child: Container(
                                      width: 80.0,
                                      height: 80.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          _model.uploadedFileUrl != null &&
                                                  _model.uploadedFileUrl != ''
                                              ? _model.uploadedFileUrl
                                              : oKFNPayry19FormularioEmpresaCompaniesRecord
                                                  ?.imageUrl,
                                          'https://res.cloudinary.com/dshn8thfr/image/upload/v1694029660/blank-profile-picture-973460_1920_lc1bnn.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.nameFieldController ??=
                                        TextEditingController(
                                      text:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.name,
                                    ),
                                    focusNode: _model.nameFieldFocusNode,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Empresa',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText:
                                          'Ingresa el nombre de tu empresa...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    minLines: null,
                                    validator: _model
                                        .nameFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.aliasFieldController ??=
                                        TextEditingController(
                                      text:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.alias,
                                    ),
                                    focusNode: _model.aliasFieldFocusNode,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    readOnly:
                                        oKFNPayry19FormularioEmpresaCompaniesRecord !=
                                            null,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Alias',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText:
                                          'Un nombre corto que te identifique...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord !=
                                                  null
                                              ? Color(0x1ACCCCCC)
                                              : Color(0x00000000),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 24.0, 20.0, 24.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    minLines: null,
                                    maxLength: 18,
                                    validator: _model
                                        .aliasFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: TextFormField(
                                      controller:
                                          _model.emailFieldController ??=
                                              TextEditingController(
                                        text:
                                            oKFNPayry19FormularioEmpresaCompaniesRecord
                                                ?.email,
                                      ),
                                      focusNode: _model.emailFieldFocusNode,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Correo electrónico',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText:
                                            'Ingresa el correo electrónico...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: Color(0xFF8788A5),
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      minLines: null,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailFieldControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller:
                                              _model.streetFieldController ??=
                                                  TextEditingController(
                                            text:
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                    ?.street,
                                          ),
                                          focusNode:
                                              _model.streetFieldFocusNode,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Calle',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText: 'Ingresa la calle...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lexend',
                                                      color: Color(0xFF8788A5),
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          minLines: null,
                                          validator: _model
                                              .streetFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller: _model
                                                  .streetNumberFieldController ??=
                                              TextEditingController(
                                            text:
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                    ?.streetNumber,
                                          ),
                                          focusNode:
                                              _model.streetNumberFieldFocusNode,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Número',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText: 'Ingresa el número...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lexend',
                                                      color: Color(0xFF8788A5),
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          minLines: null,
                                          validator: _model
                                              .streetNumberFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller:
                                        _model.neighborhoodFieldController ??=
                                            TextEditingController(
                                      text:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.neighborhood,
                                    ),
                                    focusNode:
                                        _model.neighborhoodFieldFocusNode,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Colonia',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Ingresa la colonia...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    minLines: null,
                                    validator: _model
                                        .neighborhoodFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.cityFieldController ??=
                                        TextEditingController(
                                      text:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.city,
                                    ),
                                    focusNode: _model.cityFieldFocusNode,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Ciudad',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Ingresa la ciudad...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    minLines: null,
                                    validator: _model
                                        .cityFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'Estado',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 12.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.stateDropDownValueController ??=
                                            FormFieldController<String>(
                                      _model.stateDropDownValue ??=
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.state,
                                    ),
                                    options: [
                                      'Aguascalientes',
                                      'Baja California',
                                      'Baja California Sur',
                                      'Campeche',
                                      'Chiapas',
                                      'Chihuahua',
                                      'Coahuila de Zaragoza',
                                      'Colima',
                                      'Ciudad de México',
                                      'Durango',
                                      'Guanajuato',
                                      'Guerrero',
                                      'Hidalgo',
                                      'Jalisco',
                                      'México',
                                      'Michoacán',
                                      'Morelos',
                                      'Nayarit',
                                      'Nuevo León',
                                      'Oaxaca',
                                      'Puebla',
                                      'Querétaro',
                                      'Quintana Roo',
                                      'San Luis Potosí',
                                      'Sinaloa',
                                      'Sonora',
                                      'Tabasco',
                                      'Tamaulipas',
                                      'Tlaxcala',
                                      'Veracruz',
                                      'Yucatán',
                                      'Zacatecas'
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.stateDropDownValue = val),
                                    width: double.infinity,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Selecciona el estado...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    elevation: 1.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    'País',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 12.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .countryDropDownValueController ??=
                                        FormFieldController<String>(
                                      _model.countryDropDownValue ??=
                                          valueOrDefault<String>(
                                        oKFNPayry19FormularioEmpresaCompaniesRecord
                                            ?.country,
                                        'México',
                                      ),
                                    ),
                                    options: ['México'],
                                    onChanged: (val) => setState(() =>
                                        _model.countryDropDownValue = val),
                                    width: double.infinity,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Selecciona el país...',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    elevation: 1.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 1.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller:
                                        _model.zipCodeFieldController ??=
                                            TextEditingController(
                                      text:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.zipcode,
                                    ),
                                    focusNode: _model.zipCodeFieldFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Código postal',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Ingresa el código postal...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    minLines: null,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .zipCodeFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                if (false)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Estatus',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 12.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .statusDropDownValueController ??=
                                              FormFieldController<String>(
                                            _model.statusDropDownValue ??=
                                                valueOrDefault<String>(
                                              oKFNPayry19FormularioEmpresaCompaniesRecord !=
                                                      null
                                                  ? valueOrDefault<String>(
                                                      oKFNPayry19FormularioEmpresaCompaniesRecord!
                                                              .status
                                                          ? 'Activo'
                                                          : 'Inactivo',
                                                      'Activo',
                                                    )
                                                  : 'Activo',
                                              'Activo',
                                            ),
                                          ),
                                          options: ['Activo', 'Inactivo'],
                                          onChanged: (val) => setState(() =>
                                              _model.statusDropDownValue = val),
                                          width: double.infinity,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          hintText: 'Selecciona el estatus...',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          elevation: 1.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                StreamBuilder<List<GirosRecord>>(
                                  stream: queryGirosRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.0,
                                          height: 40.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .accent3,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<GirosRecord> containerGirosRecordList =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                child: Text(
                                                  'Categoría',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 4.0, 0.0, 12.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .giroCatDropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.giroCatDropDownValue ??=
                                                        oKFNPayry19FormularioEmpresaCompaniesRecord
                                                            ?.giroCategory,
                                                  ),
                                                  options:
                                                      containerGirosRecordList
                                                          .map(
                                                              (e) => e.category)
                                                          .toList(),
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .giroCatDropDownValue =
                                                        val);
                                                    setState(() {
                                                      _model
                                                          .giroDropDownValueController
                                                          ?.value = '';
                                                    });
                                                    setState(() {
                                                      _model.girosDocSelected =
                                                          containerGirosRecordList
                                                              .where((e) =>
                                                                  e.category ==
                                                                  _model
                                                                      .giroCatDropDownValue)
                                                              .toList()
                                                              .first;
                                                    });
                                                  },
                                                  width: double.infinity,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0xFF8788A5),
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText:
                                                      'Selecciona la categoria de tu empresa...',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  elevation: 1.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  borderWidth: 1.0,
                                                  borderRadius: 8.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 4.0, 16.0, 4.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ],
                                          ),
                                          if ((_model.girosDocSelected !=
                                                  null) ||
                                              (oKFNPayry19FormularioEmpresaCompaniesRecord
                                                          ?.giroName !=
                                                      null &&
                                                  oKFNPayry19FormularioEmpresaCompaniesRecord
                                                          ?.giroName !=
                                                      ''))
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Giro',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 0.0, 12.0),
                                                  child: FlutterFlowDropDown<
                                                      String>(
                                                    controller: _model
                                                            .giroDropDownValueController ??=
                                                        FormFieldController<
                                                            String>(
                                                      _model.giroDropDownValue ??=
                                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                                              ?.giroName,
                                                    ),
                                                    options: _model
                                                                .girosDocSelected !=
                                                            null
                                                        ? _model
                                                            .girosDocSelected!
                                                            .giros
                                                        : functions.returnGirosArray(
                                                            containerGirosRecordList
                                                                .where((e) =>
                                                                    e.category ==
                                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                                        ?.giroCategory)
                                                                .toList()
                                                                .first),
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .giroDropDownValue =
                                                            val),
                                                    width: double.infinity,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color:
                                                              Color(0xFF8788A5),
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintText:
                                                        'Selecciona el giro de tu empresa...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                    elevation: 1.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    borderWidth: 1.0,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '¿Necesitas factura?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Switch.adaptive(
                                          value: _model
                                                  .requireBillSwitchValue ??=
                                              oKFNPayry19FormularioEmpresaCompaniesRecord !=
                                                      null
                                                  ? oKFNPayry19FormularioEmpresaCompaniesRecord!
                                                      .requireBill
                                                  : false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.requireBillSwitchValue =
                                                    newValue!);
                                          },
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                if (_model.requireBillSwitchValue ?? true)
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller:
                                              _model.rFCFieldController ??=
                                                  TextEditingController(
                                            text:
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                    ?.rfc,
                                          ),
                                          focusNode: _model.rFCFieldFocusNode,
                                          textCapitalization:
                                              TextCapitalization.characters,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'RFC',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            hintText:
                                                'Ingresa el RFC como en tu CSF...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Lexend',
                                                      color: Color(0xFF8788A5),
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
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
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          minLines: null,
                                          maxLength: 13,
                                          validator: _model
                                              .rFCFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Text(
                                        'Régimen fiscal',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 12.0),
                                        child: StreamBuilder<
                                            List<TaxRegimesRecord>>(
                                          stream: queryTaxRegimesRecord(
                                            queryBuilder: (taxRegimesRecord) =>
                                                taxRegimesRecord
                                                    .orderBy('description'),
                                          ),
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
                                            List<TaxRegimesRecord>
                                                taxRegimeDropDownTaxRegimesRecordList =
                                                snapshot.data!;
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .taxRegimeDropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.taxRegimeDropDownValue ??=
                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.taxRegime,
                                              ),
                                              options:
                                                  taxRegimeDropDownTaxRegimesRecordList
                                                      .map((e) => e.description)
                                                      .toList(),
                                              onChanged: (val) => setState(() =>
                                                  _model.taxRegimeDropDownValue =
                                                      val),
                                              width: double.infinity,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0xFF8788A5),
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Selecciona el régimen fiscal...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          'Uso de CFDI',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 12.0),
                                        child: StreamBuilder<List<CfdiRecord>>(
                                          stream: queryCfdiRecord(),
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
                                            List<CfdiRecord>
                                                cFDIDropDownCfdiRecordList =
                                                snapshot.data!;
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .cFDIDropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.cFDIDropDownValue ??=
                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.cfdi,
                                              ),
                                              options:
                                                  cFDIDropDownCfdiRecordList
                                                      .map((e) => e.description)
                                                      .toList(),
                                              onChanged: (val) => setState(() =>
                                                  _model.cFDIDropDownValue =
                                                      val),
                                              width: double.infinity,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0xFF8788A5),
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText:
                                                  'Selecciona el uso del CFDI...',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              elevation: 1.0,
                                              borderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              borderWidth: 1.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.couponFieldController ??=
                                        TextEditingController(
                                      text:
                                          oKFNPayry19FormularioEmpresaCompaniesRecord
                                              ?.coupon,
                                    ),
                                    focusNode: _model.couponFieldFocusNode,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Cupón',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Ingresa un cupón...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    minLines: null,
                                    validator: _model
                                        .couponFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        var _shouldSetState = false;
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        if ((_model.giroCatDropDownValue !=
                                                    null &&
                                                _model.giroCatDropDownValue !=
                                                    '') &&
                                            (_model.giroDropDownValue != null &&
                                                _model.giroDropDownValue !=
                                                    '')) {
                                          if (!(oKFNPayry19FormularioEmpresaCompaniesRecord !=
                                              null)) {
                                            var companiesRecordReference =
                                                CompaniesRecord.collection
                                                    .doc();
                                            await companiesRecordReference.set({
                                              ...createCompaniesRecordData(
                                                createdBy: currentUserUid,
                                                name: _model
                                                    .nameFieldController.text,
                                                alias: _model
                                                    .aliasFieldController.text,
                                                email: '',
                                                taxRegime: _model
                                                    .taxRegimeDropDownValue,
                                                rfc: functions.toUppercase(
                                                    _model.rFCFieldController
                                                        .text),
                                                street: _model
                                                    .streetFieldController.text,
                                                streetNumber: _model
                                                    .streetNumberFieldController
                                                    .text,
                                                intStreetNumber: '',
                                                neighborhood: _model
                                                    .neighborhoodFieldController
                                                    .text,
                                                zipcode: _model
                                                    .zipCodeFieldController
                                                    .text,
                                                city: _model
                                                    .cityFieldController.text,
                                                state:
                                                    _model.stateDropDownValue,
                                                country:
                                                    _model.countryDropDownValue,
                                                status: true,
                                                allowTip: false,
                                                requireBill: _model
                                                    .requireBillSwitchValue,
                                                cfdi: _model.cFDIDropDownValue,
                                                bank: '',
                                                clabe: '',
                                                verifiedClabe: false,
                                                apiKey: '',
                                                apiSecret: '',
                                                imageUrl: () {
                                                  if (_model.uploadedFileUrl !=
                                                          null &&
                                                      _model.uploadedFileUrl !=
                                                          '') {
                                                    return _model
                                                        .uploadedFileUrl;
                                                  } else if (oKFNPayry19FormularioEmpresaCompaniesRecord
                                                              ?.imageUrl !=
                                                          null &&
                                                      oKFNPayry19FormularioEmpresaCompaniesRecord
                                                              ?.imageUrl !=
                                                          '') {
                                                    return oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.imageUrl;
                                                  } else {
                                                    return null;
                                                  }
                                                }(),
                                                bankid: '',
                                                coupon: _model
                                                    .couponFieldController.text,
                                                giroName:
                                                    _model.giroDropDownValue,
                                                giroCategory:
                                                    _model.giroCatDropDownValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'created_time': FieldValue
                                                      .serverTimestamp(),
                                                },
                                              ),
                                            });
                                            _model.companyCreatedResp =
                                                CompaniesRecord
                                                    .getDocumentFromData({
                                              ...createCompaniesRecordData(
                                                createdBy: currentUserUid,
                                                name: _model
                                                    .nameFieldController.text,
                                                alias: _model
                                                    .aliasFieldController.text,
                                                email: '',
                                                taxRegime: _model
                                                    .taxRegimeDropDownValue,
                                                rfc: functions.toUppercase(
                                                    _model.rFCFieldController
                                                        .text),
                                                street: _model
                                                    .streetFieldController.text,
                                                streetNumber: _model
                                                    .streetNumberFieldController
                                                    .text,
                                                intStreetNumber: '',
                                                neighborhood: _model
                                                    .neighborhoodFieldController
                                                    .text,
                                                zipcode: _model
                                                    .zipCodeFieldController
                                                    .text,
                                                city: _model
                                                    .cityFieldController.text,
                                                state:
                                                    _model.stateDropDownValue,
                                                country:
                                                    _model.countryDropDownValue,
                                                status: true,
                                                allowTip: false,
                                                requireBill: _model
                                                    .requireBillSwitchValue,
                                                cfdi: _model.cFDIDropDownValue,
                                                bank: '',
                                                clabe: '',
                                                verifiedClabe: false,
                                                apiKey: '',
                                                apiSecret: '',
                                                imageUrl: () {
                                                  if (_model.uploadedFileUrl !=
                                                          null &&
                                                      _model.uploadedFileUrl !=
                                                          '') {
                                                    return _model
                                                        .uploadedFileUrl;
                                                  } else if (oKFNPayry19FormularioEmpresaCompaniesRecord
                                                              ?.imageUrl !=
                                                          null &&
                                                      oKFNPayry19FormularioEmpresaCompaniesRecord
                                                              ?.imageUrl !=
                                                          '') {
                                                    return oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.imageUrl;
                                                  } else {
                                                    return null;
                                                  }
                                                }(),
                                                bankid: '',
                                                coupon: _model
                                                    .couponFieldController.text,
                                                giroName:
                                                    _model.giroDropDownValue,
                                                giroCategory:
                                                    _model.giroCatDropDownValue,
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'created_time':
                                                      DateTime.now(),
                                                },
                                              ),
                                            }, companiesRecordReference);
                                            _shouldSetState = true;
                                            _model.rccAC = await SQLReportGroup
                                                .reportCompanyCall
                                                .call(
                                              token: FFAppState().serverToken,
                                              id: _model.companyCreatedResp
                                                  ?.reference.id,
                                            );
                                            _shouldSetState = true;
                                            if (getJsonField(
                                              (_model.rccAC?.jsonBody ?? ''),
                                              r'''$.success''',
                                            )) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Empresa registrada'),
                                                    content: Text(
                                                        'La empresa ha sido registrada con éxito'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
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
                                                    content: Text(getJsonField(
                                                      (_model.rccAC?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }

                                            context.pushNamed(
                                              'OK_FN_Payry_20_datosBancarios',
                                              queryParameters: {
                                                'companyDocRef': serializeParam(
                                                  _model.companyCreatedResp
                                                      ?.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'clabe': serializeParam(
                                                  oKFNPayry19FormularioEmpresaCompaniesRecord
                                                      ?.clabe,
                                                  ParamType.String,
                                                ),
                                                'bank': serializeParam(
                                                  oKFNPayry19FormularioEmpresaCompaniesRecord
                                                      ?.bank,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            await oKFNPayry19FormularioEmpresaCompaniesRecord!
                                                .reference
                                                .update(
                                                    createCompaniesRecordData(
                                              createdBy: currentUserUid,
                                              name: _model
                                                  .nameFieldController.text,
                                              alias: _model
                                                  .aliasFieldController.text,
                                              email: '',
                                              taxRegime:
                                                  _model.taxRegimeDropDownValue,
                                              rfc: functions.toUppercase(_model
                                                  .rFCFieldController.text),
                                              street: _model
                                                  .streetFieldController.text,
                                              streetNumber: _model
                                                  .streetNumberFieldController
                                                  .text,
                                              intStreetNumber: '',
                                              neighborhood: _model
                                                  .neighborhoodFieldController
                                                  .text,
                                              zipcode: _model
                                                  .zipCodeFieldController.text,
                                              city: _model
                                                  .cityFieldController.text,
                                              state: _model.stateDropDownValue,
                                              country:
                                                  _model.countryDropDownValue,
                                              status: true,
                                              allowTip: false,
                                              requireBill:
                                                  _model.requireBillSwitchValue,
                                              cfdi: _model.cFDIDropDownValue,
                                              verifiedClabe: false,
                                              apiKey: '',
                                              apiSecret: '',
                                              imageUrl: () {
                                                if (_model.uploadedFileUrl !=
                                                        null &&
                                                    _model.uploadedFileUrl !=
                                                        '') {
                                                  return _model.uploadedFileUrl;
                                                } else if (oKFNPayry19FormularioEmpresaCompaniesRecord
                                                            ?.imageUrl !=
                                                        null &&
                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                            ?.imageUrl !=
                                                        '') {
                                                  return oKFNPayry19FormularioEmpresaCompaniesRecord
                                                      ?.imageUrl;
                                                } else {
                                                  return null;
                                                }
                                              }(),
                                              giroName:
                                                  _model.giroDropDownValue,
                                              giroCategory:
                                                  _model.giroCatDropDownValue,
                                              coupon: _model
                                                  .couponFieldController.text,
                                            ));
                                            _model.recAC = await SQLReportGroup
                                                .reportCompanyCall
                                                .call(
                                              token: FFAppState().serverToken,
                                              id: oKFNPayry19FormularioEmpresaCompaniesRecord
                                                  ?.reference.id,
                                            );
                                            _shouldSetState = true;
                                            if (getJsonField(
                                              (_model.recAC?.jsonBody ?? ''),
                                              r'''$.success''',
                                            )) {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Empresa actualizada'),
                                                    content: Text(
                                                        'La empresa ha sido actualizada con éxito'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
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
                                                    content: Text(getJsonField(
                                                      (_model.recAC?.jsonBody ??
                                                          ''),
                                                      r'''$.message''',
                                                    ).toString()),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }

                                            if (oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.bankid ==
                                                    null ||
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.bankid ==
                                                    '') {
                                              context.pushNamed(
                                                'OK_FN_Payry_20_datosBancarios',
                                                queryParameters: {
                                                  'companyDocRef':
                                                      serializeParam(
                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'clabe': serializeParam(
                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.clabe,
                                                    ParamType.String,
                                                  ),
                                                  'bank': serializeParam(
                                                    oKFNPayry19FormularioEmpresaCompaniesRecord
                                                        ?.bank,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                        } else {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'Debes seleccionar la categoria y giro de tu empresa.'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
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
                                      text: 'Guardar',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: Colors.white,
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
                                if (oKFNPayry19FormularioEmpresaCompaniesRecord !=
                                    null)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'OK_FN_Payry_20_datosBancarios',
                                            queryParameters: {
                                              'companyDocRef': serializeParam(
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                    ?.reference,
                                                ParamType.DocumentReference,
                                              ),
                                              'clabe': serializeParam(
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                    ?.clabe,
                                                ParamType.String,
                                              ),
                                              'bank': serializeParam(
                                                oKFNPayry19FormularioEmpresaCompaniesRecord
                                                    ?.bank,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text: 'Datos bancarios',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                if (false)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                              'OK_FN_Payry_22_conexionAPI');
                                        },
                                        text: 'API',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent4,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
