import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'phone_submit_dialog_model.dart';
export 'phone_submit_dialog_model.dart';

class PhoneSubmitDialogWidget extends StatefulWidget {
  const PhoneSubmitDialogWidget({
    super.key,
    required this.dismissAction,
    required this.companyAlias,
    required this.paymentId,
  });

  final Future Function()? dismissAction;
  final String? companyAlias;
  final String? paymentId;

  @override
  State<PhoneSubmitDialogWidget> createState() =>
      _PhoneSubmitDialogWidgetState();
}

class _PhoneSubmitDialogWidgetState extends State<PhoneSubmitDialogWidget> {
  late PhoneSubmitDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneSubmitDialogModel());

    _model.phoneFieldController ??= TextEditingController();
    _model.phoneFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Compartir recibo',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).accent3,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/mx_flag.png',
                                width: 35.0,
                                height: 23.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 0.0),
                            child: Text(
                              '+52',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 12.0),
                          child: TextFormField(
                            controller: _model.phoneFieldController,
                            focusNode: _model.phoneFieldFocusNode,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Celular',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyMedium,
                              hintText: 'Ingresa el número celular...',
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
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
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            validator: _model.phoneFieldControllerValidator
                                .asValidator(context),
                            inputFormatters: [_model.phoneFieldMask],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 7.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.contact_phone_outlined,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await requestPermission(contactsPermission);
                            _model.contact =
                                await actions.pickContactFromPhoneBook();
                            setState(() {
                              _model.phoneFieldController?.text =
                                  functions.formatPhoneNumber(getJsonField(
                                _model.contact,
                                r'''$.phone''',
                              ).toString())!;
                            });

                            setState(() {});
                          },
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    if (isiOS) {
                      await launchUrl(Uri.parse(
                          "sms:${_model.phoneFieldController.text}&body=${Uri.encodeComponent('Revisa tu recibo de ${widget.companyAlias}: https://www.payry.mx/rdp/?id=${widget.paymentId}')}"));
                    } else {
                      await launchUrl(Uri(
                        scheme: 'sms',
                        path: _model.phoneFieldController.text,
                        queryParameters: <String, String>{
                          'body':
                              'Revisa tu recibo de ${widget.companyAlias}: https://www.payry.mx/rdp/?id=${widget.paymentId}',
                        },
                      ));
                    }
                  },
                  text: 'Compartir',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF5E4A98),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await widget.dismissAction?.call();
                  },
                  child: Text(
                    'Cancelar',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lexend',
                          color: FlutterFlowTheme.of(context).accent3,
                          fontSize: 12.0,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ].divide(SizedBox(height: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
