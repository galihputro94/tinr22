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
    value = object.namaMK;
    if (value != null) {
      result
        ..add('namaMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dosenMK;
    if (value != null) {
      result
        ..add('dosenMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jamMK;
    if (value != null) {
      result
        ..add('jamMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ruangMK;
    if (value != null) {
      result
        ..add('ruangMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hariMK;
    if (value != null) {
      result
        ..add('hariMK')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sksMK;
    if (value != null) {
      result
        ..add('sksMK')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.materiRef;
    if (value != null) {
      result
        ..add('materiRef')
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
        case 'namaMK':
          result.namaMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dosenMK':
          result.dosenMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jamMK':
          result.jamMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ruangMK':
          result.ruangMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hariMK':
          result.hariMK = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sksMK':
          result.sksMK = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'materiRef':
          result.materiRef = serializers.deserialize(value,
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

class _$MataKuliahRecord extends MataKuliahRecord {
  @override
  final String? namaMK;
  @override
  final String? dosenMK;
  @override
  final String? jamMK;
  @override
  final String? ruangMK;
  @override
  final String? hariMK;
  @override
  final int? sksMK;
  @override
  final DocumentReference<Object?>? materiRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MataKuliahRecord(
          [void Function(MataKuliahRecordBuilder)? updates]) =>
      (new MataKuliahRecordBuilder()..update(updates))._build();

  _$MataKuliahRecord._(
      {this.namaMK,
      this.dosenMK,
      this.jamMK,
      this.ruangMK,
      this.hariMK,
      this.sksMK,
      this.materiRef,
      this.ffRef})
      : super._();

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
        namaMK == other.namaMK &&
        dosenMK == other.dosenMK &&
        jamMK == other.jamMK &&
        ruangMK == other.ruangMK &&
        hariMK == other.hariMK &&
        sksMK == other.sksMK &&
        materiRef == other.materiRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, namaMK.hashCode), dosenMK.hashCode),
                            jamMK.hashCode),
                        ruangMK.hashCode),
                    hariMK.hashCode),
                sksMK.hashCode),
            materiRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MataKuliahRecord')
          ..add('namaMK', namaMK)
          ..add('dosenMK', dosenMK)
          ..add('jamMK', jamMK)
          ..add('ruangMK', ruangMK)
          ..add('hariMK', hariMK)
          ..add('sksMK', sksMK)
          ..add('materiRef', materiRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MataKuliahRecordBuilder
    implements Builder<MataKuliahRecord, MataKuliahRecordBuilder> {
  _$MataKuliahRecord? _$v;

  String? _namaMK;
  String? get namaMK => _$this._namaMK;
  set namaMK(String? namaMK) => _$this._namaMK = namaMK;

  String? _dosenMK;
  String? get dosenMK => _$this._dosenMK;
  set dosenMK(String? dosenMK) => _$this._dosenMK = dosenMK;

  String? _jamMK;
  String? get jamMK => _$this._jamMK;
  set jamMK(String? jamMK) => _$this._jamMK = jamMK;

  String? _ruangMK;
  String? get ruangMK => _$this._ruangMK;
  set ruangMK(String? ruangMK) => _$this._ruangMK = ruangMK;

  String? _hariMK;
  String? get hariMK => _$this._hariMK;
  set hariMK(String? hariMK) => _$this._hariMK = hariMK;

  int? _sksMK;
  int? get sksMK => _$this._sksMK;
  set sksMK(int? sksMK) => _$this._sksMK = sksMK;

  DocumentReference<Object?>? _materiRef;
  DocumentReference<Object?>? get materiRef => _$this._materiRef;
  set materiRef(DocumentReference<Object?>? materiRef) =>
      _$this._materiRef = materiRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MataKuliahRecordBuilder() {
    MataKuliahRecord._initializeBuilder(this);
  }

  MataKuliahRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _namaMK = $v.namaMK;
      _dosenMK = $v.dosenMK;
      _jamMK = $v.jamMK;
      _ruangMK = $v.ruangMK;
      _hariMK = $v.hariMK;
      _sksMK = $v.sksMK;
      _materiRef = $v.materiRef;
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
    final _$result = _$v ??
        new _$MataKuliahRecord._(
            namaMK: namaMK,
            dosenMK: dosenMK,
            jamMK: jamMK,
            ruangMK: ruangMK,
            hariMK: hariMK,
            sksMK: sksMK,
            materiRef: materiRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
