import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'status_dropdown_model.dart';
export 'status_dropdown_model.dart';

class StatusDropdownWidget extends StatefulWidget {
  const StatusDropdownWidget({
    super.key,
    required this.userStatus,
    required this.userReference,
  });

  final bool? userStatus;
  final DocumentReference? userReference;

  @override
  State<StatusDropdownWidget> createState() => _StatusDropdownWidgetState();
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
    return FlutterFlowDropDown<String>(
      controller: _model.statusDropDownValueController ??=
          FormFieldController<String>(
        _model.statusDropDownValue ??= widget.userStatus! ? 'Alta' : 'Baja',
      ),
      options: ['Alta', 'Baja'],
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
            color: FlutterFlowTheme.of(context).accent3,
            letterSpacing: 0.0,
          ),
      hintText: 'Please select...',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      elevation: 1.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsets.all(0.0),
      hidesUnderline: true,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
