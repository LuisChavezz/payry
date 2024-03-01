import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QrHistoryRecord extends FirestoreRecord {
  QrHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "qr_id" field.
  String? _qrId;
  String get qrId => _qrId ?? '';
  bool hasQrId() => _qrId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_by" field.
  String? _modifiedBy;
  String get modifiedBy => _modifiedBy ?? '';
  bool hasModifiedBy() => _modifiedBy != null;

  void _initializeFields() {
    _qrId = snapshotData['qr_id'] as String?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedBy = snapshotData['modified_by'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('qr_history');

  static Stream<QrHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QrHistoryRecord.fromSnapshot(s));

  static Future<QrHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QrHistoryRecord.fromSnapshot(s));

  static QrHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QrHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QrHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QrHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QrHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QrHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQrHistoryRecordData({
  String? qrId,
  String? status,
  DateTime? createdTime,
  String? modifiedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'qr_id': qrId,
      'status': status,
      'created_time': createdTime,
      'modified_by': modifiedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class QrHistoryRecordDocumentEquality implements Equality<QrHistoryRecord> {
  const QrHistoryRecordDocumentEquality();

  @override
  bool equals(QrHistoryRecord? e1, QrHistoryRecord? e2) {
    return e1?.qrId == e2?.qrId &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedBy == e2?.modifiedBy;
  }

  @override
  int hash(QrHistoryRecord? e) => const ListEquality()
      .hash([e?.qrId, e?.status, e?.createdTime, e?.modifiedBy]);

  @override
  bool isValidKey(Object? o) => o is QrHistoryRecord;
}
