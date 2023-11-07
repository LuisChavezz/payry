import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SmsRecord extends FirestoreRecord {
  SmsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "sms_id" field.
  String? _smsId;
  String get smsId => _smsId ?? '';
  bool hasSmsId() => _smsId != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "concept" field.
  String? _concept;
  String get concept => _concept ?? '';
  bool hasConcept() => _concept != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "voucher_url" field.
  String? _voucherUrl;
  String get voucherUrl => _voucherUrl ?? '';
  bool hasVoucherUrl() => _voucherUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _adminId = snapshotData['admin_id'] as String?;
    _smsId = snapshotData['sms_id'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _concept = snapshotData['concept'] as String?;
    _status = snapshotData['status'] as String?;
    _voucherUrl = snapshotData['voucher_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sms');

  static Stream<SmsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SmsRecord.fromSnapshot(s));

  static Future<SmsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SmsRecord.fromSnapshot(s));

  static SmsRecord fromSnapshot(DocumentSnapshot snapshot) => SmsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SmsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SmsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SmsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SmsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSmsRecordData({
  String? uid,
  String? adminId,
  String? smsId,
  double? amount,
  String? concept,
  String? status,
  String? voucherUrl,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'admin_id': adminId,
      'sms_id': smsId,
      'amount': amount,
      'concept': concept,
      'status': status,
      'voucher_url': voucherUrl,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class SmsRecordDocumentEquality implements Equality<SmsRecord> {
  const SmsRecordDocumentEquality();

  @override
  bool equals(SmsRecord? e1, SmsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.adminId == e2?.adminId &&
        e1?.smsId == e2?.smsId &&
        e1?.amount == e2?.amount &&
        e1?.concept == e2?.concept &&
        e1?.status == e2?.status &&
        e1?.voucherUrl == e2?.voucherUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(SmsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.adminId,
        e?.smsId,
        e?.amount,
        e?.concept,
        e?.status,
        e?.voucherUrl,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is SmsRecord;
}
