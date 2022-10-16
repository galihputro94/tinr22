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

  String? get jamMK;

  String? get ruangMK;

  String? get sksMK;

  String? get hariMK;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MataKuliahRecordBuilder builder) => builder
    ..namaMK = ''
    ..dosenMK = ''
    ..jamMK = ''
    ..ruangMK = ''
    ..sksMK = ''
    ..hariMK = '';

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
  String? jamMK,
  String? ruangMK,
  String? sksMK,
  String? hariMK,
}) {
  final firestoreData = serializers.toFirestore(
    MataKuliahRecord.serializer,
    MataKuliahRecord(
      (m) => m
        ..namaMK = namaMK
        ..dosenMK = dosenMK
        ..jamMK = jamMK
        ..ruangMK = ruangMK
        ..sksMK = sksMK
        ..hariMK = hariMK,
    ),
  );

  return firestoreData;
}
