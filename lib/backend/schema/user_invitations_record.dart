import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInvitationsRecord extends FirestoreRecord {
  UserInvitationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "invited_user_email" field.
  String? _invitedUserEmail;
  String get invitedUserEmail => _invitedUserEmail ?? '';
  bool hasInvitedUserEmail() => _invitedUserEmail != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _invitedUserEmail = snapshotData['invited_user_email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _accepted = snapshotData['accepted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_invitations');

  static Stream<UserInvitationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserInvitationsRecord.fromSnapshot(s));

  static Future<UserInvitationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserInvitationsRecord.fromSnapshot(s));

  static UserInvitationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserInvitationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserInvitationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserInvitationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserInvitationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserInvitationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserInvitationsRecordData({
  String? adminId,
  String? invitedUserEmail,
  DateTime? createdTime,
  bool? accepted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'invited_user_email': invitedUserEmail,
      'created_time': createdTime,
      'accepted': accepted,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserInvitationsRecordDocumentEquality
    implements Equality<UserInvitationsRecord> {
  const UserInvitationsRecordDocumentEquality();

  @override
  bool equals(UserInvitationsRecord? e1, UserInvitationsRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.invitedUserEmail == e2?.invitedUserEmail &&
        e1?.createdTime == e2?.createdTime &&
        e1?.accepted == e2?.accepted;
  }

  @override
  int hash(UserInvitationsRecord? e) => const ListEquality()
      .hash([e?.adminId, e?.invitedUserEmail, e?.createdTime, e?.accepted]);

  @override
  bool isValidKey(Object? o) => o is UserInvitationsRecord;
}
