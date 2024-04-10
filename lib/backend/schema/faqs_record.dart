import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FaqsRecord extends FirestoreRecord {
  FaqsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('faqs');

  static Stream<FaqsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FaqsRecord.fromSnapshot(s));

  static Future<FaqsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FaqsRecord.fromSnapshot(s));

  static FaqsRecord fromSnapshot(DocumentSnapshot snapshot) => FaqsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FaqsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FaqsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FaqsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FaqsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFaqsRecordData({
  String? title,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class FaqsRecordDocumentEquality implements Equality<FaqsRecord> {
  const FaqsRecordDocumentEquality();

  @override
  bool equals(FaqsRecord? e1, FaqsRecord? e2) {
    return e1?.title == e2?.title && e1?.description == e2?.description;
  }

  @override
  int hash(FaqsRecord? e) =>
      const ListEquality().hash([e?.title, e?.description]);

  @override
  bool isValidKey(Object? o) => o is FaqsRecord;
}
