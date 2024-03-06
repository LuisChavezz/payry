import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DetallesCobroRecord extends FirestoreRecord {
  DetallesCobroRecord._(
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

  // "company_id" field.
  String? _companyId;
  String get companyId => _companyId ?? '';
  bool hasCompanyId() => _companyId != null;

  // "concept" field.
  String? _concept;
  String get concept => _concept ?? '';
  bool hasConcept() => _concept != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "cuenta_devolucion" field.
  String? _cuentaDevolucion;
  String get cuentaDevolucion => _cuentaDevolucion ?? '';
  bool hasCuentaDevolucion() => _cuentaDevolucion != null;

  // "date_of_payment_received" field.
  DateTime? _dateOfPaymentReceived;
  DateTime? get dateOfPaymentReceived => _dateOfPaymentReceived;
  bool hasDateOfPaymentReceived() => _dateOfPaymentReceived != null;

  // "institucion_devolucion" field.
  double? _institucionDevolucion;
  double get institucionDevolucion => _institucionDevolucion ?? 0.0;
  bool hasInstitucionDevolucion() => _institucionDevolucion != null;

  // "moneySended" field.
  bool? _moneySended;
  bool get moneySended => _moneySended ?? false;
  bool hasMoneySended() => _moneySended != null;

  // "nombreBeneficiario_devolucion" field.
  String? _nombreBeneficiarioDevolucion;
  String get nombreBeneficiarioDevolucion =>
      _nombreBeneficiarioDevolucion ?? '';
  bool hasNombreBeneficiarioDevolucion() =>
      _nombreBeneficiarioDevolucion != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "registraCobroId" field.
  String? _registraCobroId;
  String get registraCobroId => _registraCobroId ?? '';
  bool hasRegistraCobroId() => _registraCobroId != null;

  // "rfcCurpBeneficiario_devolucion" field.
  String? _rfcCurpBeneficiarioDevolucion;
  String get rfcCurpBeneficiarioDevolucion =>
      _rfcCurpBeneficiarioDevolucion ?? '';
  bool hasRfcCurpBeneficiarioDevolucion() =>
      _rfcCurpBeneficiarioDevolucion != null;

  // "type" field.
  PaymentType? _type;
  PaymentType? get type => _type;
  bool hasType() => _type != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "idRastreo" field.
  double? _idRastreo;
  double get idRastreo => _idRastreo ?? 0.0;
  bool hasIdRastreo() => _idRastreo != null;

  // "claveRastreo" field.
  String? _claveRastreo;
  String get claveRastreo => _claveRastreo ?? '';
  bool hasClaveRastreo() => _claveRastreo != null;

  // "status" field.
  PaymentStatus? _status;
  PaymentStatus? get status => _status;
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _adminId = snapshotData['admin_id'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _companyId = snapshotData['company_id'] as String?;
    _concept = snapshotData['concept'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _cuentaDevolucion = snapshotData['cuenta_devolucion'] as String?;
    _dateOfPaymentReceived =
        snapshotData['date_of_payment_received'] as DateTime?;
    _institucionDevolucion =
        castToType<double>(snapshotData['institucion_devolucion']);
    _moneySended = snapshotData['moneySended'] as bool?;
    _nombreBeneficiarioDevolucion =
        snapshotData['nombreBeneficiario_devolucion'] as String?;
    _paid = snapshotData['paid'] as bool?;
    _registraCobroId = snapshotData['registraCobroId'] as String?;
    _rfcCurpBeneficiarioDevolucion =
        snapshotData['rfcCurpBeneficiario_devolucion'] as String?;
    _type = deserializeEnum<PaymentType>(snapshotData['type']);
    _uid = snapshotData['uid'] as String?;
    _id = snapshotData['id'] as String?;
    _idRastreo = castToType<double>(snapshotData['idRastreo']);
    _claveRastreo = snapshotData['claveRastreo'] as String?;
    _status = deserializeEnum<PaymentStatus>(snapshotData['status']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('detallesCobro');

  static Stream<DetallesCobroRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DetallesCobroRecord.fromSnapshot(s));

  static Future<DetallesCobroRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DetallesCobroRecord.fromSnapshot(s));

  static DetallesCobroRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DetallesCobroRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DetallesCobroRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DetallesCobroRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DetallesCobroRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DetallesCobroRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDetallesCobroRecordData({
  String? adminId,
  double? amount,
  String? companyId,
  String? concept,
  DateTime? createdTime,
  String? cuentaDevolucion,
  DateTime? dateOfPaymentReceived,
  double? institucionDevolucion,
  bool? moneySended,
  String? nombreBeneficiarioDevolucion,
  bool? paid,
  String? registraCobroId,
  String? rfcCurpBeneficiarioDevolucion,
  PaymentType? type,
  String? uid,
  String? id,
  double? idRastreo,
  String? claveRastreo,
  PaymentStatus? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'admin_id': adminId,
      'amount': amount,
      'company_id': companyId,
      'concept': concept,
      'created_time': createdTime,
      'cuenta_devolucion': cuentaDevolucion,
      'date_of_payment_received': dateOfPaymentReceived,
      'institucion_devolucion': institucionDevolucion,
      'moneySended': moneySended,
      'nombreBeneficiario_devolucion': nombreBeneficiarioDevolucion,
      'paid': paid,
      'registraCobroId': registraCobroId,
      'rfcCurpBeneficiario_devolucion': rfcCurpBeneficiarioDevolucion,
      'type': type,
      'uid': uid,
      'id': id,
      'idRastreo': idRastreo,
      'claveRastreo': claveRastreo,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class DetallesCobroRecordDocumentEquality
    implements Equality<DetallesCobroRecord> {
  const DetallesCobroRecordDocumentEquality();

  @override
  bool equals(DetallesCobroRecord? e1, DetallesCobroRecord? e2) {
    return e1?.adminId == e2?.adminId &&
        e1?.amount == e2?.amount &&
        e1?.companyId == e2?.companyId &&
        e1?.concept == e2?.concept &&
        e1?.createdTime == e2?.createdTime &&
        e1?.cuentaDevolucion == e2?.cuentaDevolucion &&
        e1?.dateOfPaymentReceived == e2?.dateOfPaymentReceived &&
        e1?.institucionDevolucion == e2?.institucionDevolucion &&
        e1?.moneySended == e2?.moneySended &&
        e1?.nombreBeneficiarioDevolucion == e2?.nombreBeneficiarioDevolucion &&
        e1?.paid == e2?.paid &&
        e1?.registraCobroId == e2?.registraCobroId &&
        e1?.rfcCurpBeneficiarioDevolucion ==
            e2?.rfcCurpBeneficiarioDevolucion &&
        e1?.type == e2?.type &&
        e1?.uid == e2?.uid &&
        e1?.id == e2?.id &&
        e1?.idRastreo == e2?.idRastreo &&
        e1?.claveRastreo == e2?.claveRastreo &&
        e1?.status == e2?.status;
  }

  @override
  int hash(DetallesCobroRecord? e) => const ListEquality().hash([
        e?.adminId,
        e?.amount,
        e?.companyId,
        e?.concept,
        e?.createdTime,
        e?.cuentaDevolucion,
        e?.dateOfPaymentReceived,
        e?.institucionDevolucion,
        e?.moneySended,
        e?.nombreBeneficiarioDevolucion,
        e?.paid,
        e?.registraCobroId,
        e?.rfcCurpBeneficiarioDevolucion,
        e?.type,
        e?.uid,
        e?.id,
        e?.idRastreo,
        e?.claveRastreo,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is DetallesCobroRecord;
}
