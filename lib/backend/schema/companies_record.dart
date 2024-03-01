import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompaniesRecord extends FirestoreRecord {
  CompaniesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "alias" field.
  String? _alias;
  String get alias => _alias ?? '';
  bool hasAlias() => _alias != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "tax_regime" field.
  String? _taxRegime;
  String get taxRegime => _taxRegime ?? '';
  bool hasTaxRegime() => _taxRegime != null;

  // "rfc" field.
  String? _rfc;
  String get rfc => _rfc ?? '';
  bool hasRfc() => _rfc != null;

  // "street_number" field.
  String? _streetNumber;
  String get streetNumber => _streetNumber ?? '';
  bool hasStreetNumber() => _streetNumber != null;

  // "int_street_number" field.
  String? _intStreetNumber;
  String get intStreetNumber => _intStreetNumber ?? '';
  bool hasIntStreetNumber() => _intStreetNumber != null;

  // "neighborhood" field.
  String? _neighborhood;
  String get neighborhood => _neighborhood ?? '';
  bool hasNeighborhood() => _neighborhood != null;

  // "zipcode" field.
  String? _zipcode;
  String get zipcode => _zipcode ?? '';
  bool hasZipcode() => _zipcode != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "allow_tip" field.
  bool? _allowTip;
  bool get allowTip => _allowTip ?? false;
  bool hasAllowTip() => _allowTip != null;

  // "require_bill" field.
  bool? _requireBill;
  bool get requireBill => _requireBill ?? false;
  bool hasRequireBill() => _requireBill != null;

  // "cfdi" field.
  String? _cfdi;
  String get cfdi => _cfdi ?? '';
  bool hasCfdi() => _cfdi != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "clabe" field.
  String? _clabe;
  String get clabe => _clabe ?? '';
  bool hasClabe() => _clabe != null;

  // "verified_clabe" field.
  bool? _verifiedClabe;
  bool get verifiedClabe => _verifiedClabe ?? false;
  bool hasVerifiedClabe() => _verifiedClabe != null;

  // "api_key" field.
  String? _apiKey;
  String get apiKey => _apiKey ?? '';
  bool hasApiKey() => _apiKey != null;

  // "api_secret" field.
  String? _apiSecret;
  String get apiSecret => _apiSecret ?? '';
  bool hasApiSecret() => _apiSecret != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "bankid" field.
  String? _bankid;
  String get bankid => _bankid ?? '';
  bool hasBankid() => _bankid != null;

  // "coupon" field.
  String? _coupon;
  String get coupon => _coupon ?? '';
  bool hasCoupon() => _coupon != null;

  // "giro_name" field.
  String? _giroName;
  String get giroName => _giroName ?? '';
  bool hasGiroName() => _giroName != null;

  // "giro_category" field.
  String? _giroCategory;
  String get giroCategory => _giroCategory ?? '';
  bool hasGiroCategory() => _giroCategory != null;

  void _initializeFields() {
    _createdBy = snapshotData['created_by'] as String?;
    _name = snapshotData['name'] as String?;
    _alias = snapshotData['alias'] as String?;
    _email = snapshotData['email'] as String?;
    _taxRegime = snapshotData['tax_regime'] as String?;
    _rfc = snapshotData['rfc'] as String?;
    _streetNumber = snapshotData['street_number'] as String?;
    _intStreetNumber = snapshotData['int_street_number'] as String?;
    _neighborhood = snapshotData['neighborhood'] as String?;
    _zipcode = snapshotData['zipcode'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _country = snapshotData['country'] as String?;
    _status = snapshotData['status'] as bool?;
    _allowTip = snapshotData['allow_tip'] as bool?;
    _requireBill = snapshotData['require_bill'] as bool?;
    _cfdi = snapshotData['cfdi'] as String?;
    _bank = snapshotData['bank'] as String?;
    _clabe = snapshotData['clabe'] as String?;
    _verifiedClabe = snapshotData['verified_clabe'] as bool?;
    _apiKey = snapshotData['api_key'] as String?;
    _apiSecret = snapshotData['api_secret'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _street = snapshotData['street'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bankid = snapshotData['bankid'] as String?;
    _coupon = snapshotData['coupon'] as String?;
    _giroName = snapshotData['giro_name'] as String?;
    _giroCategory = snapshotData['giro_category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('companies');

  static Stream<CompaniesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompaniesRecord.fromSnapshot(s));

  static Future<CompaniesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompaniesRecord.fromSnapshot(s));

  static CompaniesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompaniesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompaniesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompaniesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompaniesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompaniesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompaniesRecordData({
  String? createdBy,
  String? name,
  String? alias,
  String? email,
  String? taxRegime,
  String? rfc,
  String? streetNumber,
  String? intStreetNumber,
  String? neighborhood,
  String? zipcode,
  String? city,
  String? state,
  String? country,
  bool? status,
  bool? allowTip,
  bool? requireBill,
  String? cfdi,
  String? bank,
  String? clabe,
  bool? verifiedClabe,
  String? apiKey,
  String? apiSecret,
  String? imageUrl,
  String? street,
  DateTime? createdTime,
  String? bankid,
  String? coupon,
  String? giroName,
  String? giroCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_by': createdBy,
      'name': name,
      'alias': alias,
      'email': email,
      'tax_regime': taxRegime,
      'rfc': rfc,
      'street_number': streetNumber,
      'int_street_number': intStreetNumber,
      'neighborhood': neighborhood,
      'zipcode': zipcode,
      'city': city,
      'state': state,
      'country': country,
      'status': status,
      'allow_tip': allowTip,
      'require_bill': requireBill,
      'cfdi': cfdi,
      'bank': bank,
      'clabe': clabe,
      'verified_clabe': verifiedClabe,
      'api_key': apiKey,
      'api_secret': apiSecret,
      'image_url': imageUrl,
      'street': street,
      'created_time': createdTime,
      'bankid': bankid,
      'coupon': coupon,
      'giro_name': giroName,
      'giro_category': giroCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompaniesRecordDocumentEquality implements Equality<CompaniesRecord> {
  const CompaniesRecordDocumentEquality();

  @override
  bool equals(CompaniesRecord? e1, CompaniesRecord? e2) {
    return e1?.createdBy == e2?.createdBy &&
        e1?.name == e2?.name &&
        e1?.alias == e2?.alias &&
        e1?.email == e2?.email &&
        e1?.taxRegime == e2?.taxRegime &&
        e1?.rfc == e2?.rfc &&
        e1?.streetNumber == e2?.streetNumber &&
        e1?.intStreetNumber == e2?.intStreetNumber &&
        e1?.neighborhood == e2?.neighborhood &&
        e1?.zipcode == e2?.zipcode &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.country == e2?.country &&
        e1?.status == e2?.status &&
        e1?.allowTip == e2?.allowTip &&
        e1?.requireBill == e2?.requireBill &&
        e1?.cfdi == e2?.cfdi &&
        e1?.bank == e2?.bank &&
        e1?.clabe == e2?.clabe &&
        e1?.verifiedClabe == e2?.verifiedClabe &&
        e1?.apiKey == e2?.apiKey &&
        e1?.apiSecret == e2?.apiSecret &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.street == e2?.street &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bankid == e2?.bankid &&
        e1?.coupon == e2?.coupon &&
        e1?.giroName == e2?.giroName &&
        e1?.giroCategory == e2?.giroCategory;
  }

  @override
  int hash(CompaniesRecord? e) => const ListEquality().hash([
        e?.createdBy,
        e?.name,
        e?.alias,
        e?.email,
        e?.taxRegime,
        e?.rfc,
        e?.streetNumber,
        e?.intStreetNumber,
        e?.neighborhood,
        e?.zipcode,
        e?.city,
        e?.state,
        e?.country,
        e?.status,
        e?.allowTip,
        e?.requireBill,
        e?.cfdi,
        e?.bank,
        e?.clabe,
        e?.verifiedClabe,
        e?.apiKey,
        e?.apiSecret,
        e?.imageUrl,
        e?.street,
        e?.createdTime,
        e?.bankid,
        e?.coupon,
        e?.giroName,
        e?.giroCategory
      ]);

  @override
  bool isValidKey(Object? o) => o is CompaniesRecord;
}
