import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserPermissionsRecord extends FirestoreRecord {
  UserPermissionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "admin_id" field.
  String? _adminId;
  String get adminId => _adminId ?? '';
  bool hasAdminId() => _adminId != null;

  // "create_qr" field.
  bool? _createQr;
  bool get createQr => _createQr ?? false;
  bool hasCreateQr() => _createQr != null;

  // "read_qr" field.
  bool? _readQr;
  bool get readQr => _readQr ?? false;
  bool hasReadQr() => _readQr != null;

  // "create_sms" field.
  bool? _createSms;
  bool get createSms => _createSms ?? false;
  bool hasCreateSms() => _createSms != null;

  // "read_sms" field.
  bool? _readSms;
  bool get readSms => _readSms ?? false;
  bool hasReadSms() => _readSms != null;

  // "read_transfers" field.
  bool? _readTransfers;
  bool get readTransfers => _readTransfers ?? false;
  bool hasReadTransfers() => _readTransfers != null;

  // "create_refunds" field.
  bool? _createRefunds;
  bool get createRefunds => _createRefunds ?? false;
  bool hasCreateRefunds() => _createRefunds != null;

  // "read_statistics" field.
  bool? _readStatistics;
  bool get readStatistics => _readStatistics ?? false;
  bool hasReadStatistics() => _readStatistics != null;

  // "read_companies" field.
  bool? _readCompanies;
  bool get readCompanies => _readCompanies ?? false;
  bool hasReadCompanies() => _readCompanies != null;

  // "read_users" field.
  bool? _readUsers;
  bool get readUsers => _readUsers ?? false;
  bool hasReadUsers() => _readUsers != null;

  // "read_invoices" field.
  bool? _readInvoices;
  bool get readInvoices => _readInvoices ?? false;
  bool hasReadInvoices() => _readInvoices != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _adminId = snapshotData['admin_id'] as String?;
    _createQr = snapshotData['create_qr'] as bool?;
    _readQr = snapshotData['read_qr'] as bool?;
    _createSms = snapshotData['create_sms'] as bool?;
    _readSms = snapshotData['read_sms'] as bool?;
    _readTransfers = snapshotData['read_transfers'] as bool?;
    _createRefunds = snapshotData['create_refunds'] as bool?;
    _readStatistics = snapshotData['read_statistics'] as bool?;
    _readCompanies = snapshotData['read_companies'] as bool?;
    _readUsers = snapshotData['read_users'] as bool?;
    _readInvoices = snapshotData['read_invoices'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_permissions');

  static Stream<UserPermissionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserPermissionsRecord.fromSnapshot(s));

  static Future<UserPermissionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserPermissionsRecord.fromSnapshot(s));

  static UserPermissionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserPermissionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserPermissionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserPermissionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserPermissionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserPermissionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserPermissionsRecordData({
  String? uid,
  String? adminId,
  bool? createQr,
  bool? readQr,
  bool? createSms,
  bool? readSms,
  bool? readTransfers,
  bool? createRefunds,
  bool? readStatistics,
  bool? readCompanies,
  bool? readUsers,
  bool? readInvoices,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'admin_id': adminId,
      'create_qr': createQr,
      'read_qr': readQr,
      'create_sms': createSms,
      'read_sms': readSms,
      'read_transfers': readTransfers,
      'create_refunds': createRefunds,
      'read_statistics': readStatistics,
      'read_companies': readCompanies,
      'read_users': readUsers,
      'read_invoices': readInvoices,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserPermissionsRecordDocumentEquality
    implements Equality<UserPermissionsRecord> {
  const UserPermissionsRecordDocumentEquality();

  @override
  bool equals(UserPermissionsRecord? e1, UserPermissionsRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.adminId == e2?.adminId &&
        e1?.createQr == e2?.createQr &&
        e1?.readQr == e2?.readQr &&
        e1?.createSms == e2?.createSms &&
        e1?.readSms == e2?.readSms &&
        e1?.readTransfers == e2?.readTransfers &&
        e1?.createRefunds == e2?.createRefunds &&
        e1?.readStatistics == e2?.readStatistics &&
        e1?.readCompanies == e2?.readCompanies &&
        e1?.readUsers == e2?.readUsers &&
        e1?.readInvoices == e2?.readInvoices;
  }

  @override
  int hash(UserPermissionsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.adminId,
        e?.createQr,
        e?.readQr,
        e?.createSms,
        e?.readSms,
        e?.readTransfers,
        e?.createRefunds,
        e?.readStatistics,
        e?.readCompanies,
        e?.readUsers,
        e?.readInvoices
      ]);

  @override
  bool isValidKey(Object? o) => o is UserPermissionsRecord;
}
