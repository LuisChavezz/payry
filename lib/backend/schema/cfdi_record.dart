import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CfdiRecord extends FirestoreRecord {
  CfdiRecord._(
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
      FirebaseFirestore.instance.collection('cfdi');

  static Stream<CfdiRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CfdiRecord.fromSnapshot(s));

  static Future<CfdiRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CfdiRecord.fromSnapshot(s));

  static CfdiRecord fromSnapshot(DocumentSnapshot snapshot) => CfdiRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CfdiRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CfdiRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CfdiRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CfdiRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCfdiRecordData({
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CfdiRecordDocumentEquality implements Equality<CfdiRecord> {
  const CfdiRecordDocumentEquality();

  @override
  bool equals(CfdiRecord? e1, CfdiRecord? e2) {
    return e1?.description == e2?.description;
  }

  @override
  int hash(CfdiRecord? e) => const ListEquality().hash([e?.description]);

  @override
  bool isValidKey(Object? o) => o is CfdiRecord;
}
