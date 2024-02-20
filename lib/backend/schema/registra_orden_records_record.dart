import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistraOrdenRecordsRecord extends FirestoreRecord {
  RegistraOrdenRecordsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "claveRastreo" field.
  String? _claveRastreo;
  String get claveRastreo => _claveRastreo ?? '';
  bool hasClaveRastreo() => _claveRastreo != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "conceptoPago" field.
  String? _conceptoPago;
  String get conceptoPago => _conceptoPago ?? '';
  bool hasConceptoPago() => _conceptoPago != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "cuentaBeneficiario" field.
  String? _cuentaBeneficiario;
  String get cuentaBeneficiario => _cuentaBeneficiario ?? '';
  bool hasCuentaBeneficiario() => _cuentaBeneficiario != null;

  // "cuentaOrdenante" field.
  String? _cuentaOrdenante;
  String get cuentaOrdenante => _cuentaOrdenante ?? '';
  bool hasCuentaOrdenante() => _cuentaOrdenante != null;

  // "empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  bool hasErrorMessage() => _errorMessage != null;

  // "errorOcurs" field.
  bool? _errorOcurs;
  bool get errorOcurs => _errorOcurs ?? false;
  bool hasErrorOcurs() => _errorOcurs != null;

  // "folioOrigen" field.
  String? _folioOrigen;
  String get folioOrigen => _folioOrigen ?? '';
  bool hasFolioOrigen() => _folioOrigen != null;

  // "institucionContraparte" field.
  double? _institucionContraparte;
  double get institucionContraparte => _institucionContraparte ?? 0.0;
  bool hasInstitucionContraparte() => _institucionContraparte != null;

  // "institucionOperante" field.
  double? _institucionOperante;
  double get institucionOperante => _institucionOperante ?? 0.0;
  bool hasInstitucionOperante() => _institucionOperante != null;

  // "monto" field.
  String? _monto;
  String get monto => _monto ?? '';
  bool hasMonto() => _monto != null;

  // "nombreBeneficiario" field.
  String? _nombreBeneficiario;
  String get nombreBeneficiario => _nombreBeneficiario ?? '';
  bool hasNombreBeneficiario() => _nombreBeneficiario != null;

  // "nombreOrdenante" field.
  String? _nombreOrdenante;
  String get nombreOrdenante => _nombreOrdenante ?? '';
  bool hasNombreOrdenante() => _nombreOrdenante != null;

  // "referenciaNumerica" field.
  double? _referenciaNumerica;
  double get referenciaNumerica => _referenciaNumerica ?? 0.0;
  bool hasReferenciaNumerica() => _referenciaNumerica != null;

  // "rfcCurpBeneficiario" field.
  String? _rfcCurpBeneficiario;
  String get rfcCurpBeneficiario => _rfcCurpBeneficiario ?? '';
  bool hasRfcCurpBeneficiario() => _rfcCurpBeneficiario != null;

  // "rfcCurpOrdenante" field.
  String? _rfcCurpOrdenante;
  String get rfcCurpOrdenante => _rfcCurpOrdenante ?? '';
  bool hasRfcCurpOrdenante() => _rfcCurpOrdenante != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "stpResponseCode" field.
  double? _stpResponseCode;
  double get stpResponseCode => _stpResponseCode ?? 0.0;
  bool hasStpResponseCode() => _stpResponseCode != null;

  // "tipoCuentaBeneficiario" field.
  int? _tipoCuentaBeneficiario;
  int get tipoCuentaBeneficiario => _tipoCuentaBeneficiario ?? 0;
  bool hasTipoCuentaBeneficiario() => _tipoCuentaBeneficiario != null;

  // "tipoCuentaOrdenante" field.
  int? _tipoCuentaOrdenante;
  int get tipoCuentaOrdenante => _tipoCuentaOrdenante ?? 0;
  bool hasTipoCuentaOrdenante() => _tipoCuentaOrdenante != null;

  // "tipoPago" field.
  int? _tipoPago;
  int get tipoPago => _tipoPago ?? 0;
  bool hasTipoPago() => _tipoPago != null;

  // "total_bruto" field.
  double? _totalBruto;
  double get totalBruto => _totalBruto ?? 0.0;
  bool hasTotalBruto() => _totalBruto != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _claveRastreo = snapshotData['claveRastreo'] as String?;
    _companyId = snapshotData['company_id'] as String?;
    _conceptoPago = snapshotData['conceptoPago'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _cuentaBeneficiario = snapshotData['cuentaBeneficiario'] as String?;
    _cuentaOrdenante = snapshotData['cuentaOrdenante'] as String?;
    _empresa = snapshotData['empresa'] as String?;
    _errorMessage = snapshotData['errorMessage'] as String?;
    _errorOcurs = snapshotData['errorOcurs'] as bool?;
    _folioOrigen = snapshotData['folioOrigen'] as String?;
    _institucionContraparte =
        castToType<double>(snapshotData['institucionContraparte']);
    _institucionOperante =
        castToType<double>(snapshotData['institucionOperante']);
    _monto = snapshotData['monto'] as String?;
    _nombreBeneficiario = snapshotData['nombreBeneficiario'] as String?;
    _nombreOrdenante = snapshotData['nombreOrdenante'] as String?;
    _referenciaNumerica =
        castToType<double>(snapshotData['referenciaNumerica']);
    _rfcCurpBeneficiario = snapshotData['rfcCurpBeneficiario'] as String?;
    _rfcCurpOrdenante = snapshotData['rfcCurpOrdenante'] as String?;
    _status = snapshotData['status'] as String?;
    _stpResponseCode = castToType<double>(snapshotData['stpResponseCode']);
    _tipoCuentaBeneficiario =
        castToType<int>(snapshotData['tipoCuentaBeneficiario']);
    _tipoCuentaOrdenante = castToType<int>(snapshotData['tipoCuentaOrdenante']);
    _tipoPago = castToType<int>(snapshotData['tipoPago']);
    _totalBruto = castToType<double>(snapshotData['total_bruto']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registra_orden_records');

  static Stream<RegistraOrdenRecordsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => RegistraOrdenRecordsRecord.fromSnapshot(s));

  static Future<RegistraOrdenRecordsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RegistraOrdenRecordsRecord.fromSnapshot(s));

  static RegistraOrdenRecordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistraOrdenRecordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistraOrdenRecordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistraOrdenRecordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistraOrdenRecordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistraOrdenRecordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistraOrdenRecordsRecordData({
  String? adminId,
  String? claveRastreo,
  String? companyId,
  String? conceptoPago,
  DateTime? createdTime,
  String? cuentaBeneficiario,
  String? cuentaOrdenante,
  String? empresa,
  String? errorMessage,
  bool? errorOcurs,
  String? folioOrigen,
  double? institucionContraparte,
  double? institucionOperante,
  String? monto,
  String? nombreBeneficiario,
  String? nombreOrdenante,
  double? referenciaNumerica,
  String? rfcCurpBeneficiario,
  String? rfcCurpOrdenante,
  String? status,
  double? stpResponseCode,
  int? tipoCuentaBeneficiario,
  int? tipoCuentaOrdenante,
  int? tipoPago,
  double? totalBruto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'claveRastreo': claveRastreo,
      'company_id': companyId,
      'conceptoPago': conceptoPago,
      'created_time': createdTime,
      'cuentaBeneficiario': cuentaBeneficiario,
      'cuentaOrdenante': cuentaOrdenante,
      'empresa': empresa,
      'errorMessage': errorMessage,
      'errorOcurs': errorOcurs,
      'folioOrigen': folioOrigen,
      'institucionContraparte': institucionContraparte,
      'institucionOperante': institucionOperante,
      'monto': monto,
      'nombreBeneficiario': nombreBeneficiario,
      'nombreOrdenante': nombreOrdenante,
      'referenciaNumerica': referenciaNumerica,
      'rfcCurpBeneficiario': rfcCurpBeneficiario,
      'rfcCurpOrdenante': rfcCurpOrdenante,
      'status': status,
      'stpResponseCode': stpResponseCode,
      'tipoCuentaBeneficiario': tipoCuentaBeneficiario,
      'tipoCuentaOrdenante': tipoCuentaOrdenante,
      'tipoPago': tipoPago,
      'total_bruto': totalBruto,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegistraOrdenRecordsRecordDocumentEquality
    implements Equality<RegistraOrdenRecordsRecord> {
  const RegistraOrdenRecordsRecordDocumentEquality();

  @override
  bool equals(RegistraOrdenRecordsRecord? e1, RegistraOrdenRecordsRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.claveRastreo == e2?.claveRastreo &&
        e1?.companyId == e2?.companyId &&
        e1?.conceptoPago == e2?.conceptoPago &&
        e1?.createdTime == e2?.createdTime &&
        e1?.cuentaBeneficiario == e2?.cuentaBeneficiario &&
        e1?.cuentaOrdenante == e2?.cuentaOrdenante &&
        e1?.empresa == e2?.empresa &&
        e1?.errorMessage == e2?.errorMessage &&
        e1?.errorOcurs == e2?.errorOcurs &&
        e1?.folioOrigen == e2?.folioOrigen &&
        e1?.institucionContraparte == e2?.institucionContraparte &&
        e1?.institucionOperante == e2?.institucionOperante &&
        e1?.monto == e2?.monto &&
        e1?.nombreBeneficiario == e2?.nombreBeneficiario &&
        e1?.nombreOrdenante == e2?.nombreOrdenante &&
        e1?.referenciaNumerica == e2?.referenciaNumerica &&
        e1?.rfcCurpBeneficiario == e2?.rfcCurpBeneficiario &&
        e1?.rfcCurpOrdenante == e2?.rfcCurpOrdenante &&
        e1?.status == e2?.status &&
        e1?.stpResponseCode == e2?.stpResponseCode &&
        e1?.tipoCuentaBeneficiario == e2?.tipoCuentaBeneficiario &&
        e1?.tipoCuentaOrdenante == e2?.tipoCuentaOrdenante &&
        e1?.tipoPago == e2?.tipoPago &&
        e1?.totalBruto == e2?.totalBruto;
  }

  @override
  int hash(RegistraOrdenRecordsRecord? e) => const ListEquality().hash([
        e?.adminId,
        e?.claveRastreo,
        e?.companyId,
        e?.conceptoPago,
        e?.createdTime,
        e?.cuentaBeneficiario,
        e?.cuentaOrdenante,
        e?.empresa,
        e?.errorMessage,
        e?.errorOcurs,
        e?.folioOrigen,
        e?.institucionContraparte,
        e?.institucionOperante,
        e?.monto,
        e?.nombreBeneficiario,
        e?.nombreOrdenante,
        e?.referenciaNumerica,
        e?.rfcCurpBeneficiario,
        e?.rfcCurpOrdenante,
        e?.status,
        e?.stpResponseCode,
        e?.tipoCuentaBeneficiario,
        e?.tipoCuentaOrdenante,
        e?.tipoPago,
        e?.totalBruto
      ]);

  @override
  bool isValidKey(Object? o) => o is RegistraOrdenRecordsRecord;
}
