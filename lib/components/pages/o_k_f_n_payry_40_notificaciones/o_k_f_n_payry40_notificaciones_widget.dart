import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry40_notificaciones_model.dart';
export 'o_k_f_n_payry40_notificaciones_model.dart';

class OKFNPayry40NotificacionesWidget extends StatefulWidget {
  const OKFNPayry40NotificacionesWidget({super.key});

  @override
  State<OKFNPayry40NotificacionesWidget> createState() =>
      _OKFNPayry40NotificacionesWidgetState();
}

class _OKFNPayry40NotificacionesWidgetState
    extends State<OKFNPayry40NotificacionesWidget> {
  late OKFNPayry40NotificacionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry40NotificacionesModel());
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

    return FutureBuilder<List<NotificationRecord>>(
      future: (_model.firestoreRequestCompleter ??=
              Completer<List<NotificationRecord>>()
                ..complete(queryNotificationRecordOnce(
                  queryBuilder: (notificationRecord) => notificationRecord
                      .where(
                        'receiver_id',
                        isEqualTo: currentUserUid,
                      )
                      .where(
                        'is_read',
                        isEqualTo: false,
                      )
                      .orderBy('created_time', descending: true),
                )))
          .future,
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
        List<NotificationRecord>
            oKFNPayry40NotificacionesNotificationRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: StreamBuilder<List<UserPermissionsRecord>>(
              stream: queryUserPermissionsRecord(
                queryBuilder: (userPermissionsRecord) =>
                    userPermissionsRecord.where(
                  'uid',
                  isEqualTo: currentUserUid,
                ),
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).accent3,
                        ),
                      ),
                    ),
                  );
                }
                List<UserPermissionsRecord> stackUserPermissionsRecordList =
                    snapshot.data!;
                final stackUserPermissionsRecord =
                    stackUserPermissionsRecordList.isNotEmpty
                        ? stackUserPermissionsRecordList.first
                        : null;
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.85,
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 36.0, 18.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 30.0),
                                child: Text(
                                  'Notificaciones',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .accent3,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 108.0),
                                child: Builder(
                                  builder: (context) {
                                    final notificationItem =
                                        oKFNPayry40NotificacionesNotificationRecordList
                                            .toList();
                                    if (notificationItem.isEmpty) {
                                      return Container(
                                        height: 300.0,
                                        child: EmptyListWidget(
                                          title: 'Sin notificaciones',
                                          message:
                                              'No tienes notificaciones nuevas.',
                                        ),
                                      );
                                    }
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: notificationItem.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 20.0),
                                      itemBuilder:
                                          (context, notificationItemIndex) {
                                        final notificationItemItem =
                                            notificationItem[
                                                notificationItemIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.notificationRedirect =
                                                    functions
                                                        .notificationRedirect(
                                                            notificationItemItem
                                                                .redirectUrl,
                                                            notificationItemItem
                                                                .subject);
                                              });
                                              if (getJsonField(
                                                _model.notificationRedirect,
                                                r'''$.redirect''',
                                              )) {
                                                if (functions.jsonPathToString(
                                                        getJsonField(
                                                      _model
                                                          .notificationRedirect,
                                                      r'''$.type''',
                                                    ).toString()) ==
                                                    'qr') {
                                                  context.pushNamed(
                                                    'OK_FN_Payry_31_detallesdeQR',
                                                    pathParameters: {
                                                      'qrDocReference':
                                                          serializeParam(
                                                        functions
                                                            .jsonPathToQrDocRef(
                                                                getJsonField(
                                                          _model
                                                              .notificationRedirect,
                                                          r'''$.id''',
                                                        ).toString()),
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  return;
                                                } else {
                                                  if (functions
                                                          .jsonPathToString(
                                                              getJsonField(
                                                        _model
                                                            .notificationRedirect,
                                                        r'''$.type''',
                                                      ).toString()) ==
                                                      'sms') {
                                                    context.pushNamed(
                                                      'OK_FN_Payry_36_detallesdeSMS',
                                                      pathParameters: {
                                                        'smsDocReference':
                                                            serializeParam(
                                                          functions
                                                              .jsonPathToSmsDocRef(
                                                                  getJsonField(
                                                            _model
                                                                .notificationRedirect,
                                                            r'''$.id''',
                                                          ).toString()),
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                }
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      10.0,
                                                                      8.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'OK_FN_Payry_15_EditProfile');
                                                            },
                                                            child: Icon(
                                                              FFIcons
                                                                  .knotificaciones,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          notificationItemItem
                                                              .subject,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              notificationItemItem
                                                                  .content,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            '${dateTimeFormat(
                                                              'dd MMM, y',
                                                              notificationItemItem
                                                                  .createdTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )} a las ${dateTimeFormat(
                                                              'jm',
                                                              notificationItemItem
                                                                  .createdTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            await notificationItemItem
                                                                .reference
                                                                .update(
                                                                    createNotificationRecordData(
                                                              isRead: true,
                                                            ));
                                                            setState(() => _model
                                                                    .firestoreRequestCompleter =
                                                                null);
                                                            await _model
                                                                .waitForFirestoreRequestCompleted();
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            6.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .remove_red_eye,
                                                                  color: Color(
                                                                      0xFF0FB978),
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Marcar como leído',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend',
                                                                      color: Color(
                                                                          0xFF0FB978),
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                        child: wrapWithModel(
                          model: _model.navBarFlotingModel,
                          updateCallback: () => setState(() {}),
                          child: NavBarFlotingWidget(
                            userPermissions: stackUserPermissionsRecord!,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
