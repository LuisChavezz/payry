import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistraCobroRecord extends FirestoreRecord {
  RegistraCobroRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "concept" field.
  String? _concept;
  String get concept => _concept ?? '';
  bool hasConcept() => _concept != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "qr_url" field.
  String? _qrUrl;
  String get qrUrl => _qrUrl ?? '';
  bool hasQrUrl() => _qrUrl != null;

  // "shareable_qr_url" field.
  String? _shareableQrUrl;
  String get shareableQrUrl => _shareableQrUrl ?? '';
  bool hasShareableQrUrl() => _shareableQrUrl != null;

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "type" field.
  PaymentType? _type;
  PaymentType? get type => _type;
  bool hasType() => _type != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "errorMessage" field.
  String? _errorMessage;
  String get errorMessage => _errorMessage ?? '';
  bool hasErrorMessage() => _errorMessage != null;

  // "errorOcurs" field.
  bool? _errorOcurs;
  bool get errorOcurs => _errorOcurs ?? false;
  bool hasErrorOcurs() => _errorOcurs != null;

  // "numeroReferenciaComercio" field.
  double? _numeroReferenciaComercio;
  double get numeroReferenciaComercio => _numeroReferenciaComercio ?? 0.0;
  bool hasNumeroReferenciaComercio() => _numeroReferenciaComercio != null;

  // "status" field.
  PaymentStatus? _status;
  PaymentStatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _concept = snapshotData['concept'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _qrUrl = snapshotData['qr_url'] as String?;
    _shareableQrUrl = snapshotData['shareable_qr_url'] as String?;
    _companyId = snapshotData['company_id'] as String?;
    _type = deserializeEnum<PaymentType>(snapshotData['type']);
    _id = snapshotData['id'] as String?;
    _errorMessage = snapshotData['errorMessage'] as String?;
    _errorOcurs = snapshotData['errorOcurs'] as bool?;
    _numeroReferenciaComercio =
        castToType<double>(snapshotData['numeroReferenciaComercio']);
    _status = deserializeEnum<PaymentStatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('registraCobro');

  static Stream<RegistraCobroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RegistraCobroRecord.fromSnapshot(s));

  static Future<RegistraCobroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RegistraCobroRecord.fromSnapshot(s));

  static RegistraCobroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RegistraCobroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RegistraCobroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RegistraCobroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RegistraCobroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RegistraCobroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRegistraCobroRecordData({
  String? adminId,
  double? amount,
  String? concept,
  DateTime? createdTime,
  String? phoneNumber,
  String? uid,
  String? qrUrl,
  String? shareableQrUrl,
  String? companyId,
  PaymentType? type,
  String? id,
  String? errorMessage,
  bool? errorOcurs,
  double? numeroReferenciaComercio,
  PaymentStatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'amount': amount,
      'concept': concept,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'uid': uid,
      'qr_url': qrUrl,
      'shareable_qr_url': shareableQrUrl,
      'company_id': companyId,
      'type': type,
      'id': id,
      'errorMessage': errorMessage,
      'errorOcurs': errorOcurs,
      'numeroReferenciaComercio': numeroReferenciaComercio,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class RegistraCobroRecordDocumentEquality
    implements Equality<RegistraCobroRecord> {
  const RegistraCobroRecordDocumentEquality();

  @override
  bool equals(RegistraCobroRecord? e1, RegistraCobroRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.amount == e2?.amount &&
        e1?.concept == e2?.concept &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.qrUrl == e2?.qrUrl &&
        e1?.shareableQrUrl == e2?.shareableQrUrl &&
        e1?.companyId == e2?.companyId &&
        e1?.type == e2?.type &&
        e1?.id == e2?.id &&
        e1?.errorMessage == e2?.errorMessage &&
        e1?.errorOcurs == e2?.errorOcurs &&
        e1?.numeroReferenciaComercio == e2?.numeroReferenciaComercio &&
        e1?.status == e2?.status;
  }

  @override
  int hash(RegistraCobroRecord? e) => const ListEquality().hash([
        e?.adminId,
        e?.amount,
        e?.concept,
        e?.createdTime,
        e?.phoneNumber,
        e?.uid,
        e?.qrUrl,
        e?.shareableQrUrl,
        e?.companyId,
        e?.type,
        e?.id,
        e?.errorMessage,
        e?.errorOcurs,
        e?.numeroReferenciaComercio,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is RegistraCobroRecord;
}
