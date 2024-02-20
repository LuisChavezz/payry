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
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry05_register_inv_model.dart';
export 'o_k_f_n_payry05_register_inv_model.dart';

class OKFNPayry05RegisterInvWidget extends StatefulWidget {
  const OKFNPayry05RegisterInvWidget({
    super.key,
    this.id,
  });

  final DocumentReference? id;

  @override
  State<OKFNPayry05RegisterInvWidget> createState() =>
      _OKFNPayry05RegisterInvWidgetState();
}

class _OKFNPayry05RegisterInvWidgetState
    extends State<OKFNPayry05RegisterInvWidget> {
  late OKFNPayry05RegisterInvModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry05RegisterInvModel());

    _model.invNameFieldController ??= TextEditingController();
    _model.invNameFieldFocusNode ??= FocusNode();

    _model.invEmailFieldFocusNode ??= FocusNode();

    _model.invPasswordCreateController ??= TextEditingController();
    _model.invPasswordCreateFocusNode ??= FocusNode();

    _model.invPasswordConfirmController ??= TextEditingController();
    _model.invPasswordConfirmFocusNode ??= FocusNode();
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

    return StreamBuilder<UserInvitationsRecord>(
      stream: UserInvitationsRecord.getDocument(widget.id!),
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
        final oKFNPayry05RegisterInvUserInvitationsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 0.0, 18.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              width: 335.0,
                              child: Form(
                                key: _model.formKey,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 40.0, 24.0, 40.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Crea una cuenta',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller:
                                              _model.invNameFieldController,
                                          focusNode:
                                              _model.invNameFieldFocusNode,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Nombre',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Ingresa tu nombre...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                          validator: _model
                                              .invNameFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller:
                                              _model.invEmailFieldController ??=
                                                  TextEditingController(
                                            text: oKFNPayry05RegisterInvUserInvitationsRecord
                                                            .invitedUserEmail !=
                                                        null &&
                                                    oKFNPayry05RegisterInvUserInvitationsRecord
                                                            .invitedUserEmail !=
                                                        ''
                                                ? oKFNPayry05RegisterInvUserInvitationsRecord
                                                    .invitedUserEmail
                                                : '',
                                          ),
                                          focusNode:
                                              _model.invEmailFieldFocusNode,
                                          readOnly: widget.id != null,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Correo electrónico',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText: 'Ingresa tu email...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                            filled: true,
                                            fillColor: Color(0x83CCCCCC),
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
                                                fontWeight: FontWeight.normal,
                                              ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          validator: _model
                                              .invEmailFieldControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller: _model
                                              .invPasswordCreateController,
                                          focusNode:
                                              _model.invPasswordCreateFocusNode,
                                          obscureText: !_model
                                              .invPasswordCreateVisibility,
                                          decoration: InputDecoration(
                                            labelText: 'Contraseña',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                'Ingresa tu contraseña...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 20.0, 24.0),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => _model
                                                        .invPasswordCreateVisibility =
                                                    !_model
                                                        .invPasswordCreateVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.invPasswordCreateVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          validator: _model
                                              .invPasswordCreateControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller: _model
                                              .invPasswordConfirmController,
                                          focusNode: _model
                                              .invPasswordConfirmFocusNode,
                                          obscureText: !_model
                                              .invPasswordConfirmVisibility,
                                          decoration: InputDecoration(
                                            labelText: 'Confirma Contraseña',
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                'Confirma tu contraseña...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => _model
                                                        .invPasswordConfirmVisibility =
                                                    !_model
                                                        .invPasswordConfirmVisibility,
                                              ),
                                              focusNode: FocusNode(
                                                  skipTraversal: true),
                                              child: Icon(
                                                _model.invPasswordConfirmVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lexend',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          validator: _model
                                              .invPasswordConfirmControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                              if (_model.acceptCheckValue!) {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();
                                                if (_model
                                                        .invPasswordCreateController
                                                        .text !=
                                                    _model
                                                        .invPasswordConfirmController
                                                        .text) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Passwords don\'t match!',
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                final user = await authManager
                                                    .createAccountWithEmail(
                                                  context,
                                                  _model.invEmailFieldController
                                                      .text,
                                                  _model
                                                      .invPasswordCreateController
                                                      .text,
                                                );
                                                if (user == null) {
                                                  return;
                                                }

                                                await currentUserReference!
                                                    .update({
                                                  ...createUsersRecordData(
                                                    adminId: widget.id != null
                                                        ? oKFNPayry05RegisterInvUserInvitationsRecord
                                                            .adminId
                                                        : currentUserUid,
                                                    isAdmin: false,
                                                    email: _model
                                                        .invEmailFieldController
                                                        .text,
                                                    displayName: _model
                                                        .invNameFieldController
                                                        .text,
                                                    photoUrl: '',
                                                    phoneNumber: '',
                                                    status: true,
                                                    isValidPhoneNumber: false,
                                                    isCompanyComplete: false,
                                                    isValidMail: false,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'created_time': FieldValue
                                                          .serverTimestamp(),
                                                    },
                                                  ),
                                                });

                                                await UserPermissionsRecord
                                                    .collection
                                                    .doc()
                                                    .set(
                                                        createUserPermissionsRecordData(
                                                      uid: currentUserUid,
                                                      adminId: valueOrDefault(
                                                          currentUserDocument
                                                              ?.adminId,
                                                          ''),
                                                      createQr: false,
                                                      readQr: false,
                                                      createSms: false,
                                                      readSms: false,
                                                      readTransfers: false,
                                                      createRefunds: false,
                                                      readStatistics: false,
                                                      readCompanies: false,
                                                      readUsers: false,
                                                      readInvoices: false,
                                                    ));
                                                try {
                                                  final result =
                                                      await FirebaseFunctions
                                                          .instance
                                                          .httpsCallable(
                                                              'verifyEmail')
                                                          .call({
                                                    "email": currentUserEmail,
                                                  });
                                                  _model.cfve =
                                                      VerifyEmailCloudFunctionCallResponse(
                                                    data: result.data,
                                                    succeeded: true,
                                                    resultAsString:
                                                        result.data.toString(),
                                                    jsonBody: result.data,
                                                  );
                                                } on FirebaseFunctionsException catch (error) {
                                                  _model.cfve =
                                                      VerifyEmailCloudFunctionCallResponse(
                                                    errorCode: error.code,
                                                    succeeded: false,
                                                  );
                                                }

                                                _shouldSetState = true;
                                                try {
                                                  final result =
                                                      await FirebaseFunctions
                                                          .instance
                                                          .httpsCallable(
                                                              'generateToken')
                                                          .call({
                                                    "uid": currentUserUid,
                                                  });
                                                  _model.cloudFunctionGT =
                                                      GenerateTokenCloudFunctionCallResponse(
                                                    data: result.data,
                                                    succeeded: true,
                                                    resultAsString:
                                                        result.data.toString(),
                                                    jsonBody: result.data,
                                                  );
                                                } on FirebaseFunctionsException catch (error) {
                                                  _model.cloudFunctionGT =
                                                      GenerateTokenCloudFunctionCallResponse(
                                                    errorCode: error.code,
                                                    succeeded: false,
                                                  );
                                                }

                                                _shouldSetState = true;
                                                FFAppState().serverToken =
                                                    _model.cloudFunctionGT!
                                                        .jsonBody!
                                                        .toString();
                                                FFAppState().tutorialDialogs =
                                                    true;

                                                context.goNamedAuth(
                                                    'OK_FN_Payry_06_confirmacionRegistro',
                                                    context.mounted);

                                                try {
                                                  final result =
                                                      await FirebaseFunctions
                                                          .instance
                                                          .httpsCallable(
                                                              'sendWelcomeEmail')
                                                          .call({
                                                    "email": _model
                                                        .invEmailFieldController
                                                        .text,
                                                  });
                                                  _model.cloudFunctionxin =
                                                      SendWelcomeEmailCloudFunctionCallResponse(
                                                    succeeded: true,
                                                  );
                                                } on FirebaseFunctionsException catch (error) {
                                                  _model.cloudFunctionxin =
                                                      SendWelcomeEmailCloudFunctionCallResponse(
                                                    errorCode: error.code,
                                                    succeeded: false,
                                                  );
                                                }

                                                _shouldSetState = true;
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
                                                          'Terminos y condiciones'),
                                                      content: Text(
                                                          'Debes aceptar terminos y condiciones para poder realizar el registro.'),
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
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }

                                              if (_shouldSetState)
                                                setState(() {});
                                            },
                                            text: 'Crea tu cuenta',
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  3.95,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFF5E4A98),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
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
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 12.0, 0.0, 0.0),
                                          child: Wrap(
                                            spacing: 4.0,
                                            runSpacing: 4.0,
                                            alignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Text(
                                                '¿Ya tienes una cuenta?',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      'OK_FN_Payry_08_iniciasesion');
                                                },
                                                child: Text(
                                                  'Inicia sesión',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            Color(0xFF0FB978),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .acceptCheckValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .acceptCheckValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    checkColor: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Al usar Payry aceptas ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 12.0,
                                                      ),
                                                ),
                                                InkWell(
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
                                                        'https://www.payry.mx/terminos-y-condiciones/');
                                                  },
                                                  child: Text(
                                                    'Términos y condiciones',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent3,
                                                          fontSize: 12.0,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                  ),
                                                ),
                                              ],
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
                      ],
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
