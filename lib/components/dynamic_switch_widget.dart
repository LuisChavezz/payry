import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_switch_model.dart';
export 'dynamic_switch_model.dart';

class DynamicSwitchWidget extends StatefulWidget {
  const DynamicSwitchWidget({
    super.key,
    this.initialValue,
    required this.userDocRef,
  });

  final bool? initialValue;
  final DocumentReference? userDocRef;

  @override
  State<DynamicSwitchWidget> createState() => _DynamicSwitchWidgetState();
}

class _DynamicSwitchWidgetState extends State<DynamicSwitchWidget> {
  late DynamicSwitchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicSwitchModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
      activeColor: FlutterFlowTheme.of(context).success,
      activeTrackColor: FlutterFlowTheme.of(context).accent1,
      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
    );
  }
}
