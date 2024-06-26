import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_switch_user_status_model.dart';
export 'dynamic_switch_user_status_model.dart';

class DynamicSwitchUserStatusWidget extends StatefulWidget {
  const DynamicSwitchUserStatusWidget({
    super.key,
    this.initialValue,
    required this.userDocRef,
  });

  final bool? initialValue;
  final DocumentReference? userDocRef;

  @override
  State<DynamicSwitchUserStatusWidget> createState() =>
      _DynamicSwitchUserStatusWidgetState();
}

class _DynamicSwitchUserStatusWidgetState
    extends State<DynamicSwitchUserStatusWidget> {
  late DynamicSwitchUserStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicSwitchUserStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: _model.switchValue ??= widget.initialValue!,
      onChanged: (newValue) async {
        setState(() => _model.switchValue = newValue!);
        if (newValue!) {
          await widget.userDocRef!.update(createUsersRecordData(
            status: _model.switchValue,
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
        } else {
          await widget.userDocRef!.update(createUsersRecordData(
            status: _model.switchValue,
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
        }
      },
      activeColor: FlutterFlowTheme.of(context).accent1,
      activeTrackColor: FlutterFlowTheme.of(context).success,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
