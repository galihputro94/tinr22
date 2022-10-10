// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mata_kuliah_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MataKuliahRecord> _$mataKuliahRecordSerializer =
    new _$MataKuliahRecordSerializer();

class _$MataKuliahRecordSerializer
    implements StructuredSerializer<MataKuliahRecord> {
  @override
  final Iterable<Type> types = const [MataKuliahRecord, _$MataKuliahRecord];
  @override
  final String wireName = 'MataKuliahRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MataKuliahRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nama;
    if (value != null) {
      result
        ..add('Nama')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MataKuliahRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MataKuliahRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Nama':
          result.nama = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MataKuliahRecord extends MataKuliahRecord {
  @override
  final String? nama;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MataKuliahRecord(
          [void Function(MataKuliahRecordBuilder)? updates]) =>
      (new MataKuliahRecordBuilder()..update(updates))._build();

  _$MataKuliahRecord._({this.nama, this.ffRef}) : super._();

  @override
  MataKuliahRecord rebuild(void Function(MataKuliahRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MataKuliahRecordBuilder toBuilder() =>
      new MataKuliahRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MataKuliahRecord &&
        nama == other.nama &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nama.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MataKuliahRecord')
          ..add('nama', nama)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MataKuliahRecordBuilder
    implements Builder<MataKuliahRecord, MataKuliahRecordBuilder> {
  _$MataKuliahRecord? _$v;

  String? _nama;
  String? get nama => _$this._nama;
  set nama(String? nama) => _$this._nama = nama;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MataKuliahRecordBuilder() {
    MataKuliahRecord._initializeBuilder(this);
  }

  MataKuliahRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nama = $v.nama;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MataKuliahRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MataKuliahRecord;
  }

  @override
  void update(void Function(MataKuliahRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MataKuliahRecord build() => _build();

  _$MataKuliahRecord _build() {
    final _$result = _$v ?? new _$MataKuliahRecord._(nama: nama, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
