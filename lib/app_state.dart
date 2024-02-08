import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _notify = prefs.getBool('ff_notify') ?? _notify;
    });
    _safeInit(() {
      _serverToken = prefs.getString('ff_serverToken') ?? _serverToken;
    });
    _safeInit(() {
      _rememberMe = prefs.getBool('ff_rememberMe') ?? _rememberMe;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userCredentials')) {
        try {
          _userCredentials =
              jsonDecode(prefs.getString('ff_userCredentials') ?? '');
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

  late SharedPreferences prefs;

  bool _isSearch = false;
  bool get isSearch => _isSearch;
  set isSearch(bool _value) {
    _isSearch = _value;
  }

  bool _notify = true;
  bool get notify => _notify;
  set notify(bool _value) {
    _notify = _value;
    prefs.setBool('ff_notify', _value);
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
    prefs.setString('ff_serverToken', _value);
  }

  bool _rememberMe = true;
  bool get rememberMe => _rememberMe;
  set rememberMe(bool _value) {
    _rememberMe = _value;
    prefs.setBool('ff_rememberMe', _value);
  }

  dynamic _userCredentials;
  dynamic get userCredentials => _userCredentials;
  set userCredentials(dynamic _value) {
    _userCredentials = _value;
    prefs.setString('ff_userCredentials', jsonEncode(_value));
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
