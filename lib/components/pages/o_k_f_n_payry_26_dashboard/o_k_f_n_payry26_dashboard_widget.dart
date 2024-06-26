import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/nav_bar_floting/nav_bar_floting_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/elementos_en_el_dashboard.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'o_k_f_n_payry26_dashboard_model.dart';
export 'o_k_f_n_payry26_dashboard_model.dart';

class OKFNPayry26DashboardWidget extends StatefulWidget {
  const OKFNPayry26DashboardWidget({super.key});

  @override
  State<OKFNPayry26DashboardWidget> createState() =>
      _OKFNPayry26DashboardWidgetState();
}

class _OKFNPayry26DashboardWidgetState extends State<OKFNPayry26DashboardWidget>
    with TickerProviderStateMixin {
  late OKFNPayry26DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OKFNPayry26DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.balanceAC = await StpGroup.getBalanceCall.call(
        token: FFAppState().serverToken,
      );
      if (getJsonField(
        (_model.balanceAC?.jsonBody ?? ''),
        r'''$.success''',
      )) {
        setState(() {
          _model.balance = getJsonField(
            (_model.balanceAC?.jsonBody ?? ''),
            r'''$.balance''',
          ).toString().toString();
        });
      } else {
        if (!functions.includeTheString(
            getJsonField(
              (_model.balanceAC?.jsonBody ?? ''),
              r'''$.message''',
            ).toString().toString(),
            'expirada')!) {
          setState(() {
            _model.balance = '0.00';
          });
          return;
        } else {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();

          context.pushNamedAuth('OK_FN_Payry_08_iniciasesion', context.mounted);

          return;
        }
      }

      if (getJsonField(
        FFAppState().walkthroughs,
        r'''$.dashboard''',
      )) {
        safeSetState(() => _model.elementosEnElDashboardController =
            createPageWalkthrough(context));
        _model.elementosEnElDashboardController?.show(context: context);
        return;
      } else {
        return;
      }
    });

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
    context.watch<FFAppState>();

    return StreamBuilder<List<UserPermissionsRecord>>(
      stream: queryUserPermissionsRecord(
        queryBuilder: (userPermissionsRecord) => userPermissionsRecord.where(
          'uid',
          isEqualTo: currentUserUid,
        ),
        singleRecord: true,
      ),
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
        List<UserPermissionsRecord>
            oKFNPayry26DashboardUserPermissionsRecordList = snapshot.data!;
        final oKFNPayry26DashboardUserPermissionsRecord =
            oKFNPayry26DashboardUserPermissionsRecordList.isNotEmpty
                ? oKFNPayry26DashboardUserPermissionsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF7F3BB7), Color(0xFF491EA6)],
                                stops: [0.5, 1.0],
                                begin: AlignmentDirectional(-0.34, -1.0),
                                end: AlignmentDirectional(0.34, 1.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Dashboard   ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: Colors.white,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        icon: FaIcon(
                                          FontAwesomeIcons.questionCircle,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          safeSetState(() => _model
                                                  .elementosEnElDashboardController =
                                              createPageWalkthrough(context));
                                          _model
                                              .elementosEnElDashboardController
                                              ?.show(context: context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'COBRADO HOY',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w200,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (_model.balance != null &&
                                                _model.balance != '')
                                              Text(
                                                '\$${_model.balance}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: Colors.white,
                                                          fontSize: 28.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            if (_model.balance == null ||
                                                _model.balance == '')
                                              Lottie.asset(
                                                'assets/lottie_animations/Animation_-_1710355792290.json',
                                                width: 60.0,
                                                height: 60.0,
                                                fit: BoxFit.cover,
                                                animate: true,
                                              ),
                                          ],
                                        ).addWalkthrough(
                                          row1h1fcomo,
                                          _model
                                              .elementosEnElDashboardController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<CompaniesRecord>>(
                              stream: queryCompaniesRecord(
                                queryBuilder: (companiesRecord) =>
                                    companiesRecord.where(
                                  'created_by',
                                  isEqualTo: valueOrDefault(
                                      currentUserDocument?.adminId, ''),
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).accent3,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<CompaniesRecord>
                                    containerCompaniesRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerCompaniesRecord =
                                    containerCompaniesRecordList.isNotEmpty
                                        ? containerCompaniesRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 0.0, 18.0, 18.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (oKFNPayry26DashboardUserPermissionsRecord!
                                                .readQr ||
                                            oKFNPayry26DashboardUserPermissionsRecord!
                                                .readSms ||
                                            valueOrDefault<bool>(
                                                currentUserDocument?.isAdmin,
                                                false) ||
                                            oKFNPayry26DashboardUserPermissionsRecord!
                                                .createQr ||
                                            oKFNPayry26DashboardUserPermissionsRecord!
                                                .createSms)
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment(0.0, 0),
                                                  child: TabBar(
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    unselectedLabelStyle:
                                                        TextStyle(),
                                                    indicatorColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    tabs: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              FFIcons.kqr,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                          Tab(
                                                            text: 'CoDi®',
                                                          ),
                                                        ],
                                                      ).addWalkthrough(
                                                        tabVzlr16om,
                                                        _model
                                                            .elementosEnElDashboardController,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        4.0,
                                                                        0.0),
                                                            child: Icon(
                                                              FFIcons.ksms,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                          Tab(
                                                            text: 'DiMo®',
                                                          ),
                                                        ],
                                                      ).addWalkthrough(
                                                        tabNqfrth42,
                                                        _model
                                                            .elementosEnElDashboardController,
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    children: [
                                                      Visibility(
                                                        visible: oKFNPayry26DashboardUserPermissionsRecord!
                                                                .readQr ||
                                                            valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isAdmin,
                                                                false) ||
                                                            oKFNPayry26DashboardUserPermissionsRecord!
                                                                .createQr,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Últimas operaciones',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'OK_FN_Payry_30_historialQRs',
                                                                        queryParameters:
                                                                            {
                                                                          'readAll':
                                                                              serializeParam(
                                                                            oKFNPayry26DashboardUserPermissionsRecord?.readQr,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'createRefund':
                                                                              serializeParam(
                                                                            oKFNPayry26DashboardUserPermissionsRecord?.createRefunds,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'readAllBranches':
                                                                              serializeParam(
                                                                            oKFNPayry26DashboardUserPermissionsRecord?.readBranches,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      'Ver todas',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        DetallesCobroRecord>>(
                                                                  stream:
                                                                      queryDetallesCobroRecord(
                                                                    queryBuilder: (detallesCobroRecord) => detallesCobroRecord
                                                                        .where(
                                                                          'admin_id',
                                                                          isEqualTo: valueOrDefault(
                                                                              currentUserDocument?.adminId,
                                                                              ''),
                                                                        )
                                                                        .where(
                                                                          'uid',
                                                                          isEqualTo: valueOrDefault<bool>(currentUserDocument?.isAdmin, false) || oKFNPayry26DashboardUserPermissionsRecord!.readQr
                                                                              ? null
                                                                              : currentUserUid,
                                                                        )
                                                                        .where(
                                                                          'type',
                                                                          isEqualTo: PaymentType
                                                                              .QR
                                                                              .serialize(),
                                                                        )
                                                                        .where(
                                                                          'created_time',
                                                                          isGreaterThanOrEqualTo:
                                                                              functions.todayFilter(),
                                                                        )
                                                                        .where(
                                                                          'status',
                                                                          isEqualTo: PaymentStatus
                                                                              .PAGADO
                                                                              .serialize(),
                                                                        )
                                                                        .where(
                                                                          'sucursalId',
                                                                          isEqualTo: valueOrDefault<bool>(currentUserDocument?.isAdmin, false) || !containerCompaniesRecord!.porSucursal || oKFNPayry26DashboardUserPermissionsRecord!.readBranches || (valueOrDefault(currentUserDocument?.sucursalId, '') == null || valueOrDefault(currentUserDocument?.sucursalId, '') == '')
                                                                              ? null
                                                                              : valueOrDefault(currentUserDocument?.sucursalId, ''),
                                                                        )
                                                                        .orderBy('created_time', descending: true),
                                                                    limit: 5,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<DetallesCobroRecord>
                                                                        listViewDetallesCobroRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    if (listViewDetallesCobroRecordList
                                                                        .isEmpty) {
                                                                      return Container(
                                                                        height:
                                                                            100.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          title:
                                                                              'No hay CoDis',
                                                                          message:
                                                                              'Aun no hay transferencias por CoDi®',
                                                                        ),
                                                                      );
                                                                    }
                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewDetallesCobroRecordList
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 12.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewDetallesCobroRecord =
                                                                            listViewDetallesCobroRecordList[listViewIndex];
                                                                        return InkWell(
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
                                                                            context.pushNamed(
                                                                              'OK_FN_Payry_31_detallesdeQR',
                                                                              queryParameters: {
                                                                                'registraCobroRef': serializeParam(
                                                                                  functions.jsonPathToRegistraCobroDocRef(listViewDetallesCobroRecord.registraCobroId),
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'createRefund': serializeParam(
                                                                                  oKFNPayry26DashboardUserPermissionsRecord?.createRefunds,
                                                                                  ParamType.bool,
                                                                                ),
                                                                                'detallesCobroRef': serializeParam(
                                                                                  listViewDetallesCobroRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    FFIcons.kqr,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewDetallesCobroRecord.concept.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lexend',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'CoDi®',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lexend',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                              Text(
                                                                                formatNumber(
                                                                                  listViewDetallesCobroRecord.amount,
                                                                                  formatType: FormatType.custom,
                                                                                  currency: '\$',
                                                                                  format: '#,##0.00##',
                                                                                  locale: 'es_MX',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lexend',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
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
                                                      Visibility(
                                                        visible: oKFNPayry26DashboardUserPermissionsRecord!
                                                                .readSms ||
                                                            valueOrDefault<
                                                                    bool>(
                                                                currentUserDocument
                                                                    ?.isAdmin,
                                                                false) ||
                                                            oKFNPayry26DashboardUserPermissionsRecord!
                                                                .createSms,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Últimas operaciones',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'OK_FN_Payry_35_historialSMS',
                                                                        queryParameters:
                                                                            {
                                                                          'readAll':
                                                                              serializeParam(
                                                                            oKFNPayry26DashboardUserPermissionsRecord?.readSms,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'createRefund':
                                                                              serializeParam(
                                                                            oKFNPayry26DashboardUserPermissionsRecord?.createRefunds,
                                                                            ParamType.bool,
                                                                          ),
                                                                          'readAllBranches':
                                                                              serializeParam(
                                                                            oKFNPayry26DashboardUserPermissionsRecord?.readBranches,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      'Ver todas',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            24.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        DetallesCobroRecord>>(
                                                                  stream:
                                                                      queryDetallesCobroRecord(
                                                                    queryBuilder: (detallesCobroRecord) => detallesCobroRecord
                                                                        .where(
                                                                          'admin_id',
                                                                          isEqualTo: valueOrDefault(
                                                                              currentUserDocument?.adminId,
                                                                              ''),
                                                                        )
                                                                        .where(
                                                                          'uid',
                                                                          isEqualTo: oKFNPayry26DashboardUserPermissionsRecord!.readSms || valueOrDefault<bool>(currentUserDocument?.isAdmin, false)
                                                                              ? null
                                                                              : currentUserUid,
                                                                        )
                                                                        .where(
                                                                          'type',
                                                                          isEqualTo: PaymentType
                                                                              .SMS
                                                                              .serialize(),
                                                                        )
                                                                        .where(
                                                                          'created_time',
                                                                          isGreaterThanOrEqualTo:
                                                                              functions.todayFilter(),
                                                                        )
                                                                        .where(
                                                                          'status',
                                                                          isEqualTo: PaymentStatus
                                                                              .PAGADO
                                                                              .serialize(),
                                                                        )
                                                                        .where(
                                                                          'sucursalId',
                                                                          isEqualTo: valueOrDefault<bool>(currentUserDocument?.isAdmin, false) || !containerCompaniesRecord!.porSucursal || oKFNPayry26DashboardUserPermissionsRecord!.readBranches || (valueOrDefault(currentUserDocument?.sucursalId, '') == null || valueOrDefault(currentUserDocument?.sucursalId, '') == '')
                                                                              ? null
                                                                              : valueOrDefault(currentUserDocument?.sucursalId, ''),
                                                                        )
                                                                        .orderBy('created_time', descending: true),
                                                                    limit: 5,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            valueColor:
                                                                                AlwaysStoppedAnimation<Color>(
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<DetallesCobroRecord>
                                                                        listViewDetallesCobroRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    if (listViewDetallesCobroRecordList
                                                                        .isEmpty) {
                                                                      return Container(
                                                                        height:
                                                                            100.0,
                                                                        child:
                                                                            EmptyListWidget(
                                                                          title:
                                                                              'No hay DiMos',
                                                                          message:
                                                                              'Aun no hay transferencias por DiMo®',
                                                                        ),
                                                                      );
                                                                    }
                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewDetallesCobroRecordList
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 12.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewDetallesCobroRecord =
                                                                            listViewDetallesCobroRecordList[listViewIndex];
                                                                        return InkWell(
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
                                                                            context.pushNamed(
                                                                              'OK_FN_Payry_36_detallesdeSMS',
                                                                              queryParameters: {
                                                                                'registraCobroRef': serializeParam(
                                                                                  functions.jsonPathToRegistraCobroDocRef(listViewDetallesCobroRecord.registraCobroId),
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                                'createRefund': serializeParam(
                                                                                  oKFNPayry26DashboardUserPermissionsRecord?.createRefunds,
                                                                                  ParamType.bool,
                                                                                ),
                                                                                'detallesCobroRef': serializeParam(
                                                                                  listViewDetallesCobroRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Icon(
                                                                                    FFIcons.ksms,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewDetallesCobroRecord.concept.maybeHandleOverflow(
                                                                                          maxChars: 25,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lexend',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        'DiMo®',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Lexend',
                                                                                              fontSize: 12.0,
                                                                                              letterSpacing: 0.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                              Text(
                                                                                formatNumber(
                                                                                  listViewDetallesCobroRecord.amount,
                                                                                  formatType: FormatType.custom,
                                                                                  currency: '\$',
                                                                                  format: '#,##0.00##',
                                                                                  locale: 'es_MX',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lexend',
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ],
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
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
                            userPermissions:
                                oKFNPayry26DashboardUserPermissionsRecord!,
                            pageName: 'dashboard',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.elementosEnElDashboardController = null);
          FFAppState().walkthroughs = <String, bool?>{
            'menu_mas': getJsonField(
              FFAppState().walkthroughs,
              r'''$.menu_mas''',
            ),
            'dashboard': false,
            'datos_bancarios': getJsonField(
              FFAppState().walkthroughs,
              r'''$.datos_bancarios''',
            ),
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
              'dashboard': false,
              'datos_bancarios': getJsonField(
                FFAppState().walkthroughs,
                r'''$.datos_bancarios''',
              ),
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
