import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/custom_confirm_dialog/custom_confirm_dialog_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dynamic_switch_branch_status_model.dart';
export 'dynamic_switch_branch_status_model.dart';

class DynamicSwitchBranchStatusWidget extends StatefulWidget {
  const DynamicSwitchBranchStatusWidget({
    super.key,
    this.initialValue,
    required this.branchDocRef,
  });

  final bool? initialValue;
  final DocumentReference? branchDocRef;

  @override
  State<DynamicSwitchBranchStatusWidget> createState() =>
      _DynamicSwitchBranchStatusWidgetState();
}

class _DynamicSwitchBranchStatusWidgetState
    extends State<DynamicSwitchBranchStatusWidget> {
  late DynamicSwitchBranchStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DynamicSwitchBranchStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Switch.adaptive(
        value: _model.switchValue ??= widget.initialValue!,
        onChanged: (newValue) async {
          setState(() => _model.switchValue = newValue!);
          if (newValue!) {
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: CustomConfirmDialogWidget(
                      title: 'Activar sucursal',
                      description:
                          '¿Estás seguro de querer activar esta sucursal?',
                      buttonText: 'Activar',
                      showDismissButton: true,
                      dismissAction: () async {
                        setState(() {
                          _model.switchValue = false;
                        });
                        Navigator.pop(context);
                      },
                      mainAction: () async {
                        await widget.branchDocRef!
                            .update(createSucursalesRecordData(
                          status: true,
                        ));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          } else {
            await showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    child: CustomConfirmDialogWidget(
                      title: 'Desactivar sucursal',
                      description:
                          '¿Estás seguro de querer desactivar esta sucursal? No será posible realizar operaciones con ella.',
                      buttonText: 'Desactivar',
                      showDismissButton: true,
                      dismissAction: () async {
                        setState(() {
                          _model.switchValue = true;
                        });
                        Navigator.pop(context);
                      },
                      mainAction: () async {
                        await widget.branchDocRef!
                            .update(createSucursalesRecordData(
                          status: false,
                        ));
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          }
        },
        activeColor: FlutterFlowTheme.of(context).accent1,
        activeTrackColor: FlutterFlowTheme.of(context).success,
        inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
        inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
      ),
    );
  }
}
