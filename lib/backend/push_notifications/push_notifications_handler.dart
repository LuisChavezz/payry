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
      final initialPage = message.data['initialPage'] as String; // Default FF line

      context.pushNamed(
        initialPage,
        queryParameters: message.data,
      );

      /*final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        print(parameterData.pathParameters);
        print(parameterData.allParams);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }*/
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
  'OK_FN_Payry_05_Registrate': ParameterData.none(),
  'OK_FN_Payry_09_olvidecontrasena': ParameterData.none(),
  'OK_FN_Payry_11_olvidecontrasenanueva': ParameterData.none(),
  'OK_FN_Payry_14_Perfil_PENDSW': ParameterData.none(),
  'OK_FN_Payry_15_EditProfile': ParameterData.none(),
  'OK_FN_Payry_16_verificarNumero': (data) async => ParameterData(
        allParams: {
          'phoneNumber': getParameter<String>(data, 'phoneNumber'),
        },
      ),
  'OK_FN_Payry_17_verificarOTP': (data) async => ParameterData(
        allParams: {
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
          'userName': getParameter<String>(data, 'userName'),
          'userEmail': getParameter<String>(data, 'userEmail'),
          'userBranchId': getParameter<String>(data, 'userBranchId'),
        },
      ),
  'OK_FN_Payry_27_solicitarQR': (data) async => ParameterData(
        allParams: {
          'readQr': getParameter<bool>(data, 'readQr'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
        },
      ),
  'OK_FN_Payry_30_historialQRs': (data) async => ParameterData(
        allParams: {
          'readAll': getParameter<bool>(data, 'readAll'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
          'readAllBranches': getParameter<bool>(data, 'readAllBranches'),
        },
      ),
  'OK_FN_Payry_35_historialSMS': (data) async => ParameterData(
        allParams: {
          'readAll': getParameter<bool>(data, 'readAll'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
          'readAllBranches': getParameter<bool>(data, 'readAllBranches'),
        },
      ),
  'OK_FN_Payry_31_detallesdeQR': (data) async => ParameterData(
        allParams: {
          'registraCobroRef':
              getParameter<DocumentReference>(data, 'registraCobroRef'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
          'detallesCobroRef':
              getParameter<DocumentReference>(data, 'detallesCobroRef'),
        },
      ),
  'OK_FN_Payry_37_facturas': ParameterData.none(),
  'OK_FN_Payry_42_Terminosycondiciones': ParameterData.none(),
  'OK_FN_Payry_36_detallesdeSMS': (data) async => ParameterData(
        allParams: {
          'registraCobroRef':
              getParameter<DocumentReference>(data, 'registraCobroRef'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
          'detallesCobroRef':
              getParameter<DocumentReference>(data, 'detallesCobroRef'),
        },
      ),
  'OK_FN_Payry_32_solicitarSMS': (data) async => ParameterData(
        allParams: {
          'readSms': getParameter<bool>(data, 'readSms'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
        },
      ),
  'OK_FN_Payry_40_Notificaciones': ParameterData.none(),
  'OK_FN_Payry_41_FAQs': ParameterData.none(),
  'OK_FN_Payry_38_Estadisticas': ParameterData.none(),
  'OK_FN_Payry_10_confirmacionCorreoEnviadoContrasena': ParameterData.none(),
  'OK_FN_Payry_12_confirmacionContrasenaActualizada': ParameterData.none(),
  'OK_FN_Payry_21_confirmacionDatosBancarios': ParameterData.none(),
  'OK_FN_Payry_13_Menumas': (data) async => ParameterData(
        allParams: {
          'showWT': getParameter<bool>(data, 'showWT'),
        },
      ),
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
  'OK_FN_Payry_31_detallesdeQRCode': (data) async => ParameterData(
        allParams: {
          'registraCobroRef':
              getParameter<DocumentReference>(data, 'registraCobroRef'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
        },
      ),
  'OK_FN_Payry_36_detallesdeSMSCode': (data) async => ParameterData(
        allParams: {
          'registraCobroRef':
              getParameter<DocumentReference>(data, 'registraCobroRef'),
          'createRefund': getParameter<bool>(data, 'createRefund'),
        },
      ),
  'OK_FN_Payry_sucursales': (data) async => ParameterData(
        allParams: {
          'companyId': getParameter<String>(data, 'companyId'),
        },
      ),
  'OK_FN_Payry_registrarSucursal': (data) async => ParameterData(
        allParams: {
          'companyId': getParameter<String>(data, 'companyId'),
        },
      ),
  'OK_FN_Payry_editarSucursal': (data) async => ParameterData(
        allParams: {
          'companyId': getParameter<String>(data, 'companyId'),
          'branchDocRef': getParameter<DocumentReference>(data, 'branchDocRef'),
        },
      ),
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
