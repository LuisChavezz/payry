import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SmsHistoryRecord extends FirestoreRecord {
  SmsHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sms_id" field.
  String? _smsId;
  String get smsId => _smsId ?? '';
  bool hasSmsId() => _smsId != null;

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
    _smsId = snapshotData['sms_id'] as String?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedBy = snapshotData['modified_by'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sms_history');

  static Stream<SmsHistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SmsHistoryRecord.fromSnapshot(s));

  static Future<SmsHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SmsHistoryRecord.fromSnapshot(s));

  static SmsHistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SmsHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SmsHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SmsHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SmsHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SmsHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSmsHistoryRecordData({
  String? smsId,
  String? status,
  DateTime? createdTime,
  String? modifiedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sms_id': smsId,
      'status': status,
      'created_time': createdTime,
      'modified_by': modifiedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class SmsHistoryRecordDocumentEquality implements Equality<SmsHistoryRecord> {
  const SmsHistoryRecordDocumentEquality();

  @override
  bool equals(SmsHistoryRecord? e1, SmsHistoryRecord? e2) {
    return e1?.smsId == e2?.smsId &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedBy == e2?.modifiedBy;
  }

  @override
  int hash(SmsHistoryRecord? e) => const ListEquality()
      .hash([e?.smsId, e?.status, e?.createdTime, e?.modifiedBy]);

  @override
  bool isValidKey(Object? o) => o is SmsHistoryRecord;
}
