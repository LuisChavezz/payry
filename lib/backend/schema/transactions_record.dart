import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransactionsRecord extends FirestoreRecord {
  TransactionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _concept = snapshotData['concept'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _adminId = snapshotData['admin_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transactions');

  static Stream<TransactionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TransactionsRecord.fromSnapshot(s));

  static Future<TransactionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TransactionsRecord.fromSnapshot(s));

  static TransactionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TransactionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TransactionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TransactionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TransactionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TransactionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTransactionsRecordData({
  double? amount,
  String? concept,
  DateTime? createdTime,
  String? status,
  String? adminId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'concept': concept,
      'created_time': createdTime,
      'status': status,
      'admin_id': adminId,
    }.withoutNulls,
  );

  return firestoreData;
}

class TransactionsRecordDocumentEquality
    implements Equality<TransactionsRecord> {
  const TransactionsRecordDocumentEquality();

  @override
  bool equals(TransactionsRecord? e1, TransactionsRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.concept == e2?.concept &&
        e1?.createdTime == e2?.createdTime &&
        e1?.status == e2?.status &&
        e1?.adminId == e2?.adminId;
  }

  @override
  int hash(TransactionsRecord? e) => const ListEquality()
      .hash([e?.amount, e?.concept, e?.createdTime, e?.status, e?.adminId]);

  @override
  bool isValidKey(Object? o) => o is TransactionsRecord;
}
