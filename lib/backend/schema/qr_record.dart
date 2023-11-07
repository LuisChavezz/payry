import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrRecord extends FirestoreRecord {
  QrRecord._(
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

  // "qr_id" field.
  String? _qrId;
  String get qrId => _qrId ?? '';
  bool hasQrId() => _qrId != null;

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

  // "qr_url" field.
  String? _qrUrl;
  String get qrUrl => _qrUrl ?? '';
  bool hasQrUrl() => _qrUrl != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _adminId = snapshotData['admin_id'] as String?;
    _qrId = snapshotData['qr_id'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _concept = snapshotData['concept'] as String?;
    _status = snapshotData['status'] as String?;
    _voucherUrl = snapshotData['voucher_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _qrUrl = snapshotData['qr_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qr');

  static Stream<QrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrRecord.fromSnapshot(s));

  static Future<QrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrRecord.fromSnapshot(s));

  static QrRecord fromSnapshot(DocumentSnapshot snapshot) => QrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrRecordData({
  String? uid,
  String? adminId,
  String? qrId,
  double? amount,
  String? concept,
  String? status,
  String? voucherUrl,
  DateTime? createdTime,
  String? qrUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'admin_id': adminId,
      'qr_id': qrId,
      'amount': amount,
      'concept': concept,
      'status': status,
      'voucher_url': voucherUrl,
      'created_time': createdTime,
      'qr_url': qrUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrRecordDocumentEquality implements Equality<QrRecord> {
  const QrRecordDocumentEquality();

  @override
  bool equals(QrRecord? e1, QrRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.adminId == e2?.adminId &&
        e1?.qrId == e2?.qrId &&
        e1?.amount == e2?.amount &&
        e1?.concept == e2?.concept &&
        e1?.status == e2?.status &&
        e1?.voucherUrl == e2?.voucherUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.qrUrl == e2?.qrUrl;
  }

  @override
  int hash(QrRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.adminId,
        e?.qrId,
        e?.amount,
        e?.concept,
        e?.status,
        e?.voucherUrl,
        e?.createdTime,
        e?.qrUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is QrRecord;
}
