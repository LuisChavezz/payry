import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SucursalesRecord extends FirestoreRecord {
  SucursalesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "cuenta" field.
  String? _cuenta;
  String get cuenta => _cuenta ?? '';
  bool hasCuenta() => _cuenta != null;

  // "empresa_id" field.
  String? _empresaId;
  String get empresaId => _empresaId ?? '';
  bool hasEmpresaId() => _empresaId != null;

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "bankid" field.
  String? _bankid;
  String get bankid => _bankid ?? '';
  bool hasBankid() => _bankid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "street_number" field.
  String? _streetNumber;
  String get streetNumber => _streetNumber ?? '';
  bool hasStreetNumber() => _streetNumber != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "bank_name" field.
  String? _bankName;
  String get bankName => _bankName ?? '';
  bool hasBankName() => _bankName != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _cuenta = snapshotData['cuenta'] as String?;
    _empresaId = snapshotData['empresa_id'] as String?;
    _adminId = snapshotData['admin_id'] as String?;
    _bankid = snapshotData['bankid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _street = snapshotData['street'] as String?;
    _streetNumber = snapshotData['street_number'] as String?;
    _status = snapshotData['status'] as bool?;
    _bankName = snapshotData['bank_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sucursales');

  static Stream<SucursalesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SucursalesRecord.fromSnapshot(s));

  static Future<SucursalesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SucursalesRecord.fromSnapshot(s));

  static SucursalesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SucursalesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SucursalesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SucursalesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SucursalesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SucursalesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSucursalesRecordData({
  String? id,
  String? nombre,
  String? cuenta,
  String? empresaId,
  String? adminId,
  String? bankid,
  DateTime? createdTime,
  String? street,
  String? streetNumber,
  bool? status,
  String? bankName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'nombre': nombre,
      'cuenta': cuenta,
      'empresa_id': empresaId,
      'admin_id': adminId,
      'bankid': bankid,
      'created_time': createdTime,
      'street': street,
      'street_number': streetNumber,
      'status': status,
      'bank_name': bankName,
    }.withoutNulls,
  );

  return firestoreData;
}

class SucursalesRecordDocumentEquality implements Equality<SucursalesRecord> {
  const SucursalesRecordDocumentEquality();

  @override
  bool equals(SucursalesRecord? e1, SucursalesRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.nombre == e2?.nombre &&
        e1?.cuenta == e2?.cuenta &&
        e1?.empresaId == e2?.empresaId &&
        e1?.adminId == e2?.adminId &&
        e1?.bankid == e2?.bankid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.street == e2?.street &&
        e1?.streetNumber == e2?.streetNumber &&
        e1?.status == e2?.status &&
        e1?.bankName == e2?.bankName;
  }

  @override
  int hash(SucursalesRecord? e) => const ListEquality().hash([
        e?.id,
        e?.nombre,
        e?.cuenta,
        e?.empresaId,
        e?.adminId,
        e?.bankid,
        e?.createdTime,
        e?.street,
        e?.streetNumber,
        e?.status,
        e?.bankName
      ]);

  @override
  bool isValidKey(Object? o) => o is SucursalesRecord;
}
