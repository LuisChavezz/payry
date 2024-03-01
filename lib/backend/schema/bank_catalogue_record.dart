import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankCatalogueRecord extends FirestoreRecord {
  BankCatalogueRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  bool hasKey() => _key != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "legal_name" field.
  String? _legalName;
  String get legalName => _legalName ?? '';
  bool hasLegalName() => _legalName != null;

  // "bankid" field.
  String? _bankid;
  String get bankid => _bankid ?? '';
  bool hasBankid() => _bankid != null;

  void _initializeFields() {
    _key = snapshotData['key'] as String?;
    _name = snapshotData['name'] as String?;
    _legalName = snapshotData['legal_name'] as String?;
    _bankid = snapshotData['bankid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bank_catalogue');

  static Stream<BankCatalogueRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankCatalogueRecord.fromSnapshot(s));

  static Future<BankCatalogueRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankCatalogueRecord.fromSnapshot(s));

  static BankCatalogueRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankCatalogueRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankCatalogueRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankCatalogueRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankCatalogueRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankCatalogueRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankCatalogueRecordData({
  String? key,
  String? name,
  String? legalName,
  String? bankid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'key': key,
      'name': name,
      'legal_name': legalName,
      'bankid': bankid,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankCatalogueRecordDocumentEquality
    implements Equality<BankCatalogueRecord> {
  const BankCatalogueRecordDocumentEquality();

  @override
  bool equals(BankCatalogueRecord? e1, BankCatalogueRecord? e2) {
    return e1?.key == e2?.key &&
        e1?.name == e2?.name &&
        e1?.legalName == e2?.legalName &&
        e1?.bankid == e2?.bankid;
  }

  @override
  int hash(BankCatalogueRecord? e) =>
      const ListEquality().hash([e?.key, e?.name, e?.legalName, e?.bankid]);

  @override
  bool isValidKey(Object? o) => o is BankCatalogueRecord;
}
