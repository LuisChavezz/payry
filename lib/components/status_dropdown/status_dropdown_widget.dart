import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_dropdown_model.dart';
export 'status_dropdown_model.dart';

class StatusDropdownWidget extends StatefulWidget {
  const StatusDropdownWidget({
    Key? key,
    required this.userStatus,
    required this.userReference,
  }) : super(key: key);

  final bool? userStatus;
  final DocumentReference? userReference;

  @override
  _StatusDropdownWidgetState createState() => _StatusDropdownWidgetState();
}

class _StatusDropdownWidgetState extends State<StatusDropdownWidget> {
  late StatusDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusDropdownModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      controller: _model.statusDropDownValueController ??=
          FormFieldController<String>(
        _model.statusDropDownValue ??= widget.userStatus! ? 'Alta' : 'Baja',
      ),
      options: [
        FFLocalizations.of(context).getText(
          '3m8txdau' /* Alta */,
        ),
        FFLocalizations.of(context).getText(
          'v8rlzlwt' /* Baja */,
        )
      ],
      onChanged: (val) async {
        setState(() => _model.statusDropDownValue = val);
        await widget.userReference!.update(createUsersRecordData(
          status: _model.statusDropDownValue == 'Alta',
        ));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'El status del usuario ha sido actualizado.',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
      },
      width: double.infinity,
      height: 40.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Lexend',
            color: valueOrDefault<Color>(
              widget.userStatus!
                  ? Color(0xFF0FB978)
                  : FlutterFlowTheme.of(context).error,
              FlutterFlowTheme.of(context).alternate,
            ),
          ),
      hintText: FFLocalizations.of(context).getText(
        'gps9u0n0' /* Please select... */,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      elevation: 1.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
