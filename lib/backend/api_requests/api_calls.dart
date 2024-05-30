import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start auth Group Code

class AuthGroup {
  static String getBaseUrl() => 'https://api.payry.mx/auth';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GenerateTokenCall generateTokenCall = GenerateTokenCall();
  static SendWelcomeEmailCall sendWelcomeEmailCall = SendWelcomeEmailCall();
  static VerifyEmailCall verifyEmailCall = VerifyEmailCall();
  static SendInvitationCall sendInvitationCall = SendInvitationCall();
}

class GenerateTokenCall {
  Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Token',
      apiUrl: '${baseUrl}/generateToken',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? errorMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class SendWelcomeEmailCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Send Welcome Email',
      apiUrl: '${baseUrl}/welcome_email/${email}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyEmailCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Verify Email',
      apiUrl: '${baseUrl}/send-verify-mail',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SendInvitationCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
  }) async {
    final baseUrl = AuthGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send Invitation',
      apiUrl: '${baseUrl}/invite',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

/// End auth Group Code

/// Start STP Group Code

class StpGroup {
  static String getBaseUrl() => 'https://api.payry.mx/stp';
  static Map<String, String> headers = {};
  static GenerateCodiCall generateCodiCall = GenerateCodiCall();
  static GenerateDimoCall generateDimoCall = GenerateDimoCall();
  static GetBalanceCall getBalanceCall = GetBalanceCall();
  static GetMiscCompanyCall getMiscCompanyCall = GetMiscCompanyCall();
  static RefundCall refundCall = RefundCall();
}

class GenerateCodiCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
  }) async {
    final baseUrl = StpGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Codi',
      apiUrl: '${baseUrl}/cobro-qr',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GenerateDimoCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    final baseUrl = StpGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Generate Dimo',
      apiUrl: '${baseUrl}/cobro-sms',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetBalanceCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = StpGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Balance',
      apiUrl: '${baseUrl}/balance',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? balance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.balance''',
      ));
  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetMiscCompanyCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = StpGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get MiscCompany',
      apiUrl: '${baseUrl}/misc',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RefundCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    final baseUrl = StpGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "id": "${id}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Refund',
      apiUrl: '${baseUrl}/refund/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End STP Group Code

/// Start Users Group Code

class UsersGroup {
  static String getBaseUrl() => 'https://api.payry.mx/users';
  static Map<String, String> headers = {};
  static NotifyCreationToAdminCall notifyCreationToAdminCall =
      NotifyCreationToAdminCall();
}

class NotifyCreationToAdminCall {
  Future<ApiCallResponse> call({
    String? uid = '',
    String? token = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Notify Creation To Admin',
      apiUrl: '${baseUrl}/notifyCreationToAdmin/${uid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
}

/// End Users Group Code

/// Start SQL report Group Code

class SQLReportGroup {
  static String getBaseUrl() => 'https://api.payry.mx/sqlReport';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static ReportCompanyCall reportCompanyCall = ReportCompanyCall();
  static ReportUserCall reportUserCall = ReportUserCall();
}

class ReportCompanyCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    final baseUrl = SQLReportGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Report Company',
      apiUrl: '${baseUrl}/reportCompanyToSQL/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ReportUserCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? id = '',
  }) async {
    final baseUrl = SQLReportGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Report User',
      apiUrl: '${baseUrl}/reportUserToSQL/${id}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End SQL report Group Code

class GetStatisticsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? startDate = '',
    String? endDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "startDate": "${startDate}",
  "endDate": "${endDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Statistics',
      apiUrl: 'https://api.payry.mx/statistics',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? companyID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.company_id''',
      ));
  static String? startDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.startDate''',
      ));
  static String? endDate(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.endDate''',
      ));
  static String? cobrosRealizados(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.cobrosRealizados''',
      ));
  static String? importeTotalCobros(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.importeTotalCobros''',
      ));
  static String? transferenciasPayry(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.transferenciasPayry''',
      ));
  static String? costoEnComisiones(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.costoEnComisiones''',
      ));
  static String? pagosConQR(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.pagosConQR''',
      ));
  static String? sumaPagosConQR(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.sumaPagosConQR''',
      ));
  static String? porcentajePagosConQR(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.porcentajePagosConQR''',
      ));
  static String? pagosConSMS(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.pagosConSMS''',
      ));
  static String? sumaPagosConSMS(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.sumaPagosConSMS''',
      ));
  static String? porcentajePagosConSMS(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.porcentajePagosConSMS''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static dynamic? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class RequestVerifyPhoneCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Request verify phone',
      apiUrl: 'https://api.payry.mx/verify-phone',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

class VerifyPhoneCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? otp = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Verify phone',
      apiUrl: 'https://api.payry.mx/verify-phone/${otp}',
      callType: ApiCallType.PATCH,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? dataMessage(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? status(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class SendSmsCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? to = '',
    String? body = '',
  }) async {
    final ffApiRequestBody = '''
{
  "to": "${to}",
  "body": "${body}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Send sms',
      apiUrl: 'https://api.payry.mx/sendSms',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
