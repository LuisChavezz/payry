import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/splash-payry-gif.gif',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'OK_FN_Payry_08_iniciasesion': ParameterData.none(),
  'OK_FN_Payry_05_Registrate': (data) async => ParameterData(
        allParams: {
          'id': getParameter<DocumentReference>(data, 'id'),
        },
      ),
  'OK_FN_Payry_09_olvidecontrasena': ParameterData.none(),
  'OK_FN_Payry_01_Splash': ParameterData.none(),
  'OK_FN_Payry_02_onboarding1': ParameterData.none(),
  'OK_FN_Payry_06_confirmacionRegistro': ParameterData.none(),
  'OK_FN_Payry_11_olvidecontrasenanueva': ParameterData.none(),
  'OK_FN_Payry_14_Perfil_PENDSW': ParameterData.none(),
  'OK_FN_Payry_15_EditProfile': ParameterData.none(),
  'OK_FN_Payry_16_verificarNumero': ParameterData.none(),
  'OK_FN_Payry_17_verificarOTP': (data) async => ParameterData(
        allParams: {
          'otpCode': getParameter<String>(data, 'otpCode'),
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
        },
      ),
  'OK_FN_Payry_19_formularioEmpresa': ParameterData.none(),
  'OK_FN_Payry_20_datosBancarios': (data) async => ParameterData(
        allParams: {
          'companyDocRef':
              getParameter<DocumentReference>(data, 'companyDocRef'),
          'clabe': getParameter<String>(data, 'clabe'),
          'bank': getParameter<String>(data, 'bank'),
        },
      ),
  'OK_FN_Payry_22_conexionAPI': ParameterData.none(),
  'OK_FN_Payry_23_invitarUsuario': ParameterData.none(),
  'OK_FN_Payry_24_listadoUsuarios': ParameterData.none(),
  'OK_FN_Payry_25_permisos': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'OK_FN_Payry_27_solicitarQR': ParameterData.none(),
  'OK_FN_Payry_28_qrGenerado': (data) async => ParameterData(
        allParams: {
          'createdQrReference':
              getParameter<DocumentReference>(data, 'createdQrReference'),
        },
      ),
  'OK_FN_Payry_29_opcionesQR': ParameterData.none(),
  'OK_FN_Payry_30_historialQRs': ParameterData.none(),
  'OK_FN_Payry_35_historialSMS': ParameterData.none(),
  'OK_FN_Payry_34_opcionesSMS': ParameterData.none(),
  'OK_FN_Payry_31_detallesdeQR': (data) async => ParameterData(
        allParams: {
          'qrDocReference':
              getParameter<DocumentReference>(data, 'qrDocReference'),
        },
      ),
  'OK_FN_Payry_37_facturas': ParameterData.none(),
  'OK_FN_Payry_42_Terminosycondiciones': ParameterData.none(),
  'OK_FN_Payry_36_detallesdeSMS': (data) async => ParameterData(
        allParams: {
          'smsDocReference':
              getParameter<DocumentReference>(data, 'smsDocReference'),
        },
      ),
  'OK_FN_Payry_32_solicitarSMS': ParameterData.none(),
  'OK_FN_Payry_40_Notificaciones': ParameterData.none(),
  'OK_FN_Payry_41_FAQs': ParameterData.none(),
  'OK_FN_Payry_38_Estadisticas': ParameterData.none(),
  'OK_FN_Payry_03_onboarding2': ParameterData.none(),
  'OK_FN_Payry_04_onboarding3': ParameterData.none(),
  'OK_FN_Payry_07_confirmacionCorreoEnviadoRegister': ParameterData.none(),
  'OK_FN_Payry_10_confirmacionCorreoEnviadoContrasena': ParameterData.none(),
  'OK_FN_Payry_12_confirmacionContrasenaActualizada': ParameterData.none(),
  'OK_FN_Payry_18_confirmacionTelefono': ParameterData.none(),
  'OK_FN_Payry_21_confirmacionDatosBancarios': ParameterData.none(),
  'OK_FN_Payry_33_SMSenviado': ParameterData.none(),
  'OK_FN_Payry_13_Menumas': ParameterData.none(),
  'OK_FN_Payry_43_Politicadeprivacidad': ParameterData.none(),
  'OK_FN_Payry_26_Dashboard': ParameterData.none(),
  'OK_FN_Payry_05_RegisterInv': (data) async {
    final allParams = {
      'id': getParameter<DocumentReference>(data, 'id'),
    };
    return ParameterData(
      requiredParams: {
        'id': serializeParam(
          allParams['id'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'OK_FN_Payry_44_historialTransactions': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
