import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry20_datos_bancarios_model.dart';
export 'o_k_f_n_payry20_datos_bancarios_model.dart';

class OKFNPayry20DatosBancariosWidget extends StatefulWidget {
  const OKFNPayry20DatosBancariosWidget({
    super.key,
    required this.companyDocRef,
    required this.clabe,
    required this.bank,
  });

  final DocumentReference? companyDocRef;
  final String? clabe;
  final String? bank;

  @override
  State<OKFNPayry20DatosBancariosWidget> createState() =>
      _OKFNPayry20DatosBancariosWidgetState();
}

class _OKFNPayry20DatosBancariosWidgetState
    extends State<OKFNPayry20DatosBancariosWidget> {
  late OKFNPayry20DatosBancariosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry20DatosBancariosModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Clipboard.setData(ClipboardData(text: ''));
    });

    _model.clabeFieldController ??= TextEditingController(text: widget.clabe);
    _model.clabeFieldFocusNode ??= FocusNode();

    _model.bankFieldController ??= TextEditingController(text: widget.bank);
    _model.bankFieldFocusNode ??= FocusNode();
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
            'Datos bancarios',
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: TextFormField(
                            controller: _model.clabeFieldController,
                            focusNode: _model.clabeFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.clabeFieldController',
                              Duration(milliseconds: 2000),
                              () async {
                                var _shouldSetState = false;
                                _model.clabeParsed =
                                    await actions.clabeClipboard(
                                  _model.clabeFieldController.text,
                                );
                                _shouldSetState = true;
                                setState(() {
                                  _model.clabeFieldController?.text =
                                      _model.clabeParsed!;
                                });
                                if (functions.validateMinimumLength(
                                    _model.clabeFieldController.text, 3)!) {
                                  _model.bankCatalogueDocument =
                                      await queryBankCatalogueRecordOnce(
                                    queryBuilder: (bankCatalogueRecord) =>
                                        bankCatalogueRecord.where(
                                      'key',
                                      isEqualTo:
                                          functions.getFirstThreeCharacters(
                                              _model.clabeFieldController.text),
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  _shouldSetState = true;
                                  if (_model.bankCatalogueDocument != null) {
                                    setState(() {
                                      _model.bankFieldController?.text =
                                          _model.bankCatalogueDocument!.name;
                                    });
                                  } else {
                                    setState(() {
                                      _model.bankFieldController?.text = '';
                                    });
                                  }

                                  if (_shouldSetState) setState(() {});
                                  return;
                                } else {
                                  setState(() {
                                    _model.bankFieldController?.text = '';
                                  });
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'CLABE',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Ingresa tu CLABE a 18 dígitos',
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
                                  color: Colors.white,
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
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            maxLength: 18,
                            keyboardType: TextInputType.number,
                            validator: _model.clabeFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: TextFormField(
                            controller: _model.bankFieldController,
                            focusNode: _model.bankFieldFocusNode,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Banco',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Banco',
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
                                  color: Colors.white,
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
                              filled: true,
                              fillColor: Color(0x83CCCCCC),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                ),
                            validator: _model.bankFieldControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 10.0),
                            child: FFButtonWidget(
                              onPressed: (_model
                                          .bankCatalogueDocument?.reference ==
                                      null)
                                  ? null
                                  : () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      try {
                                        final result = await FirebaseFunctions
                                            .instance
                                            .httpsCallable('saveBankCompany')
                                            .call({
                                          "uid": FFAppState().serverToken,
                                          "clabe":
                                              _model.clabeFieldController.text,
                                        });
                                        _model.cloudFunctionBankCompany =
                                            SaveBankCompanyCloudFunctionCallResponse(
                                          succeeded: true,
                                        );
                                      } on FirebaseFunctionsException catch (error) {
                                        _model.cloudFunctionBankCompany =
                                            SaveBankCompanyCloudFunctionCallResponse(
                                          errorCode: error.code,
                                          succeeded: false,
                                        );
                                      }

                                      await widget.companyDocRef!
                                          .update(createCompaniesRecordData(
                                        clabe: _model.clabeFieldController.text,
                                        bank: _model.bankFieldController.text,
                                        bankid: _model.bankCatalogueDocument
                                                        ?.bankid !=
                                                    null &&
                                                _model.bankCatalogueDocument
                                                        ?.bankid !=
                                                    ''
                                            ? _model
                                                .bankCatalogueDocument?.bankid
                                            : '',
                                      ));

                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        isCompanyComplete: true,
                                      ));
                                      context.safePop();

                                      setState(() {});
                                    },
                              text: 'Guardar',
                              options: FFButtonOptions(
                                width: 300.0,
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
                                disabledColor: Color(0x83CCCCCC),
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
          ),
        ),
      ),
    );
  }
}
