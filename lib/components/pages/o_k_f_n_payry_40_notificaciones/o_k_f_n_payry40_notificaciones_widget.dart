import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    extends State<OKFNPayry40NotificacionesWidget>
    with TickerProviderStateMixin {
  late OKFNPayry40NotificacionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry40NotificacionesModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 36.0, 18.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notificaciones',
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context).accent3,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 112.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          letterSpacing: 0.0,
                                        ),
                                    unselectedLabelStyle: TextStyle(),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    padding: EdgeInsets.all(4.0),
                                    tabs: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Icon(
                                              FFIcons.knuevaNotificacion,
                                              size: 18.0,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Sin leer',
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: Icon(
                                              FFIcons.knotificaciones,
                                              size: 18.0,
                                            ),
                                          ),
                                          Tab(
                                            text: 'Leídos',
                                          ),
                                        ],
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      FutureBuilder<List<NotificationRecord>>(
                                        future: (_model
                                                    .firestoreRequestCompleter ??=
                                                Completer<
                                                    List<NotificationRecord>>()
                                                  ..complete(
                                                      queryNotificationRecordOnce(
                                                    queryBuilder:
                                                        (notificationRecord) =>
                                                            notificationRecord
                                                                .where(
                                                                  'receiver_id',
                                                                  isEqualTo:
                                                                      currentUserUid,
                                                                )
                                                                .where(
                                                                  'is_read',
                                                                  isEqualTo:
                                                                      false,
                                                                )
                                                                .orderBy(
                                                                    'created_time',
                                                                    descending:
                                                                        true),
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<NotificationRecord>
                                              containerNotificationRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final unreadNotiItems =
                                                      containerNotificationRecordList
                                                          .toList();
                                                  if (unreadNotiItems.isEmpty) {
                                                    return Container(
                                                      height: 300.0,
                                                      child: EmptyListWidget(
                                                        title:
                                                            'Sin notificaciones',
                                                        message:
                                                            'No tienes notificaciones nuevas.',
                                                      ),
                                                    );
                                                  }
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        unreadNotiItems.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 20.0),
                                                    itemBuilder: (context,
                                                        unreadNotiItemsIndex) {
                                                      final unreadNotiItemsItem =
                                                          unreadNotiItems[
                                                              unreadNotiItemsIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (unreadNotiItemsItem
                                                                .redirect) {
                                                              if (functions
                                                                  .includeTheString(
                                                                      unreadNotiItemsItem
                                                                          .subject,
                                                                      'CoDi')!) {
                                                                await unreadNotiItemsItem
                                                                    .reference
                                                                    .update(
                                                                        createNotificationRecordData(
                                                                  isRead: true,
                                                                ));
                                                                setState(() =>
                                                                    _model.firestoreRequestCompleter =
                                                                        null);
                                                                await _model
                                                                    .waitForFirestoreRequestCompleted();
                                                                await actions
                                                                    .updateAppBadge(
                                                                  containerNotificationRecordList
                                                                      .length,
                                                                );

                                                                context
                                                                    .pushNamed(
                                                                  'OK_FN_Payry_31_detallesdeQR',
                                                                  queryParameters:
                                                                      {
                                                                    'registraCobroRef':
                                                                        serializeParam(
                                                                      functions.jsonPathToRegistraCobroDocRef(
                                                                          unreadNotiItemsItem
                                                                              .registraCobroRef),
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'createRefund':
                                                                        serializeParam(
                                                                      stackUserPermissionsRecord
                                                                          ?.createRefunds,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'detallesCobroRef':
                                                                        serializeParam(
                                                                      functions.jsonPathToDetallesCobroRef(
                                                                          unreadNotiItemsItem
                                                                              .detallesCobroRef),
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                return;
                                                              } else {
                                                                if (functions.includeTheString(
                                                                    unreadNotiItemsItem
                                                                        .subject,
                                                                    'DiMo')!) {
                                                                  await unreadNotiItemsItem
                                                                      .reference
                                                                      .update(
                                                                          createNotificationRecordData(
                                                                    isRead:
                                                                        true,
                                                                  ));
                                                                  setState(() =>
                                                                      _model.firestoreRequestCompleter =
                                                                          null);
                                                                  await _model
                                                                      .waitForFirestoreRequestCompleted();
                                                                  await actions
                                                                      .updateAppBadge(
                                                                    containerNotificationRecordList
                                                                        .length,
                                                                  );

                                                                  context
                                                                      .pushNamed(
                                                                    'OK_FN_Payry_36_detallesdeSMS',
                                                                    queryParameters:
                                                                        {
                                                                      'registraCobroRef':
                                                                          serializeParam(
                                                                        functions.jsonPathToRegistraCobroDocRef(functions
                                                                            .jsonPathToRegistraCobroDocRef(unreadNotiItemsItem.registraCobroRef)
                                                                            ?.id),
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'createRefund':
                                                                          serializeParam(
                                                                        stackUserPermissionsRecord
                                                                            ?.createRefunds,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'detallesCobroRef':
                                                                          serializeParam(
                                                                        functions
                                                                            .jsonPathToDetallesCobroRef(unreadNotiItemsItem.detallesCobroRef),
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  return;
                                                                } else {
                                                                  if (functions.includeTheString(
                                                                      unreadNotiItemsItem
                                                                          .subject,
                                                                      'Transferencia')!) {
                                                                    await unreadNotiItemsItem
                                                                        .reference
                                                                        .update(
                                                                            createNotificationRecordData(
                                                                      isRead:
                                                                          true,
                                                                    ));
                                                                    setState(() =>
                                                                        _model.firestoreRequestCompleter =
                                                                            null);
                                                                    await _model
                                                                        .waitForFirestoreRequestCompleted();
                                                                    await actions
                                                                        .updateAppBadge(
                                                                      containerNotificationRecordList
                                                                          .length,
                                                                    );

                                                                    context.pushNamed(
                                                                        'OK_FN_Payry_44_historialTransactions');

                                                                    return;
                                                                  } else {
                                                                    if (functions.includeTheString(
                                                                        unreadNotiItemsItem
                                                                            .subject,
                                                                        'usuario invitado')!) {
                                                                      context
                                                                          .pushNamed(
                                                                        'OK_FN_Payry_25_permisos',
                                                                        queryParameters:
                                                                            {
                                                                          'uid':
                                                                              serializeParam(
                                                                            unreadNotiItemsItem.userId,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userName':
                                                                              serializeParam(
                                                                            unreadNotiItemsItem.userName,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userEmail':
                                                                              serializeParam(
                                                                            unreadNotiItemsItem.userEmail,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userBranchId':
                                                                              serializeParam(
                                                                            unreadNotiItemsItem.sucursalId,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      return;
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Error'),
                                                                            content:
                                                                                Text('Hubo un error en la navegación.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            10.0,
                                                                            8.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('OK_FN_Payry_15_EditProfile');
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.knotificaciones,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        unreadNotiItemsItem
                                                                            .subject,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lexend',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            unreadNotiItemsItem.content,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Lexend',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          '${dateTimeFormat(
                                                                            'dd MMM, y',
                                                                            unreadNotiItemsItem.createdTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} a las ${dateTimeFormat(
                                                                            'jm',
                                                                            unreadNotiItemsItem.createdTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Lexend',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
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
                                                                        onTap:
                                                                            () async {
                                                                          await unreadNotiItemsItem
                                                                              .reference
                                                                              .update(createNotificationRecordData(
                                                                            isRead:
                                                                                true,
                                                                          ));
                                                                          setState(() =>
                                                                              _model.firestoreRequestCompleter = null);
                                                                          await _model
                                                                              .waitForFirestoreRequestCompleted();
                                                                          await actions
                                                                              .updateAppBadge(
                                                                            containerNotificationRecordList.length,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.remove_red_eye,
                                                                                color: Color(0xFF0FB978),
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Marcar como leído',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lexend',
                                                                                    color: Color(0xFF0FB978),
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
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
                                          );
                                        },
                                      ),
                                      FutureBuilder<List<NotificationRecord>>(
                                        future: queryNotificationRecordOnce(
                                          queryBuilder: (notificationRecord) =>
                                              notificationRecord
                                                  .where(
                                                    'receiver_id',
                                                    isEqualTo: currentUserUid,
                                                  )
                                                  .where(
                                                    'is_read',
                                                    isEqualTo: true,
                                                  )
                                                  .orderBy('created_time',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 40.0,
                                                height: 40.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .accent3,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<NotificationRecord>
                                              containerNotificationRecordList =
                                              snapshot.data!;
                                          return Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final readNotiItems =
                                                      containerNotificationRecordList
                                                          .toList();
                                                  if (readNotiItems.isEmpty) {
                                                    return Container(
                                                      height: 300.0,
                                                      child: EmptyListWidget(
                                                        title:
                                                            'Sin notificaciones',
                                                        message:
                                                            'No tienes notificaciones nuevas.',
                                                      ),
                                                    );
                                                  }
                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        readNotiItems.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 20.0),
                                                    itemBuilder: (context,
                                                        readNotiItemsIndex) {
                                                      final readNotiItemsItem =
                                                          readNotiItems[
                                                              readNotiItemsIndex];
                                                      return Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (readNotiItemsItem
                                                                .redirect) {
                                                              if (functions
                                                                  .includeTheString(
                                                                      readNotiItemsItem
                                                                          .subject,
                                                                      'CoDi')!) {
                                                                context
                                                                    .pushNamed(
                                                                  'OK_FN_Payry_31_detallesdeQR',
                                                                  queryParameters:
                                                                      {
                                                                    'registraCobroRef':
                                                                        serializeParam(
                                                                      functions.jsonPathToRegistraCobroDocRef(
                                                                          readNotiItemsItem
                                                                              .registraCobroRef),
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                    'createRefund':
                                                                        serializeParam(
                                                                      stackUserPermissionsRecord
                                                                          ?.createRefunds,
                                                                      ParamType
                                                                          .bool,
                                                                    ),
                                                                    'detallesCobroRef':
                                                                        serializeParam(
                                                                      functions.jsonPathToDetallesCobroRef(
                                                                          readNotiItemsItem
                                                                              .detallesCobroRef),
                                                                      ParamType
                                                                          .DocumentReference,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );

                                                                return;
                                                              } else {
                                                                if (functions.includeTheString(
                                                                    readNotiItemsItem
                                                                        .subject,
                                                                    'DiMo')!) {
                                                                  context
                                                                      .pushNamed(
                                                                    'OK_FN_Payry_36_detallesdeSMS',
                                                                    queryParameters:
                                                                        {
                                                                      'registraCobroRef':
                                                                          serializeParam(
                                                                        functions.jsonPathToRegistraCobroDocRef(functions
                                                                            .jsonPathToRegistraCobroDocRef(readNotiItemsItem.registraCobroRef)
                                                                            ?.id),
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                      'createRefund':
                                                                          serializeParam(
                                                                        stackUserPermissionsRecord
                                                                            ?.createRefunds,
                                                                        ParamType
                                                                            .bool,
                                                                      ),
                                                                      'detallesCobroRef':
                                                                          serializeParam(
                                                                        functions
                                                                            .jsonPathToDetallesCobroRef(readNotiItemsItem.detallesCobroRef),
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  return;
                                                                } else {
                                                                  if (functions.includeTheString(
                                                                      readNotiItemsItem
                                                                          .subject,
                                                                      'Transferencia')!) {
                                                                    context.pushNamed(
                                                                        'OK_FN_Payry_44_historialTransactions');

                                                                    return;
                                                                  } else {
                                                                    if (functions.includeTheString(
                                                                        readNotiItemsItem
                                                                            .subject,
                                                                        'usuario invitado')!) {
                                                                      context
                                                                          .pushNamed(
                                                                        'OK_FN_Payry_25_permisos',
                                                                        queryParameters:
                                                                            {
                                                                          'uid':
                                                                              serializeParam(
                                                                            readNotiItemsItem.userId,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userName':
                                                                              serializeParam(
                                                                            readNotiItemsItem.userName,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userEmail':
                                                                              serializeParam(
                                                                            readNotiItemsItem.userEmail,
                                                                            ParamType.String,
                                                                          ),
                                                                          'userBranchId':
                                                                              serializeParam(
                                                                            readNotiItemsItem.sucursalId,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );

                                                                      return;
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Error'),
                                                                            content:
                                                                                Text('Hubo un error en la navegación.'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                      return;
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            } else {
                                                              return;
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            10.0,
                                                                            8.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('OK_FN_Payry_15_EditProfile');
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            FFIcons.knotificaciones,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        readNotiItemsItem
                                                                            .subject,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Lexend',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            16.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            readNotiItemsItem.content,
                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                  fontFamily: 'Lexend',
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          '${dateTimeFormat(
                                                                            'dd MMM, y',
                                                                            readNotiItemsItem.createdTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )} a las ${dateTimeFormat(
                                                                            'jm',
                                                                            readNotiItemsItem.createdTime,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Lexend',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
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
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarFlotingModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarFlotingWidget(
                        pageName: 'notificaciones',
                        userPermissions: stackUserPermissionsRecord!,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
