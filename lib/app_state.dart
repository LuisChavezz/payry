import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
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
    _safeInit(() {
      if (prefs.containsKey('ff_walkthroughs')) {
        try {
          _walkthroughs = jsonDecode(prefs.getString('ff_walkthroughs') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _transactionsCount =
          prefs.getDouble('ff_transactionsCount') ?? _transactionsCount;
    });
    _safeInit(() {
      _rateAppSkipDay = prefs.containsKey('ff_rateAppSkipDay')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_rateAppSkipDay')!)
          : _rateAppSkipDay;
    });
    _safeInit(() {
      _isRatedApp = prefs.getBool('ff_isRatedApp') ?? _isRatedApp;
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

  dynamic _walkthroughs;
  dynamic get walkthroughs => _walkthroughs;
  set walkthroughs(dynamic _value) {
    _walkthroughs = _value;
    prefs.setString('ff_walkthroughs', jsonEncode(_value));
  }

  double _transactionsCount = 0.0;
  double get transactionsCount => _transactionsCount;
  set transactionsCount(double _value) {
    _transactionsCount = _value;
    prefs.setDouble('ff_transactionsCount', _value);
  }

  DateTime? _rateAppSkipDay =
      DateTime.fromMillisecondsSinceEpoch(1713275820000);
  DateTime? get rateAppSkipDay => _rateAppSkipDay;
  set rateAppSkipDay(DateTime? _value) {
    _rateAppSkipDay = _value;
    _value != null
        ? prefs.setInt('ff_rateAppSkipDay', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_rateAppSkipDay');
  }

  bool _isRatedApp = false;
  bool get isRatedApp => _isRatedApp;
  set isRatedApp(bool _value) {
    _isRatedApp = _value;
    prefs.setBool('ff_isRatedApp', _value);
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
