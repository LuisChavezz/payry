import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _notify = await secureStorage.getBool('ff_notify') ?? _notify;
    });
    await _safeInitAsync(() async {
      _serverToken =
          await secureStorage.getString('ff_serverToken') ?? _serverToken;
    });
    await _safeInitAsync(() async {
      _rememberMe = await secureStorage.getBool('ff_rememberMe') ?? _rememberMe;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_userCredentials') != null) {
        try {
          _userCredentials = jsonDecode(
              await secureStorage.getString('ff_userCredentials') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _isSearch = false;
  bool get isSearch => _isSearch;
  set isSearch(bool _value) {
    _isSearch = _value;
  }

  bool _notify = true;
  bool get notify => _notify;
  set notify(bool _value) {
    _notify = _value;
    secureStorage.setBool('ff_notify', _value);
  }

  void deleteNotify() {
    secureStorage.delete(key: 'ff_notify');
  }

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String _value) {
    _phoneNumber = _value;
  }

  DocumentReference? _tempUserReference;
  DocumentReference? get tempUserReference => _tempUserReference;
  set tempUserReference(DocumentReference? _value) {
    _tempUserReference = _value;
  }

  String _serverToken = '';
  String get serverToken => _serverToken;
  set serverToken(String _value) {
    _serverToken = _value;
    secureStorage.setString('ff_serverToken', _value);
  }

  void deleteServerToken() {
    secureStorage.delete(key: 'ff_serverToken');
  }

  bool _rememberMe = true;
  bool get rememberMe => _rememberMe;
  set rememberMe(bool _value) {
    _rememberMe = _value;
    secureStorage.setBool('ff_rememberMe', _value);
  }

  void deleteRememberMe() {
    secureStorage.delete(key: 'ff_rememberMe');
  }

  dynamic _userCredentials;
  dynamic get userCredentials => _userCredentials;
  set userCredentials(dynamic _value) {
    _userCredentials = _value;
    secureStorage.setString('ff_userCredentials', jsonEncode(_value));
  }

  void deleteUserCredentials() {
    secureStorage.delete(key: 'ff_userCredentials');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
