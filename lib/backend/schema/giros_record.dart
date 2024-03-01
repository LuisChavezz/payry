import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GirosRecord extends FirestoreRecord {
  GirosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "giros" field.
  List<String>? _giros;
  List<String> get giros => _giros ?? const [];
  bool hasGiros() => _giros != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _giros = getDataList(snapshotData['giros']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('giros');

  static Stream<GirosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GirosRecord.fromSnapshot(s));

  static Future<GirosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GirosRecord.fromSnapshot(s));

  static GirosRecord fromSnapshot(DocumentSnapshot snapshot) => GirosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GirosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GirosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GirosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GirosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGirosRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class GirosRecordDocumentEquality implements Equality<GirosRecord> {
  const GirosRecordDocumentEquality();

  @override
  bool equals(GirosRecord? e1, GirosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        listEquality.equals(e1?.giros, e2?.giros);
  }

  @override
  int hash(GirosRecord? e) =>
      const ListEquality().hash([e?.category, e?.giros]);

  @override
  bool isValidKey(Object? o) => o is GirosRecord;
}
