// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jadwal_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<JadwalRecord> _$jadwalRecordSerializer =
    new _$JadwalRecordSerializer();

class _$JadwalRecordSerializer implements StructuredSerializer<JadwalRecord> {
  @override
  final Iterable<Type> types = const [JadwalRecord, _$JadwalRecord];
  @override
  final String wireName = 'JadwalRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, JadwalRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.mk;
    if (value != null) {
      result
        ..add('mk')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dosen;
    if (value != null) {
      result
        ..add('dosen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.jam;
    if (value != null) {
      result
        ..add('jam')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ruang;
    if (value != null) {
      result
        ..add('ruang')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.hari;
    if (value != null) {
      result
        ..add('hari')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.sks;
    if (value != null) {
      result
        ..add('sks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.index;
    if (value != null) {
      result
        ..add('index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.tugasMKref;
    if (value != null) {
      result
        ..add('tugasMKref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.materiMKref;
    if (value != null) {
      result
        ..add('materiMKref')
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
  JadwalRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new JadwalRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'mk':
          result.mk = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dosen':
          result.dosen = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'jam':
          result.jam = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ruang':
          result.ruang = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'hari':
          result.hari = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sks':
          result.sks = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'tugasMKref':
          result.tugasMKref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'materiMKref':
          result.materiMKref = serializers.deserialize(value,
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

class _$JadwalRecord extends JadwalRecord {
  @override
  final String? mk;
  @override
  final String? dosen;
  @override
  final String? jam;
  @override
  final String? ruang;
  @override
  final String? hari;
  @override
  final String? sks;
  @override
  final int? index;
  @override
  final DocumentReference<Object?>? tugasMKref;
  @override
  final DocumentReference<Object?>? materiMKref;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$JadwalRecord([void Function(JadwalRecordBuilder)? updates]) =>
      (new JadwalRecordBuilder()..update(updates))._build();

  _$JadwalRecord._(
      {this.mk,
      this.dosen,
      this.jam,
      this.ruang,
      this.hari,
      this.sks,
      this.index,
      this.tugasMKref,
      this.materiMKref,
      this.ffRef})
      : super._();

  @override
  JadwalRecord rebuild(void Function(JadwalRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JadwalRecordBuilder toBuilder() => new JadwalRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JadwalRecord &&
        mk == other.mk &&
        dosen == other.dosen &&
        jam == other.jam &&
        ruang == other.ruang &&
        hari == other.hari &&
        sks == other.sks &&
        index == other.index &&
        tugasMKref == other.tugasMKref &&
        materiMKref == other.materiMKref &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, mk.hashCode), dosen.hashCode),
                                    jam.hashCode),
                                ruang.hashCode),
                            hari.hashCode),
                        sks.hashCode),
                    index.hashCode),
                tugasMKref.hashCode),
            materiMKref.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JadwalRecord')
          ..add('mk', mk)
          ..add('dosen', dosen)
          ..add('jam', jam)
          ..add('ruang', ruang)
          ..add('hari', hari)
          ..add('sks', sks)
          ..add('index', index)
          ..add('tugasMKref', tugasMKref)
          ..add('materiMKref', materiMKref)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class JadwalRecordBuilder
    implements Builder<JadwalRecord, JadwalRecordBuilder> {
  _$JadwalRecord? _$v;

  String? _mk;
  String? get mk => _$this._mk;
  set mk(String? mk) => _$this._mk = mk;

  String? _dosen;
  String? get dosen => _$this._dosen;
  set dosen(String? dosen) => _$this._dosen = dosen;

  String? _jam;
  String? get jam => _$this._jam;
  set jam(String? jam) => _$this._jam = jam;

  String? _ruang;
  String? get ruang => _$this._ruang;
  set ruang(String? ruang) => _$this._ruang = ruang;

  String? _hari;
  String? get hari => _$this._hari;
  set hari(String? hari) => _$this._hari = hari;

  String? _sks;
  String? get sks => _$this._sks;
  set sks(String? sks) => _$this._sks = sks;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  DocumentReference<Object?>? _tugasMKref;
  DocumentReference<Object?>? get tugasMKref => _$this._tugasMKref;
  set tugasMKref(DocumentReference<Object?>? tugasMKref) =>
      _$this._tugasMKref = tugasMKref;

  DocumentReference<Object?>? _materiMKref;
  DocumentReference<Object?>? get materiMKref => _$this._materiMKref;
  set materiMKref(DocumentReference<Object?>? materiMKref) =>
      _$this._materiMKref = materiMKref;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  JadwalRecordBuilder() {
    JadwalRecord._initializeBuilder(this);
  }

  JadwalRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mk = $v.mk;
      _dosen = $v.dosen;
      _jam = $v.jam;
      _ruang = $v.ruang;
      _hari = $v.hari;
      _sks = $v.sks;
      _index = $v.index;
      _tugasMKref = $v.tugasMKref;
      _materiMKref = $v.materiMKref;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JadwalRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JadwalRecord;
  }

  @override
  void update(void Function(JadwalRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JadwalRecord build() => _build();

  _$JadwalRecord _build() {
    final _$result = _$v ??
        new _$JadwalRecord._(
            mk: mk,
            dosen: dosen,
            jam: jam,
            ruang: ruang,
            hari: hari,
            sks: sks,
            index: index,
            tugasMKref: tugasMKref,
            materiMKref: materiMKref,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
