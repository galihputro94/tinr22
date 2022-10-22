import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'mata_kuliah_record.g.dart';

abstract class MataKuliahRecord
    implements Built<MataKuliahRecord, MataKuliahRecordBuilder> {
  static Serializer<MataKuliahRecord> get serializer =>
      _$mataKuliahRecordSerializer;

  String? get namaMK;

  String? get dosenMK;

  String? get ruangMK;

  String? get hariMK;

  int? get sksMK;

  BuiltList<DocumentReference>? get materiRef;

  DateTime? get jamMK;

  DocumentReference? get refmat;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MataKuliahRecordBuilder builder) => builder
    ..namaMK = ''
    ..dosenMK = ''
    ..ruangMK = ''
    ..hariMK = ''
    ..sksMK = 0
    ..materiRef = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MataKuliah');

  static Stream<MataKuliahRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MataKuliahRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MataKuliahRecord._();
  factory MataKuliahRecord([void Function(MataKuliahRecordBuilder) updates]) =
      _$MataKuliahRecord;

  static MataKuliahRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMataKuliahRecordData({
  String? namaMK,
  String? dosenMK,
  String? ruangMK,
  String? hariMK,
  int? sksMK,
  DateTime? jamMK,
  DocumentReference? refmat,
}) {
  final firestoreData = serializers.toFirestore(
    MataKuliahRecord.serializer,
    MataKuliahRecord(
      (m) => m
        ..namaMK = namaMK
        ..dosenMK = dosenMK
        ..ruangMK = ruangMK
        ..hariMK = hariMK
        ..sksMK = sksMK
        ..materiRef = null
        ..jamMK = jamMK
        ..refmat = refmat,
    ),
  );

  return firestoreData;
}
