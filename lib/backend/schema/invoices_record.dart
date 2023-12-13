import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicesRecord extends FirestoreRecord {
  InvoicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "invoice_url" field.
  String? _invoiceUrl;
  String get invoiceUrl => _invoiceUrl ?? '';
  bool hasInvoiceUrl() => _invoiceUrl != null;

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

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _invoiceUrl = snapshotData['invoice_url'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _concept = snapshotData['concept'] as String?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('invoices');

  static Stream<InvoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicesRecord.fromSnapshot(s));

  static Future<InvoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicesRecord.fromSnapshot(s));

  static InvoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicesRecordData({
  String? adminId,
  String? invoiceUrl,
  double? amount,
  String? concept,
  String? status,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'invoice_url': invoiceUrl,
      'amount': amount,
      'concept': concept,
      'status': status,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.invoiceUrl == e2?.invoiceUrl &&
        e1?.amount == e2?.amount &&
        e1?.concept == e2?.concept &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([
        e?.adminId,
        e?.invoiceUrl,
        e?.amount,
        e?.concept,
        e?.status,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
