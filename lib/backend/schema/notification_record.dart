import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "receiver_id" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  // "redirect_url" field.
  String? _redirectUrl;
  String get redirectUrl => _redirectUrl ?? '';
  bool hasRedirectUrl() => _redirectUrl != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isRead = snapshotData['is_read'] as bool?;
    _receiverId = snapshotData['receiver_id'] as String?;
    _redirectUrl = snapshotData['redirect_url'] as String?;
    _subject = snapshotData['subject'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? content,
  DateTime? createdTime,
  bool? isRead,
  String? receiverId,
  String? redirectUrl,
  String? subject,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'created_time': createdTime,
      'is_read': isRead,
      'receiver_id': receiverId,
      'redirect_url': redirectUrl,
      'subject': subject,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.content == e2?.content &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isRead == e2?.isRead &&
        e1?.receiverId == e2?.receiverId &&
        e1?.redirectUrl == e2?.redirectUrl &&
        e1?.subject == e2?.subject;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.content,
        e?.createdTime,
        e?.isRead,
        e?.receiverId,
        e?.redirectUrl,
        e?.subject
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
