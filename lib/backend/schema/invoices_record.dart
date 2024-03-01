import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "invoice_pdf_url" field.
  String? _invoicePdfUrl;
  String get invoicePdfUrl => _invoicePdfUrl ?? '';
  bool hasInvoicePdfUrl() => _invoicePdfUrl != null;

  // "invoice_xml_url" field.
  String? _invoiceXmlUrl;
  String get invoiceXmlUrl => _invoiceXmlUrl ?? '';
  bool hasInvoiceXmlUrl() => _invoiceXmlUrl != null;

  // "folio" field.
  String? _folio;
  String get folio => _folio ?? '';
  bool hasFolio() => _folio != null;

  // "intelisisid" field.
  int? _intelisisid;
  int get intelisisid => _intelisisid ?? 0;
  bool hasIntelisisid() => _intelisisid != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _concept = snapshotData['concept'] as String?;
    _status = snapshotData['status'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _invoicePdfUrl = snapshotData['invoice_pdf_url'] as String?;
    _invoiceXmlUrl = snapshotData['invoice_xml_url'] as String?;
    _folio = snapshotData['folio'] as String?;
    _intelisisid = castToType<int>(snapshotData['intelisisid']);
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
  double? amount,
  String? concept,
  String? status,
  DateTime? createdTime,
  String? invoicePdfUrl,
  String? invoiceXmlUrl,
  String? folio,
  int? intelisisid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'amount': amount,
      'concept': concept,
      'status': status,
      'created_time': createdTime,
      'invoice_pdf_url': invoicePdfUrl,
      'invoice_xml_url': invoiceXmlUrl,
      'folio': folio,
      'intelisisid': intelisisid,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicesRecordDocumentEquality implements Equality<InvoicesRecord> {
  const InvoicesRecordDocumentEquality();

  @override
  bool equals(InvoicesRecord? e1, InvoicesRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.amount == e2?.amount &&
        e1?.concept == e2?.concept &&
        e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime &&
        e1?.invoicePdfUrl == e2?.invoicePdfUrl &&
        e1?.invoiceXmlUrl == e2?.invoiceXmlUrl &&
        e1?.folio == e2?.folio &&
        e1?.intelisisid == e2?.intelisisid;
  }

  @override
  int hash(InvoicesRecord? e) => const ListEquality().hash([
        e?.adminId,
        e?.amount,
        e?.concept,
        e?.status,
        e?.createdTime,
        e?.invoicePdfUrl,
        e?.invoiceXmlUrl,
        e?.folio,
        e?.intelisisid
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicesRecord;
}
