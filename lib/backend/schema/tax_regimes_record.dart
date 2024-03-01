import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxRegimesRecord extends FirestoreRecord {
  TaxRegimesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tax_regimes');

  static Stream<TaxRegimesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaxRegimesRecord.fromSnapshot(s));

  static Future<TaxRegimesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaxRegimesRecord.fromSnapshot(s));

  static TaxRegimesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaxRegimesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaxRegimesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaxRegimesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaxRegimesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaxRegimesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaxRegimesRecordData({
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaxRegimesRecordDocumentEquality implements Equality<TaxRegimesRecord> {
  const TaxRegimesRecordDocumentEquality();

  @override
  bool equals(TaxRegimesRecord? e1, TaxRegimesRecord? e2) {
    return e1?.description == e2?.description;
  }

  @override
  int hash(TaxRegimesRecord? e) => const ListEquality().hash([e?.description]);

  @override
  bool isValidKey(Object? o) => o is TaxRegimesRecord;
}
