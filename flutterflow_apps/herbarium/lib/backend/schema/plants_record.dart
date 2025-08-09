import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlantsRecord extends FirestoreRecord {
  PlantsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name_common" field.
  String? _nameCommon;
  String get nameCommon => _nameCommon ?? '';
  bool hasNameCommon() => _nameCommon != null;

  // "name_latin" field.
  String? _nameLatin;
  String get nameLatin => _nameLatin ?? '';
  bool hasNameLatin() => _nameLatin != null;

  // "name_polish" field.
  String? _namePolish;
  String get namePolish => _namePolish ?? '';
  bool hasNamePolish() => _namePolish != null;

  // "family" field.
  String? _family;
  String get family => _family ?? '';
  bool hasFamily() => _family != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "meaning" field.
  String? _meaning;
  String get meaning => _meaning ?? '';
  bool hasMeaning() => _meaning != null;

  // "appearance" field.
  String? _appearance;
  String get appearance => _appearance ?? '';
  bool hasAppearance() => _appearance != null;

  // "habitat" field.
  List<String>? _habitat;
  List<String> get habitat => _habitat ?? const [];
  bool hasHabitat() => _habitat != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "text_habitat" field.
  String? _textHabitat;
  String get textHabitat => _textHabitat ?? '';
  bool hasTextHabitat() => _textHabitat != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _nameCommon = snapshotData['name_common'] as String?;
    _nameLatin = snapshotData['name_latin'] as String?;
    _namePolish = snapshotData['name_polish'] as String?;
    _family = snapshotData['family'] as String?;
    _description = snapshotData['description'] as String?;
    _meaning = snapshotData['meaning'] as String?;
    _appearance = snapshotData['appearance'] as String?;
    _habitat = getDataList(snapshotData['habitat']);
    _order = castToType<int>(snapshotData['order']);
    _textHabitat = snapshotData['text_habitat'] as String?;
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plants');

  static Stream<PlantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlantsRecord.fromSnapshot(s));

  static Future<PlantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlantsRecord.fromSnapshot(s));

  static PlantsRecord fromSnapshot(DocumentSnapshot snapshot) => PlantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlantsRecordData({
  String? nameCommon,
  String? nameLatin,
  String? namePolish,
  String? family,
  String? description,
  String? meaning,
  String? appearance,
  int? order,
  String? textHabitat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name_common': nameCommon,
      'name_latin': nameLatin,
      'name_polish': namePolish,
      'family': family,
      'description': description,
      'meaning': meaning,
      'appearance': appearance,
      'order': order,
      'text_habitat': textHabitat,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlantsRecordDocumentEquality implements Equality<PlantsRecord> {
  const PlantsRecordDocumentEquality();

  @override
  bool equals(PlantsRecord? e1, PlantsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nameCommon == e2?.nameCommon &&
        e1?.nameLatin == e2?.nameLatin &&
        e1?.namePolish == e2?.namePolish &&
        e1?.family == e2?.family &&
        e1?.description == e2?.description &&
        e1?.meaning == e2?.meaning &&
        e1?.appearance == e2?.appearance &&
        listEquality.equals(e1?.habitat, e2?.habitat) &&
        e1?.order == e2?.order &&
        e1?.textHabitat == e2?.textHabitat &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(PlantsRecord? e) => const ListEquality().hash([
        e?.nameCommon,
        e?.nameLatin,
        e?.namePolish,
        e?.family,
        e?.description,
        e?.meaning,
        e?.appearance,
        e?.habitat,
        e?.order,
        e?.textHabitat,
        e?.images
      ]);

  @override
  bool isValidKey(Object? o) => o is PlantsRecord;
}
