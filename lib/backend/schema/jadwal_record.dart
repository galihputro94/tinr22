import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'jadwal_record.g.dart';

abstract class JadwalRecord
    implements Built<JadwalRecord, JadwalRecordBuilder> {
  static Serializer<JadwalRecord> get serializer => _$jadwalRecordSerializer;

  String? get mk;

  String? get dosen;

  String? get jam;

  String? get ruang;

  String? get hari;

  String? get sks;

  int? get index;

  DocumentReference? get tugasMKref;

  DocumentReference? get materiMKref;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(JadwalRecordBuilder builder) => builder
    ..mk = ''
    ..dosen = ''
    ..jam = ''
    ..ruang = ''
    ..hari = ''
    ..sks = ''
    ..index = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jadwal');

  static Stream<JadwalRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<JadwalRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  JadwalRecord._();
  factory JadwalRecord([void Function(JadwalRecordBuilder) updates]) =
      _$JadwalRecord;

  static JadwalRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createJadwalRecordData({
  String? mk,
  String? dosen,
  String? jam,
  String? ruang,
  String? hari,
  String? sks,
  int? index,
  DocumentReference? tugasMKref,
  DocumentReference? materiMKref,
}) {
  final firestoreData = serializers.toFirestore(
    JadwalRecord.serializer,
    JadwalRecord(
      (j) => j
        ..mk = mk
        ..dosen = dosen
        ..jam = jam
        ..ruang = ruang
        ..hari = hari
        ..sks = sks
        ..index = index
        ..tugasMKref = tugasMKref
        ..materiMKref = materiMKref,
    ),
  );

  return firestoreData;
}
