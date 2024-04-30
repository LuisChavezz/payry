import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/agregar_datos_bancarios.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      if (getJsonField(
        FFAppState().walkthroughs,
        r'''$.datos_bancarios''',
      )) {
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          _model.show = true;
        });
        safeSetState(() => _model.agregarDatosBancariosController =
            createPageWalkthrough(context));
        _model.agregarDatosBancariosController?.show(context: context);
      } else {
        setState(() {
          _model.show = true;
        });
        return;
      }

      await Clipboard.setData(ClipboardData(text: ''));
    });

    _model.clabeFieldTextController ??=
        TextEditingController(text: widget.clabe);
    _model.clabeFieldFocusNode ??= FocusNode();

    _model.bankFieldTextController ??= TextEditingController(text: widget.bank);
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
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Datos bancarios  ',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend',
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
              FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: FaIcon(
                  FontAwesomeIcons.questionCircle,
                  color: FlutterFlowTheme.of(context).accent1,
                  size: 24.0,
                ),
                onPressed: () async {
                  safeSetState(() => _model.agregarDatosBancariosController =
                      createPageWalkthrough(context));
                  _model.agregarDatosBancariosController
                      ?.show(context: context);
                },
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              if (_model.show)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(18.0, 18.0, 18.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                                    controller: _model.clabeFieldTextController,
                                    focusNode: _model.clabeFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.clabeFieldTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        var _shouldSetState = false;
                                        _model.clabeParsed =
                                            await actions.clabeClipboard(
                                          _model.clabeFieldTextController.text,
                                        );
                                        _shouldSetState = true;
                                        setState(() {
                                          _model.clabeFieldTextController
                                              ?.text = _model.clabeParsed!;
                                        });
                                        if (functions.validateMinimumLength(
                                            _model
                                                .clabeFieldTextController.text,
                                            3)!) {
                                          _model.bankCatalogueDocument =
                                              await queryBankCatalogueRecordOnce(
                                            queryBuilder:
                                                (bankCatalogueRecord) =>
                                                    bankCatalogueRecord.where(
                                              'key',
                                              isEqualTo: functions
                                                  .getFirstThreeCharacters(_model
                                                      .clabeFieldTextController
                                                      .text),
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          _shouldSetState = true;
                                          if (_model.bankCatalogueDocument !=
                                              null) {
                                            setState(() {
                                              _model.bankFieldTextController
                                                      ?.text =
                                                  _model.bankCatalogueDocument!
                                                      .name;
                                            });
                                          } else {
                                            setState(() {
                                              _model.bankFieldTextController
                                                  ?.text = '';
                                            });
                                          }

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          setState(() {
                                            _model.bankFieldTextController
                                                ?.text = '';
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
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Ingresa tu CLABE a 18 dígitos',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
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
                                        ),
                                    maxLength: 18,
                                    keyboardType: TextInputType.number,
                                    validator: _model
                                        .clabeFieldTextControllerValidator
                                        .asValidator(context),
                                  ).addWalkthrough(
                                    textFieldL7ghthf0,
                                    _model.agregarDatosBancariosController,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: TextFormField(
                                    controller: _model.bankFieldTextController,
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
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      hintText: 'Banco',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: Color(0xFF8788A5),
                                            letterSpacing: 0.0,
                                          ),
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
                                      fillColor: Color(0x1ACCCCCC),
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
                                    validator: _model
                                        .bankFieldTextControllerValidator
                                        .asValidator(context),
                                  ).addWalkthrough(
                                    textFieldAkh84zc0,
                                    _model.agregarDatosBancariosController,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: (_model.bankCatalogueDocument
                                                    ?.reference ==
                                                null)
                                            ? null
                                            : () async {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }

                                                await widget.companyDocRef!
                                                    .update(
                                                        createCompaniesRecordData(
                                                  clabe: _model
                                                      .clabeFieldTextController
                                                      .text,
                                                  bank: _model
                                                      .bankFieldTextController
                                                      .text,
                                                  bankid: _model.bankCatalogueDocument
                                                                  ?.bankid !=
                                                              null &&
                                                          _model.bankCatalogueDocument
                                                                  ?.bankid !=
                                                              ''
                                                      ? _model
                                                          .bankCatalogueDocument
                                                          ?.bankid
                                                      : '',
                                                ));
                                                if (!valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isCompanyComplete,
                                                    false)) {
                                                  var sucursalesRecordReference =
                                                      SucursalesRecord
                                                          .collection
                                                          .doc();
                                                  await sucursalesRecordReference
                                                      .set({
                                                    ...createSucursalesRecordData(
                                                      nombre: 'Matriz',
                                                      cuenta: _model
                                                          .clabeFieldTextController
                                                          .text,
                                                      empresaId: widget
                                                          .companyDocRef?.id,
                                                      adminId: valueOrDefault(
                                                          currentUserDocument
                                                              ?.adminId,
                                                          ''),
                                                      bankid: _model.bankCatalogueDocument
                                                                      ?.bankid !=
                                                                  null &&
                                                              _model.bankCatalogueDocument
                                                                      ?.bankid !=
                                                                  ''
                                                          ? _model
                                                              .bankCatalogueDocument
                                                              ?.bankid
                                                          : '',
                                                      street: '',
                                                      streetNumber: '',
                                                      status: true,
                                                      bankName: _model
                                                          .bankFieldTextController
                                                          .text,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'created_time': FieldValue
                                                            .serverTimestamp(),
                                                      },
                                                    ),
                                                  });
                                                  _model.createdBranch =
                                                      SucursalesRecord
                                                          .getDocumentFromData({
                                                    ...createSucursalesRecordData(
                                                      nombre: 'Matriz',
                                                      cuenta: _model
                                                          .clabeFieldTextController
                                                          .text,
                                                      empresaId: widget
                                                          .companyDocRef?.id,
                                                      adminId: valueOrDefault(
                                                          currentUserDocument
                                                              ?.adminId,
                                                          ''),
                                                      bankid: _model.bankCatalogueDocument
                                                                      ?.bankid !=
                                                                  null &&
                                                              _model.bankCatalogueDocument
                                                                      ?.bankid !=
                                                                  ''
                                                          ? _model
                                                              .bankCatalogueDocument
                                                              ?.bankid
                                                          : '',
                                                      street: '',
                                                      streetNumber: '',
                                                      status: true,
                                                      bankName: _model
                                                          .bankFieldTextController
                                                          .text,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'created_time':
                                                            DateTime.now(),
                                                      },
                                                    ),
                                                  }, sucursalesRecordReference);

                                                  await _model
                                                      .createdBranch!.reference
                                                      .update(
                                                          createSucursalesRecordData(
                                                    id: _model.createdBranch
                                                        ?.reference.id,
                                                  ));

                                                  await widget.companyDocRef!
                                                      .update(
                                                          createCompaniesRecordData(
                                                    defaultBranchId: _model
                                                        .createdBranch
                                                        ?.reference
                                                        .id,
                                                  ));

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    isCompanyComplete: true,
                                                  ));
                                                }
                                                await showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: GestureDetector(
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
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.25,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              CustomConfirmDialogWidget(
                                                            title:
                                                                'Datos actualizados',
                                                            description:
                                                                'Los datos bancarios de tu empresa han sido actualizados con éxito.',
                                                            buttonText:
                                                                'Aceptar',
                                                            showDismissButton:
                                                                false,
                                                            dismissAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            mainAction:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));

                                                context.safePop();
                                                _model.rcAC =
                                                    await SQLReportGroup
                                                        .reportCompanyCall
                                                        .call(
                                                  token:
                                                      FFAppState().serverToken,
                                                  id: widget.companyDocRef?.id,
                                                );

                                                setState(() {});
                                              },
                                        text: 'Guardar',
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF5E4A98),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          disabledColor: Color(0x83CCCCCC),
                                          disabledTextColor: Color(0xFFA1A1A1),
                                        ),
                                      ).addWalkthrough(
                                        buttonK3vkl7p3,
                                        _model.agregarDatosBancariosController,
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
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.agregarDatosBancariosController = null);
          FFAppState().walkthroughs = <String, bool?>{
            'menu_mas': getJsonField(
              FFAppState().walkthroughs,
              r'''$.menu_mas''',
            ),
            'dashboard': getJsonField(
              FFAppState().walkthroughs,
              r'''$.dashboard''',
            ),
            'datos_bancarios': false,
            'add_users': getJsonField(
              FFAppState().walkthroughs,
              r'''$.add_users''',
            ),
            'user_permissions': getJsonField(
              FFAppState().walkthroughs,
              r'''$.user_permissions''',
            ),
            'create_codi': getJsonField(
              FFAppState().walkthroughs,
              r'''$.create_codi''',
            ),
            'create_dimo': getJsonField(
              FFAppState().walkthroughs,
              r'''$.create_dimo''',
            ),
            'edit_profile': getJsonField(
              FFAppState().walkthroughs,
              r'''$.edit_profile''',
            ),
          };
        },
        onSkip: () {
          () async {
            FFAppState().walkthroughs = <String, bool?>{
              'menu_mas': getJsonField(
                FFAppState().walkthroughs,
                r'''$.menu_mas''',
              ),
              'dashboard': getJsonField(
                FFAppState().walkthroughs,
                r'''$.dashboard''',
              ),
              'datos_bancarios': false,
              'add_users': getJsonField(
                FFAppState().walkthroughs,
                r'''$.add_users''',
              ),
              'user_permissions': getJsonField(
                FFAppState().walkthroughs,
                r'''$.user_permissions''',
              ),
              'create_codi': getJsonField(
                FFAppState().walkthroughs,
                r'''$.create_codi''',
              ),
              'create_dimo': getJsonField(
                FFAppState().walkthroughs,
                r'''$.create_dimo''',
              ),
              'edit_profile': getJsonField(
                FFAppState().walkthroughs,
                r'''$.edit_profile''',
              ),
            };
          }();
          return true;
        },
      );
}
