import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivitesRecord extends FirestoreRecord {
  ActivitesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "activityname" field.
  String? _activityname;
  String get activityname => _activityname ?? '';
  bool hasActivityname() => _activityname != null;

  // "activityphoto" field.
  String? _activityphoto;
  String get activityphoto => _activityphoto ?? '';
  bool hasActivityphoto() => _activityphoto != null;

  // "activitydescription" field.
  String? _activitydescription;
  String get activitydescription => _activitydescription ?? '';
  bool hasActivitydescription() => _activitydescription != null;

  // "activitygoalnum" field.
  int? _activitygoalnum;
  int get activitygoalnum => _activitygoalnum ?? 0;
  bool hasActivitygoalnum() => _activitygoalnum != null;

  void _initializeFields() {
    _activityname = snapshotData['activityname'] as String?;
    _activityphoto = snapshotData['activityphoto'] as String?;
    _activitydescription = snapshotData['activitydescription'] as String?;
    _activitygoalnum = castToType<int>(snapshotData['activitygoalnum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activites');

  static Stream<ActivitesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivitesRecord.fromSnapshot(s));

  static Future<ActivitesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivitesRecord.fromSnapshot(s));

  static ActivitesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivitesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivitesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivitesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivitesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivitesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivitesRecordData({
  String? activityname,
  String? activityphoto,
  String? activitydescription,
  int? activitygoalnum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'activityname': activityname,
      'activityphoto': activityphoto,
      'activitydescription': activitydescription,
      'activitygoalnum': activitygoalnum,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivitesRecordDocumentEquality implements Equality<ActivitesRecord> {
  const ActivitesRecordDocumentEquality();

  @override
  bool equals(ActivitesRecord? e1, ActivitesRecord? e2) {
    return e1?.activityname == e2?.activityname &&
        e1?.activityphoto == e2?.activityphoto &&
        e1?.activitydescription == e2?.activitydescription &&
        e1?.activitygoalnum == e2?.activitygoalnum;
  }

  @override
  int hash(ActivitesRecord? e) => const ListEquality().hash([
        e?.activityname,
        e?.activityphoto,
        e?.activitydescription,
        e?.activitygoalnum
      ]);

  @override
  bool isValidKey(Object? o) => o is ActivitesRecord;
}
