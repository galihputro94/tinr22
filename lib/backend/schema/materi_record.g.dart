// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'materi_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MateriRecord> _$materiRecordSerializer =
    new _$MateriRecordSerializer();

class _$MateriRecordSerializer implements StructuredSerializer<MateriRecord> {
  @override
  final Iterable<Type> types = const [MateriRecord, _$MateriRecord];
  @override
  final String wireName = 'MateriRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MateriRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nama;
    if (value != null) {
      result
        ..add('nama')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.mk;
    if (value != null) {
      result
        ..add('mk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jadwalref;
    if (value != null) {
      result
        ..add('jadwalref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  MateriRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MateriRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nama':
          result.nama = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'link':
          result.link = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'mk':
          result.mk = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jadwalref':
          result.jadwalref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$MateriRecord extends MateriRecord {
  @override
  final String? nama;
  @override
  final String? link;
  @override
  final String? mk;
  @override
  final DocumentReference<Object?>? jadwalref;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MateriRecord([void Function(MateriRecordBuilder)? updates]) =>
      (new MateriRecordBuilder()..update(updates))._build();

  _$MateriRecord._({this.nama, this.link, this.mk, this.jadwalref, this.ffRef})
      : super._();

  @override
  MateriRecord rebuild(void Function(MateriRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MateriRecordBuilder toBuilder() => new MateriRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MateriRecord &&
        nama == other.nama &&
        link == other.link &&
        mk == other.mk &&
        jadwalref == other.jadwalref &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, nama.hashCode), link.hashCode), mk.hashCode),
            jadwalref.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MateriRecord')
          ..add('nama', nama)
          ..add('link', link)
          ..add('mk', mk)
          ..add('jadwalref', jadwalref)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MateriRecordBuilder
    implements Builder<MateriRecord, MateriRecordBuilder> {
  _$MateriRecord? _$v;

  String? _nama;
  String? get nama => _$this._nama;
  set nama(String? nama) => _$this._nama = nama;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  String? _mk;
  String? get mk => _$this._mk;
  set mk(String? mk) => _$this._mk = mk;

  DocumentReference<Object?>? _jadwalref;
  DocumentReference<Object?>? get jadwalref => _$this._jadwalref;
  set jadwalref(DocumentReference<Object?>? jadwalref) =>
      _$this._jadwalref = jadwalref;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MateriRecordBuilder() {
    MateriRecord._initializeBuilder(this);
  }

  MateriRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nama = $v.nama;
      _link = $v.link;
      _mk = $v.mk;
      _jadwalref = $v.jadwalref;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MateriRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MateriRecord;
  }

  @override
  void update(void Function(MateriRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MateriRecord build() => _build();

  _$MateriRecord _build() {
    final _$result = _$v ??
        new _$MateriRecord._(
            nama: nama, link: link, mk: mk, jadwalref: jadwalref, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
