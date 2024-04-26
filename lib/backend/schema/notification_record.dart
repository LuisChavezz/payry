import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "redirect" field.
  bool? _redirect;
  bool get redirect => _redirect ?? false;
  bool hasRedirect() => _redirect != null;

  // "detallesCobroRef" field.
  String? _detallesCobroRef;
  String get detallesCobroRef => _detallesCobroRef ?? '';
  bool hasDetallesCobroRef() => _detallesCobroRef != null;

  // "registraCobroRef" field.
  String? _registraCobroRef;
  String get registraCobroRef => _registraCobroRef ?? '';
  bool hasRegistraCobroRef() => _registraCobroRef != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "sucursal_id" field.
  String? _sucursalId;
  String get sucursalId => _sucursalId ?? '';
  bool hasSucursalId() => _sucursalId != null;

  void _initializeFields() {
    _content = snapshotData['content'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isRead = snapshotData['is_read'] as bool?;
    _receiverId = snapshotData['receiver_id'] as String?;
    _subject = snapshotData['subject'] as String?;
    _redirect = snapshotData['redirect'] as bool?;
    _detallesCobroRef = snapshotData['detallesCobroRef'] as String?;
    _registraCobroRef = snapshotData['registraCobroRef'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _userId = snapshotData['user_id'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _sucursalId = snapshotData['sucursal_id'] as String?;
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
  String? subject,
  bool? redirect,
  String? detallesCobroRef,
  String? registraCobroRef,
  String? userEmail,
  String? userId,
  String? userName,
  String? sucursalId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'content': content,
      'created_time': createdTime,
      'is_read': isRead,
      'receiver_id': receiverId,
      'subject': subject,
      'redirect': redirect,
      'detallesCobroRef': detallesCobroRef,
      'registraCobroRef': registraCobroRef,
      'user_email': userEmail,
      'user_id': userId,
      'user_name': userName,
      'sucursal_id': sucursalId,
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
        e1?.subject == e2?.subject &&
        e1?.redirect == e2?.redirect &&
        e1?.detallesCobroRef == e2?.detallesCobroRef &&
        e1?.registraCobroRef == e2?.registraCobroRef &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userId == e2?.userId &&
        e1?.userName == e2?.userName &&
        e1?.sucursalId == e2?.sucursalId;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.content,
        e?.createdTime,
        e?.isRead,
        e?.receiverId,
        e?.subject,
        e?.redirect,
        e?.detallesCobroRef,
        e?.registraCobroRef,
        e?.userEmail,
        e?.userId,
        e?.userName,
        e?.sucursalId
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
