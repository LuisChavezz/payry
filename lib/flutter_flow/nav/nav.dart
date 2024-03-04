import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn
            ? OKFNPayry13MenumasWidget()
            : OKFNPayry08IniciasesionWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? OKFNPayry13MenumasWidget()
              : OKFNPayry08IniciasesionWidget(),
          routes: [
            FFRoute(
              name: 'OK_FN_Payry_08_iniciasesion',
              path: 'oKFNPayry08Iniciasesion',
              builder: (context, params) => OKFNPayry08IniciasesionWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_05_Registrate',
              path: 'register',
              builder: (context, params) => OKFNPayry05RegistrateWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_09_olvidecontrasena',
              path: 'oKFNPayry09Olvidecontrasena',
              builder: (context, params) => OKFNPayry09OlvidecontrasenaWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_01_Splash',
              path: 'oKFNPayry01Splash',
              builder: (context, params) => OKFNPayry01SplashWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_02_onboarding1',
              path: 'oKFNPayry02Onboarding1',
              builder: (context, params) => OKFNPayry02Onboarding1Widget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_06_confirmacionRegistro',
              path: 'oKFNPayry06ConfirmacionRegistro',
              builder: (context, params) =>
                  OKFNPayry06ConfirmacionRegistroWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_11_olvidecontrasenanueva',
              path: 'oKFNPayry11Olvidecontrasenanueva',
              builder: (context, params) =>
                  OKFNPayry11OlvidecontrasenanuevaWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_14_Perfil',
              path: 'oKFNPayry14Perfil',
              requireAuth: true,
              builder: (context, params) => OKFNPayry14PerfilWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_15_EditProfile',
              path: 'oKFNPayry15EditProfile',
              requireAuth: true,
              builder: (context, params) => OKFNPayry15EditProfileWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_16_verificarNumero',
              path: 'oKFNPayry16VerificarNumero',
              builder: (context, params) => OKFNPayry16VerificarNumeroWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_17_verificarOTP',
              path: 'oKFNPayry17VerificarOTP',
              builder: (context, params) => OKFNPayry17VerificarOTPWidget(
                otpCode: params.getParam('otpCode', ParamType.String),
                phoneNumber: params.getParam('phoneNumber', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_19_formularioEmpresa',
              path: 'oKFNPayry19FormularioEmpresa',
              requireAuth: true,
              builder: (context, params) =>
                  OKFNPayry19FormularioEmpresaWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_20_datosBancarios',
              path: 'oKFNPayry20DatosBancarios',
              builder: (context, params) => OKFNPayry20DatosBancariosWidget(
                companyDocRef: params.getParam('companyDocRef',
                    ParamType.DocumentReference, false, ['companies']),
                clabe: params.getParam('clabe', ParamType.String),
                bank: params.getParam('bank', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_22_conexionAPI',
              path: 'oKFNPayry22ConexionAPI',
              requireAuth: true,
              builder: (context, params) => OKFNPayry22ConexionAPIWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_23_invitarUsuario',
              path: 'oKFNPayry23InvitarUsuario',
              requireAuth: true,
              builder: (context, params) => OKFNPayry23InvitarUsuarioWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_24_listadoUsuarios',
              path: 'oKFNPayry24ListadoUsuarios',
              requireAuth: true,
              builder: (context, params) => OKFNPayry24ListadoUsuariosWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_25_permisos',
              path: 'oKFNPayry25Permisos',
              requireAuth: true,
              builder: (context, params) => OKFNPayry25PermisosWidget(
                uid: params.getParam('uid', ParamType.String),
                userName: params.getParam('userName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_27_solicitarQR',
              path: 'oKFNPayry27SolicitarQR',
              requireAuth: true,
              builder: (context, params) => OKFNPayry27SolicitarQRWidget(
                readQr: params.getParam('readQr', ParamType.bool),
                createRefund: params.getParam('createRefund', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_28_qrGenerado',
              path: 'oKFNPayry28QrGenerado',
              requireAuth: true,
              builder: (context, params) => OKFNPayry28QrGeneradoWidget(
                createdQrReference: params.getParam('createdQrReference',
                    ParamType.DocumentReference, false, ['qr']),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_29_opcionesQR',
              path: 'oKFNPayry29OpcionesQR',
              requireAuth: true,
              builder: (context, params) => OKFNPayry29OpcionesQRWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_30_historialQRs',
              path: 'oKFNPayry30HistorialQRs',
              requireAuth: true,
              builder: (context, params) => OKFNPayry30HistorialQRsWidget(
                readAll: params.getParam('readAll', ParamType.bool),
                createRefund: params.getParam('createRefund', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_35_historialSMS',
              path: 'oKFNPayry35HistorialSMS',
              requireAuth: true,
              builder: (context, params) => OKFNPayry35HistorialSMSWidget(
                readAll: params.getParam('readAll', ParamType.bool),
                createRefund: params.getParam('createRefund', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_34_opcionesSMS',
              path: 'oKFNPayry34OpcionesSMS',
              requireAuth: true,
              builder: (context, params) => OKFNPayry34OpcionesSMSWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_31_detallesdeQR',
              path: 'qrdetails',
              requireAuth: true,
              builder: (context, params) => OKFNPayry31DetallesdeQRWidget(
                registraCobroRef: params.getParam('registraCobroRef',
                    ParamType.DocumentReference, false, ['registraCobro']),
                createRefund: params.getParam('createRefund', ParamType.bool),
                detallesCobroRef: params.getParam('detallesCobroRef',
                    ParamType.DocumentReference, false, ['detallesCobro']),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_37_facturas',
              path: 'oKFNPayry37Facturas',
              requireAuth: true,
              builder: (context, params) => OKFNPayry37FacturasWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_42_Terminosycondiciones',
              path: 'oKFNPayry42Terminosycondiciones',
              builder: (context, params) =>
                  OKFNPayry42TerminosycondicionesWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_36_detallesdeSMS',
              path: 'smsdetails',
              requireAuth: true,
              builder: (context, params) => OKFNPayry36DetallesdeSMSWidget(
                registraCobroRef: params.getParam('registraCobroRef',
                    ParamType.DocumentReference, false, ['registraCobro']),
                createRefund: params.getParam('createRefund', ParamType.bool),
                detallesCobroRef: params.getParam('detallesCobroRef',
                    ParamType.DocumentReference, false, ['detallesCobro']),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_32_solicitarSMS',
              path: 'oKFNPayry32SolicitarSMS',
              requireAuth: true,
              builder: (context, params) => OKFNPayry32SolicitarSMSWidget(
                readSms: params.getParam('readSms', ParamType.bool),
                createRefund: params.getParam('createRefund', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_40_Notificaciones',
              path: 'oKFNPayry40Notificaciones',
              requireAuth: true,
              builder: (context, params) => OKFNPayry40NotificacionesWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_41_FAQs',
              path: 'oKFNPayry41FAQs',
              builder: (context, params) => OKFNPayry41FAQsWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_38_Estadisticas',
              path: 'oKFNPayry38Estadisticas',
              requireAuth: true,
              builder: (context, params) => OKFNPayry38EstadisticasWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_03_onboarding2',
              path: 'oKFNPayry03Onboarding2',
              builder: (context, params) => OKFNPayry03Onboarding2Widget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_04_onboarding3',
              path: 'oKFNPayry04Onboarding3',
              builder: (context, params) => OKFNPayry04Onboarding3Widget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_07_confirmacionCorreoEnviadoRegister',
              path: 'oKFNPayry07ConfirmacionCorreoEnviadoRegister',
              builder: (context, params) =>
                  OKFNPayry07ConfirmacionCorreoEnviadoRegisterWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_10_confirmacionCorreoEnviadoContrasena',
              path: 'oKFNPayry10ConfirmacionCorreoEnviadoContrasena',
              builder: (context, params) =>
                  OKFNPayry10ConfirmacionCorreoEnviadoContrasenaWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_12_confirmacionContrasenaActualizada',
              path: 'oKFNPayry12ConfirmacionContrasenaActualizada',
              builder: (context, params) =>
                  OKFNPayry12ConfirmacionContrasenaActualizadaWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_18_confirmacionTelefono',
              path: 'oKFNPayry18ConfirmacionTelefono',
              requireAuth: true,
              builder: (context, params) =>
                  OKFNPayry18ConfirmacionTelefonoWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_21_confirmacionDatosBancarios',
              path: 'oKFNPayry21ConfirmacionDatosBancarios',
              requireAuth: true,
              builder: (context, params) =>
                  OKFNPayry21ConfirmacionDatosBancariosWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_33_SMSenviado',
              path: 'oKFNPayry33SMSenviado',
              requireAuth: true,
              builder: (context, params) => OKFNPayry33SMSenviadoWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_13_Menumas',
              path: 'oKFNPayry13Menumas',
              requireAuth: true,
              builder: (context, params) => OKFNPayry13MenumasWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_43_Politicadeprivacidad',
              path: 'oKFNPayry43Politicadeprivacidad',
              builder: (context, params) =>
                  OKFNPayry43PoliticadeprivacidadWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_26_Dashboard',
              path: 'dashboard',
              requireAuth: true,
              builder: (context, params) => OKFNPayry26DashboardWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_05_RegisterInv',
              path: 'registerinv/:id',
              builder: (context, params) => OKFNPayry05RegisterInvWidget(
                id: params.getParam('id', ParamType.DocumentReference, false,
                    ['user_invitations']),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_44_historialTransactions',
              path: 'oKFNPayry44HistorialTransactions',
              requireAuth: true,
              builder: (context, params) =>
                  OKFNPayry44HistorialTransactionsWidget(),
            ),
            FFRoute(
              name: 'testShareImage',
              path: 'testShareImage',
              builder: (context, params) => TestShareImageWidget(),
            ),
            FFRoute(
              name: 'OK_FN_Payry_20_datosBancariosVIEW',
              path: 'oKFNPayry20DatosBancariosVIEW',
              builder: (context, params) =>
                  OKFNPayry20DatosBancariosVIEWWidget(),
            ),
            FFRoute(
              name: 'testPage',
              path: 'testPage',
              requireAuth: true,
              builder: (context, params) => TestPageWidget(
                docId: params.getParam('docId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_31_detallesdeQRTemp',
              path: 'qrdetailstemp',
              requireAuth: true,
              builder: (context, params) => OKFNPayry31DetallesdeQRTempWidget(
                registraCobroRef: params.getParam('registraCobroRef',
                    ParamType.DocumentReference, false, ['registraCobro']),
                createRefund: params.getParam('createRefund', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'OK_FN_Payry_36_detallesdeSMSTemp',
              path: 'smsdetailstemp',
              requireAuth: true,
              builder: (context, params) => OKFNPayry36DetallesdeSMSTempWidget(
                registraCobroRef: params.getParam('registraCobroRef',
                    ParamType.DocumentReference, false, ['registraCobro']),
                createRefund: params.getParam('createRefund', ParamType.bool),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/oKFNPayry08Iniciasesion';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/splash-payry-gif.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link') &&
        widget.state.location.contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
