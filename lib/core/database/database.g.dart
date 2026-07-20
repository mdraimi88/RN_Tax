// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AssessmentYearsTable extends AssessmentYears
    with TableInfo<$AssessmentYearsTable, AssessmentYear> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentYearsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _isLockedMeta = const VerificationMeta(
    'isLocked',
  );
  @override
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
    'is_locked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_locked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    year,
    isActive,
    isLocked,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_years';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssessmentYear> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_locked')) {
      context.handle(
        _isLockedMeta,
        isLocked.isAcceptableOrUnknown(data['is_locked']!, _isLockedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentYear map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentYear(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isLocked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_locked'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $AssessmentYearsTable createAlias(String alias) {
    return $AssessmentYearsTable(attachedDatabase, alias);
  }
}

class AssessmentYear extends DataClass implements Insertable<AssessmentYear> {
  final int id;
  final int year;
  final bool isActive;
  final bool isLocked;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const AssessmentYear({
    required this.id,
    required this.year,
    required this.isActive,
    required this.isLocked,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<int>(year);
    map['is_active'] = Variable<bool>(isActive);
    map['is_locked'] = Variable<bool>(isLocked);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  AssessmentYearsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentYearsCompanion(
      id: Value(id),
      year: Value(year),
      isActive: Value(isActive),
      isLocked: Value(isLocked),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory AssessmentYear.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentYear(
      id: serializer.fromJson<int>(json['id']),
      year: serializer.fromJson<int>(json['year']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isLocked: serializer.fromJson<bool>(json['isLocked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int>(year),
      'isActive': serializer.toJson<bool>(isActive),
      'isLocked': serializer.toJson<bool>(isLocked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  AssessmentYear copyWith({
    int? id,
    int? year,
    bool? isActive,
    bool? isLocked,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => AssessmentYear(
    id: id ?? this.id,
    year: year ?? this.year,
    isActive: isActive ?? this.isActive,
    isLocked: isLocked ?? this.isLocked,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  AssessmentYear copyWithCompanion(AssessmentYearsCompanion data) {
    return AssessmentYear(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentYear(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('isActive: $isActive, ')
          ..write('isLocked: $isLocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, year, isActive, isLocked, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentYear &&
          other.id == this.id &&
          other.year == this.year &&
          other.isActive == this.isActive &&
          other.isLocked == this.isLocked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AssessmentYearsCompanion extends UpdateCompanion<AssessmentYear> {
  final Value<int> id;
  final Value<int> year;
  final Value<bool> isActive;
  final Value<bool> isLocked;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const AssessmentYearsCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AssessmentYearsCompanion.insert({
    this.id = const Value.absent(),
    required int year,
    this.isActive = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : year = Value(year);
  static Insertable<AssessmentYear> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<bool>? isActive,
    Expression<bool>? isLocked,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (isActive != null) 'is_active': isActive,
      if (isLocked != null) 'is_locked': isLocked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AssessmentYearsCompanion copyWith({
    Value<int>? id,
    Value<int>? year,
    Value<bool>? isActive,
    Value<bool>? isLocked,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return AssessmentYearsCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      isActive: isActive ?? this.isActive,
      isLocked: isLocked ?? this.isLocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isLocked.present) {
      map['is_locked'] = Variable<bool>(isLocked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentYearsCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('isActive: $isActive, ')
          ..write('isLocked: $isLocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaxCategoriesTable extends TaxCategories
    with TableInfo<$TaxCategoriesTable, TaxCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMsMeta = const VerificationMeta('nameMs');
  @override
  late final GeneratedColumn<String> nameMs = GeneratedColumn<String>(
    'name_ms',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameEnMeta = const VerificationMeta('nameEn');
  @override
  late final GeneratedColumn<String> nameEn = GeneratedColumn<String>(
    'name_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMsMeta = const VerificationMeta(
    'descriptionMs',
  );
  @override
  late final GeneratedColumn<String> descriptionMs = GeneratedColumn<String>(
    'description_ms',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionEnMeta = const VerificationMeta(
    'descriptionEn',
  );
  @override
  late final GeneratedColumn<String> descriptionEn = GeneratedColumn<String>(
    'description_en',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    nameMs,
    nameEn,
    descriptionMs,
    descriptionEn,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name_ms')) {
      context.handle(
        _nameMsMeta,
        nameMs.isAcceptableOrUnknown(data['name_ms']!, _nameMsMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMsMeta);
    }
    if (data.containsKey('name_en')) {
      context.handle(
        _nameEnMeta,
        nameEn.isAcceptableOrUnknown(data['name_en']!, _nameEnMeta),
      );
    } else if (isInserting) {
      context.missing(_nameEnMeta);
    }
    if (data.containsKey('description_ms')) {
      context.handle(
        _descriptionMsMeta,
        descriptionMs.isAcceptableOrUnknown(
          data['description_ms']!,
          _descriptionMsMeta,
        ),
      );
    }
    if (data.containsKey('description_en')) {
      context.handle(
        _descriptionEnMeta,
        descriptionEn.isAcceptableOrUnknown(
          data['description_en']!,
          _descriptionEnMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxCategory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      nameMs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_ms'],
      )!,
      nameEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name_en'],
      )!,
      descriptionMs: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_ms'],
      ),
      descriptionEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_en'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $TaxCategoriesTable createAlias(String alias) {
    return $TaxCategoriesTable(attachedDatabase, alias);
  }
}

class TaxCategory extends DataClass implements Insertable<TaxCategory> {
  final int id;
  final String code;
  final String nameMs;
  final String nameEn;
  final String? descriptionMs;
  final String? descriptionEn;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const TaxCategory({
    required this.id,
    required this.code,
    required this.nameMs,
    required this.nameEn,
    this.descriptionMs,
    this.descriptionEn,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name_ms'] = Variable<String>(nameMs);
    map['name_en'] = Variable<String>(nameEn);
    if (!nullToAbsent || descriptionMs != null) {
      map['description_ms'] = Variable<String>(descriptionMs);
    }
    if (!nullToAbsent || descriptionEn != null) {
      map['description_en'] = Variable<String>(descriptionEn);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TaxCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TaxCategoriesCompanion(
      id: Value(id),
      code: Value(code),
      nameMs: Value(nameMs),
      nameEn: Value(nameEn),
      descriptionMs: descriptionMs == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionMs),
      descriptionEn: descriptionEn == null && nullToAbsent
          ? const Value.absent()
          : Value(descriptionEn),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TaxCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxCategory(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      nameMs: serializer.fromJson<String>(json['nameMs']),
      nameEn: serializer.fromJson<String>(json['nameEn']),
      descriptionMs: serializer.fromJson<String?>(json['descriptionMs']),
      descriptionEn: serializer.fromJson<String?>(json['descriptionEn']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'nameMs': serializer.toJson<String>(nameMs),
      'nameEn': serializer.toJson<String>(nameEn),
      'descriptionMs': serializer.toJson<String?>(descriptionMs),
      'descriptionEn': serializer.toJson<String?>(descriptionEn),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  TaxCategory copyWith({
    int? id,
    String? code,
    String? nameMs,
    String? nameEn,
    Value<String?> descriptionMs = const Value.absent(),
    Value<String?> descriptionEn = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => TaxCategory(
    id: id ?? this.id,
    code: code ?? this.code,
    nameMs: nameMs ?? this.nameMs,
    nameEn: nameEn ?? this.nameEn,
    descriptionMs: descriptionMs.present
        ? descriptionMs.value
        : this.descriptionMs,
    descriptionEn: descriptionEn.present
        ? descriptionEn.value
        : this.descriptionEn,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  TaxCategory copyWithCompanion(TaxCategoriesCompanion data) {
    return TaxCategory(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      nameMs: data.nameMs.present ? data.nameMs.value : this.nameMs,
      nameEn: data.nameEn.present ? data.nameEn.value : this.nameEn,
      descriptionMs: data.descriptionMs.present
          ? data.descriptionMs.value
          : this.descriptionMs,
      descriptionEn: data.descriptionEn.present
          ? data.descriptionEn.value
          : this.descriptionEn,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxCategory(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('nameMs: $nameMs, ')
          ..write('nameEn: $nameEn, ')
          ..write('descriptionMs: $descriptionMs, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    nameMs,
    nameEn,
    descriptionMs,
    descriptionEn,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxCategory &&
          other.id == this.id &&
          other.code == this.code &&
          other.nameMs == this.nameMs &&
          other.nameEn == this.nameEn &&
          other.descriptionMs == this.descriptionMs &&
          other.descriptionEn == this.descriptionEn &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaxCategoriesCompanion extends UpdateCompanion<TaxCategory> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> nameMs;
  final Value<String> nameEn;
  final Value<String?> descriptionMs;
  final Value<String?> descriptionEn;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const TaxCategoriesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.nameMs = const Value.absent(),
    this.nameEn = const Value.absent(),
    this.descriptionMs = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TaxCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String nameMs,
    required String nameEn,
    this.descriptionMs = const Value.absent(),
    this.descriptionEn = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : code = Value(code),
       nameMs = Value(nameMs),
       nameEn = Value(nameEn);
  static Insertable<TaxCategory> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? nameMs,
    Expression<String>? nameEn,
    Expression<String>? descriptionMs,
    Expression<String>? descriptionEn,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (nameMs != null) 'name_ms': nameMs,
      if (nameEn != null) 'name_en': nameEn,
      if (descriptionMs != null) 'description_ms': descriptionMs,
      if (descriptionEn != null) 'description_en': descriptionEn,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TaxCategoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? nameMs,
    Value<String>? nameEn,
    Value<String?>? descriptionMs,
    Value<String?>? descriptionEn,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return TaxCategoriesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      nameMs: nameMs ?? this.nameMs,
      nameEn: nameEn ?? this.nameEn,
      descriptionMs: descriptionMs ?? this.descriptionMs,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (nameMs.present) {
      map['name_ms'] = Variable<String>(nameMs.value);
    }
    if (nameEn.present) {
      map['name_en'] = Variable<String>(nameEn.value);
    }
    if (descriptionMs.present) {
      map['description_ms'] = Variable<String>(descriptionMs.value);
    }
    if (descriptionEn.present) {
      map['description_en'] = Variable<String>(descriptionEn.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('nameMs: $nameMs, ')
          ..write('nameEn: $nameEn, ')
          ..write('descriptionMs: $descriptionMs, ')
          ..write('descriptionEn: $descriptionEn, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaxRulesTable extends TaxRules with TableInfo<$TaxRulesTable, TaxRule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _assessmentYearIdMeta = const VerificationMeta(
    'assessmentYearId',
  );
  @override
  late final GeneratedColumn<int> assessmentYearId = GeneratedColumn<int>(
    'assessment_year_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES assessment_years (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tax_categories (id)',
    ),
  );
  static const VerificationMeta _maximumAmountMeta = const VerificationMeta(
    'maximumAmount',
  );
  @override
  late final GeneratedColumn<double> maximumAmount = GeneratedColumn<double>(
    'maximum_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    assessmentYearId,
    categoryId,
    maximumAmount,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxRule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('assessment_year_id')) {
      context.handle(
        _assessmentYearIdMeta,
        assessmentYearId.isAcceptableOrUnknown(
          data['assessment_year_id']!,
          _assessmentYearIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentYearIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('maximum_amount')) {
      context.handle(
        _maximumAmountMeta,
        maximumAmount.isAcceptableOrUnknown(
          data['maximum_amount']!,
          _maximumAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_maximumAmountMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxRule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxRule(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      assessmentYearId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assessment_year_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      maximumAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}maximum_amount'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $TaxRulesTable createAlias(String alias) {
    return $TaxRulesTable(attachedDatabase, alias);
  }
}

class TaxRule extends DataClass implements Insertable<TaxRule> {
  final int id;
  final int assessmentYearId;
  final int categoryId;
  final double maximumAmount;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const TaxRule({
    required this.id,
    required this.assessmentYearId,
    required this.categoryId,
    required this.maximumAmount,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['assessment_year_id'] = Variable<int>(assessmentYearId);
    map['category_id'] = Variable<int>(categoryId);
    map['maximum_amount'] = Variable<double>(maximumAmount);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TaxRulesCompanion toCompanion(bool nullToAbsent) {
    return TaxRulesCompanion(
      id: Value(id),
      assessmentYearId: Value(assessmentYearId),
      categoryId: Value(categoryId),
      maximumAmount: Value(maximumAmount),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TaxRule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxRule(
      id: serializer.fromJson<int>(json['id']),
      assessmentYearId: serializer.fromJson<int>(json['assessmentYearId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      maximumAmount: serializer.fromJson<double>(json['maximumAmount']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'assessmentYearId': serializer.toJson<int>(assessmentYearId),
      'categoryId': serializer.toJson<int>(categoryId),
      'maximumAmount': serializer.toJson<double>(maximumAmount),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  TaxRule copyWith({
    int? id,
    int? assessmentYearId,
    int? categoryId,
    double? maximumAmount,
    bool? isActive,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => TaxRule(
    id: id ?? this.id,
    assessmentYearId: assessmentYearId ?? this.assessmentYearId,
    categoryId: categoryId ?? this.categoryId,
    maximumAmount: maximumAmount ?? this.maximumAmount,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  TaxRule copyWithCompanion(TaxRulesCompanion data) {
    return TaxRule(
      id: data.id.present ? data.id.value : this.id,
      assessmentYearId: data.assessmentYearId.present
          ? data.assessmentYearId.value
          : this.assessmentYearId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      maximumAmount: data.maximumAmount.present
          ? data.maximumAmount.value
          : this.maximumAmount,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxRule(')
          ..write('id: $id, ')
          ..write('assessmentYearId: $assessmentYearId, ')
          ..write('categoryId: $categoryId, ')
          ..write('maximumAmount: $maximumAmount, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    assessmentYearId,
    categoryId,
    maximumAmount,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxRule &&
          other.id == this.id &&
          other.assessmentYearId == this.assessmentYearId &&
          other.categoryId == this.categoryId &&
          other.maximumAmount == this.maximumAmount &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaxRulesCompanion extends UpdateCompanion<TaxRule> {
  final Value<int> id;
  final Value<int> assessmentYearId;
  final Value<int> categoryId;
  final Value<double> maximumAmount;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const TaxRulesCompanion({
    this.id = const Value.absent(),
    this.assessmentYearId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.maximumAmount = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TaxRulesCompanion.insert({
    this.id = const Value.absent(),
    required int assessmentYearId,
    required int categoryId,
    required double maximumAmount,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : assessmentYearId = Value(assessmentYearId),
       categoryId = Value(categoryId),
       maximumAmount = Value(maximumAmount);
  static Insertable<TaxRule> custom({
    Expression<int>? id,
    Expression<int>? assessmentYearId,
    Expression<int>? categoryId,
    Expression<double>? maximumAmount,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentYearId != null) 'assessment_year_id': assessmentYearId,
      if (categoryId != null) 'category_id': categoryId,
      if (maximumAmount != null) 'maximum_amount': maximumAmount,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TaxRulesCompanion copyWith({
    Value<int>? id,
    Value<int>? assessmentYearId,
    Value<int>? categoryId,
    Value<double>? maximumAmount,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return TaxRulesCompanion(
      id: id ?? this.id,
      assessmentYearId: assessmentYearId ?? this.assessmentYearId,
      categoryId: categoryId ?? this.categoryId,
      maximumAmount: maximumAmount ?? this.maximumAmount,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (assessmentYearId.present) {
      map['assessment_year_id'] = Variable<int>(assessmentYearId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (maximumAmount.present) {
      map['maximum_amount'] = Variable<double>(maximumAmount.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxRulesCompanion(')
          ..write('id: $id, ')
          ..write('assessmentYearId: $assessmentYearId, ')
          ..write('categoryId: $categoryId, ')
          ..write('maximumAmount: $maximumAmount, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TaxReliefsTable extends TaxReliefs
    with TableInfo<$TaxReliefsTable, TaxRelief> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaxReliefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleBmMeta = const VerificationMeta(
    'titleBm',
  );
  @override
  late final GeneratedColumn<String> titleBm = GeneratedColumn<String>(
    'title_bm',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleEnMeta = const VerificationMeta(
    'titleEn',
  );
  @override
  late final GeneratedColumn<String> titleEn = GeneratedColumn<String>(
    'title_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxAmountMeta = const VerificationMeta(
    'maxAmount',
  );
  @override
  late final GeneratedColumn<double> maxAmount = GeneratedColumn<double>(
    'max_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _assessmentYearMeta = const VerificationMeta(
    'assessmentYear',
  );
  @override
  late final GeneratedColumn<int> assessmentYear = GeneratedColumn<int>(
    'assessment_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    category,
    titleBm,
    titleEn,
    maxAmount,
    isActive,
    assessmentYear,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tax_reliefs';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaxRelief> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('title_bm')) {
      context.handle(
        _titleBmMeta,
        titleBm.isAcceptableOrUnknown(data['title_bm']!, _titleBmMeta),
      );
    } else if (isInserting) {
      context.missing(_titleBmMeta);
    }
    if (data.containsKey('title_en')) {
      context.handle(
        _titleEnMeta,
        titleEn.isAcceptableOrUnknown(data['title_en']!, _titleEnMeta),
      );
    } else if (isInserting) {
      context.missing(_titleEnMeta);
    }
    if (data.containsKey('max_amount')) {
      context.handle(
        _maxAmountMeta,
        maxAmount.isAcceptableOrUnknown(data['max_amount']!, _maxAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_maxAmountMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('assessment_year')) {
      context.handle(
        _assessmentYearMeta,
        assessmentYear.isAcceptableOrUnknown(
          data['assessment_year']!,
          _assessmentYearMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentYearMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaxRelief map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaxRelief(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      titleBm: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_bm'],
      )!,
      titleEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_en'],
      )!,
      maxAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_amount'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      assessmentYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assessment_year'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $TaxReliefsTable createAlias(String alias) {
    return $TaxReliefsTable(attachedDatabase, alias);
  }
}

class TaxRelief extends DataClass implements Insertable<TaxRelief> {
  final int id;
  final String code;
  final String category;
  final String titleBm;
  final String titleEn;
  final double maxAmount;
  final bool isActive;
  final int assessmentYear;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const TaxRelief({
    required this.id,
    required this.code,
    required this.category,
    required this.titleBm,
    required this.titleEn,
    required this.maxAmount,
    required this.isActive,
    required this.assessmentYear,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['category'] = Variable<String>(category);
    map['title_bm'] = Variable<String>(titleBm);
    map['title_en'] = Variable<String>(titleEn);
    map['max_amount'] = Variable<double>(maxAmount);
    map['is_active'] = Variable<bool>(isActive);
    map['assessment_year'] = Variable<int>(assessmentYear);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  TaxReliefsCompanion toCompanion(bool nullToAbsent) {
    return TaxReliefsCompanion(
      id: Value(id),
      code: Value(code),
      category: Value(category),
      titleBm: Value(titleBm),
      titleEn: Value(titleEn),
      maxAmount: Value(maxAmount),
      isActive: Value(isActive),
      assessmentYear: Value(assessmentYear),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory TaxRelief.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaxRelief(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      category: serializer.fromJson<String>(json['category']),
      titleBm: serializer.fromJson<String>(json['titleBm']),
      titleEn: serializer.fromJson<String>(json['titleEn']),
      maxAmount: serializer.fromJson<double>(json['maxAmount']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      assessmentYear: serializer.fromJson<int>(json['assessmentYear']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'category': serializer.toJson<String>(category),
      'titleBm': serializer.toJson<String>(titleBm),
      'titleEn': serializer.toJson<String>(titleEn),
      'maxAmount': serializer.toJson<double>(maxAmount),
      'isActive': serializer.toJson<bool>(isActive),
      'assessmentYear': serializer.toJson<int>(assessmentYear),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  TaxRelief copyWith({
    int? id,
    String? code,
    String? category,
    String? titleBm,
    String? titleEn,
    double? maxAmount,
    bool? isActive,
    int? assessmentYear,
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => TaxRelief(
    id: id ?? this.id,
    code: code ?? this.code,
    category: category ?? this.category,
    titleBm: titleBm ?? this.titleBm,
    titleEn: titleEn ?? this.titleEn,
    maxAmount: maxAmount ?? this.maxAmount,
    isActive: isActive ?? this.isActive,
    assessmentYear: assessmentYear ?? this.assessmentYear,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  TaxRelief copyWithCompanion(TaxReliefsCompanion data) {
    return TaxRelief(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      category: data.category.present ? data.category.value : this.category,
      titleBm: data.titleBm.present ? data.titleBm.value : this.titleBm,
      titleEn: data.titleEn.present ? data.titleEn.value : this.titleEn,
      maxAmount: data.maxAmount.present ? data.maxAmount.value : this.maxAmount,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      assessmentYear: data.assessmentYear.present
          ? data.assessmentYear.value
          : this.assessmentYear,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaxRelief(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('category: $category, ')
          ..write('titleBm: $titleBm, ')
          ..write('titleEn: $titleEn, ')
          ..write('maxAmount: $maxAmount, ')
          ..write('isActive: $isActive, ')
          ..write('assessmentYear: $assessmentYear, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    category,
    titleBm,
    titleEn,
    maxAmount,
    isActive,
    assessmentYear,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaxRelief &&
          other.id == this.id &&
          other.code == this.code &&
          other.category == this.category &&
          other.titleBm == this.titleBm &&
          other.titleEn == this.titleEn &&
          other.maxAmount == this.maxAmount &&
          other.isActive == this.isActive &&
          other.assessmentYear == this.assessmentYear &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TaxReliefsCompanion extends UpdateCompanion<TaxRelief> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> category;
  final Value<String> titleBm;
  final Value<String> titleEn;
  final Value<double> maxAmount;
  final Value<bool> isActive;
  final Value<int> assessmentYear;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const TaxReliefsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.category = const Value.absent(),
    this.titleBm = const Value.absent(),
    this.titleEn = const Value.absent(),
    this.maxAmount = const Value.absent(),
    this.isActive = const Value.absent(),
    this.assessmentYear = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TaxReliefsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String category,
    required String titleBm,
    required String titleEn,
    required double maxAmount,
    this.isActive = const Value.absent(),
    required int assessmentYear,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : code = Value(code),
       category = Value(category),
       titleBm = Value(titleBm),
       titleEn = Value(titleEn),
       maxAmount = Value(maxAmount),
       assessmentYear = Value(assessmentYear);
  static Insertable<TaxRelief> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? category,
    Expression<String>? titleBm,
    Expression<String>? titleEn,
    Expression<double>? maxAmount,
    Expression<bool>? isActive,
    Expression<int>? assessmentYear,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (category != null) 'category': category,
      if (titleBm != null) 'title_bm': titleBm,
      if (titleEn != null) 'title_en': titleEn,
      if (maxAmount != null) 'max_amount': maxAmount,
      if (isActive != null) 'is_active': isActive,
      if (assessmentYear != null) 'assessment_year': assessmentYear,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TaxReliefsCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? category,
    Value<String>? titleBm,
    Value<String>? titleEn,
    Value<double>? maxAmount,
    Value<bool>? isActive,
    Value<int>? assessmentYear,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return TaxReliefsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      category: category ?? this.category,
      titleBm: titleBm ?? this.titleBm,
      titleEn: titleEn ?? this.titleEn,
      maxAmount: maxAmount ?? this.maxAmount,
      isActive: isActive ?? this.isActive,
      assessmentYear: assessmentYear ?? this.assessmentYear,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (titleBm.present) {
      map['title_bm'] = Variable<String>(titleBm.value);
    }
    if (titleEn.present) {
      map['title_en'] = Variable<String>(titleEn.value);
    }
    if (maxAmount.present) {
      map['max_amount'] = Variable<double>(maxAmount.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (assessmentYear.present) {
      map['assessment_year'] = Variable<int>(assessmentYear.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaxReliefsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('category: $category, ')
          ..write('titleBm: $titleBm, ')
          ..write('titleEn: $titleEn, ')
          ..write('maxAmount: $maxAmount, ')
          ..write('isActive: $isActive, ')
          ..write('assessmentYear: $assessmentYear, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ReceiptsTable extends Receipts with TableInfo<$ReceiptsTable, Receipt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _assessmentYearIdMeta = const VerificationMeta(
    'assessmentYearId',
  );
  @override
  late final GeneratedColumn<int> assessmentYearId = GeneratedColumn<int>(
    'assessment_year_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES assessment_years (id)',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tax_categories (id)',
    ),
  );
  static const VerificationMeta _merchantMeta = const VerificationMeta(
    'merchant',
  );
  @override
  late final GeneratedColumn<String> merchant = GeneratedColumn<String>(
    'merchant',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receiptNumberMeta = const VerificationMeta(
    'receiptNumber',
  );
  @override
  late final GeneratedColumn<String> receiptNumber = GeneratedColumn<String>(
    'receipt_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receiptDateMeta = const VerificationMeta(
    'receiptDate',
  );
  @override
  late final GeneratedColumn<DateTime> receiptDate = GeneratedColumn<DateTime>(
    'receipt_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ocrTextMeta = const VerificationMeta(
    'ocrText',
  );
  @override
  late final GeneratedColumn<String> ocrText = GeneratedColumn<String>(
    'ocr_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    assessmentYearId,
    categoryId,
    merchant,
    receiptNumber,
    receiptDate,
    amount,
    imagePath,
    notes,
    ocrText,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Receipt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('assessment_year_id')) {
      context.handle(
        _assessmentYearIdMeta,
        assessmentYearId.isAcceptableOrUnknown(
          data['assessment_year_id']!,
          _assessmentYearIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_assessmentYearIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('merchant')) {
      context.handle(
        _merchantMeta,
        merchant.isAcceptableOrUnknown(data['merchant']!, _merchantMeta),
      );
    } else if (isInserting) {
      context.missing(_merchantMeta);
    }
    if (data.containsKey('receipt_number')) {
      context.handle(
        _receiptNumberMeta,
        receiptNumber.isAcceptableOrUnknown(
          data['receipt_number']!,
          _receiptNumberMeta,
        ),
      );
    }
    if (data.containsKey('receipt_date')) {
      context.handle(
        _receiptDateMeta,
        receiptDate.isAcceptableOrUnknown(
          data['receipt_date']!,
          _receiptDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_receiptDateMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('ocr_text')) {
      context.handle(
        _ocrTextMeta,
        ocrText.isAcceptableOrUnknown(data['ocr_text']!, _ocrTextMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Receipt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Receipt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      assessmentYearId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}assessment_year_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      merchant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}merchant'],
      )!,
      receiptNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}receipt_number'],
      ),
      receiptDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}receipt_date'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      ocrText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ocr_text'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $ReceiptsTable createAlias(String alias) {
    return $ReceiptsTable(attachedDatabase, alias);
  }
}

class Receipt extends DataClass implements Insertable<Receipt> {
  final int id;
  final int assessmentYearId;
  final int categoryId;
  final String merchant;

  /// Receipt / Invoice Number
  final String? receiptNumber;
  final DateTime receiptDate;
  final double amount;

  /// Local image path
  final String imagePath;

  /// Optional user notes
  final String? notes;

  /// Raw OCR result for future processing
  final String? ocrText;
  final DateTime createdAt;
  final DateTime? updatedAt;
  const Receipt({
    required this.id,
    required this.assessmentYearId,
    required this.categoryId,
    required this.merchant,
    this.receiptNumber,
    required this.receiptDate,
    required this.amount,
    required this.imagePath,
    this.notes,
    this.ocrText,
    required this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['assessment_year_id'] = Variable<int>(assessmentYearId);
    map['category_id'] = Variable<int>(categoryId);
    map['merchant'] = Variable<String>(merchant);
    if (!nullToAbsent || receiptNumber != null) {
      map['receipt_number'] = Variable<String>(receiptNumber);
    }
    map['receipt_date'] = Variable<DateTime>(receiptDate);
    map['amount'] = Variable<double>(amount);
    map['image_path'] = Variable<String>(imagePath);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || ocrText != null) {
      map['ocr_text'] = Variable<String>(ocrText);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  ReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptsCompanion(
      id: Value(id),
      assessmentYearId: Value(assessmentYearId),
      categoryId: Value(categoryId),
      merchant: Value(merchant),
      receiptNumber: receiptNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(receiptNumber),
      receiptDate: Value(receiptDate),
      amount: Value(amount),
      imagePath: Value(imagePath),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      ocrText: ocrText == null && nullToAbsent
          ? const Value.absent()
          : Value(ocrText),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Receipt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Receipt(
      id: serializer.fromJson<int>(json['id']),
      assessmentYearId: serializer.fromJson<int>(json['assessmentYearId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      merchant: serializer.fromJson<String>(json['merchant']),
      receiptNumber: serializer.fromJson<String?>(json['receiptNumber']),
      receiptDate: serializer.fromJson<DateTime>(json['receiptDate']),
      amount: serializer.fromJson<double>(json['amount']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      notes: serializer.fromJson<String?>(json['notes']),
      ocrText: serializer.fromJson<String?>(json['ocrText']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'assessmentYearId': serializer.toJson<int>(assessmentYearId),
      'categoryId': serializer.toJson<int>(categoryId),
      'merchant': serializer.toJson<String>(merchant),
      'receiptNumber': serializer.toJson<String?>(receiptNumber),
      'receiptDate': serializer.toJson<DateTime>(receiptDate),
      'amount': serializer.toJson<double>(amount),
      'imagePath': serializer.toJson<String>(imagePath),
      'notes': serializer.toJson<String?>(notes),
      'ocrText': serializer.toJson<String?>(ocrText),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Receipt copyWith({
    int? id,
    int? assessmentYearId,
    int? categoryId,
    String? merchant,
    Value<String?> receiptNumber = const Value.absent(),
    DateTime? receiptDate,
    double? amount,
    String? imagePath,
    Value<String?> notes = const Value.absent(),
    Value<String?> ocrText = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> updatedAt = const Value.absent(),
  }) => Receipt(
    id: id ?? this.id,
    assessmentYearId: assessmentYearId ?? this.assessmentYearId,
    categoryId: categoryId ?? this.categoryId,
    merchant: merchant ?? this.merchant,
    receiptNumber: receiptNumber.present
        ? receiptNumber.value
        : this.receiptNumber,
    receiptDate: receiptDate ?? this.receiptDate,
    amount: amount ?? this.amount,
    imagePath: imagePath ?? this.imagePath,
    notes: notes.present ? notes.value : this.notes,
    ocrText: ocrText.present ? ocrText.value : this.ocrText,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  Receipt copyWithCompanion(ReceiptsCompanion data) {
    return Receipt(
      id: data.id.present ? data.id.value : this.id,
      assessmentYearId: data.assessmentYearId.present
          ? data.assessmentYearId.value
          : this.assessmentYearId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      merchant: data.merchant.present ? data.merchant.value : this.merchant,
      receiptNumber: data.receiptNumber.present
          ? data.receiptNumber.value
          : this.receiptNumber,
      receiptDate: data.receiptDate.present
          ? data.receiptDate.value
          : this.receiptDate,
      amount: data.amount.present ? data.amount.value : this.amount,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      notes: data.notes.present ? data.notes.value : this.notes,
      ocrText: data.ocrText.present ? data.ocrText.value : this.ocrText,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Receipt(')
          ..write('id: $id, ')
          ..write('assessmentYearId: $assessmentYearId, ')
          ..write('categoryId: $categoryId, ')
          ..write('merchant: $merchant, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('receiptDate: $receiptDate, ')
          ..write('amount: $amount, ')
          ..write('imagePath: $imagePath, ')
          ..write('notes: $notes, ')
          ..write('ocrText: $ocrText, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    assessmentYearId,
    categoryId,
    merchant,
    receiptNumber,
    receiptDate,
    amount,
    imagePath,
    notes,
    ocrText,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Receipt &&
          other.id == this.id &&
          other.assessmentYearId == this.assessmentYearId &&
          other.categoryId == this.categoryId &&
          other.merchant == this.merchant &&
          other.receiptNumber == this.receiptNumber &&
          other.receiptDate == this.receiptDate &&
          other.amount == this.amount &&
          other.imagePath == this.imagePath &&
          other.notes == this.notes &&
          other.ocrText == this.ocrText &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ReceiptsCompanion extends UpdateCompanion<Receipt> {
  final Value<int> id;
  final Value<int> assessmentYearId;
  final Value<int> categoryId;
  final Value<String> merchant;
  final Value<String?> receiptNumber;
  final Value<DateTime> receiptDate;
  final Value<double> amount;
  final Value<String> imagePath;
  final Value<String?> notes;
  final Value<String?> ocrText;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  const ReceiptsCompanion({
    this.id = const Value.absent(),
    this.assessmentYearId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.merchant = const Value.absent(),
    this.receiptNumber = const Value.absent(),
    this.receiptDate = const Value.absent(),
    this.amount = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.notes = const Value.absent(),
    this.ocrText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ReceiptsCompanion.insert({
    this.id = const Value.absent(),
    required int assessmentYearId,
    required int categoryId,
    required String merchant,
    this.receiptNumber = const Value.absent(),
    required DateTime receiptDate,
    required double amount,
    required String imagePath,
    this.notes = const Value.absent(),
    this.ocrText = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : assessmentYearId = Value(assessmentYearId),
       categoryId = Value(categoryId),
       merchant = Value(merchant),
       receiptDate = Value(receiptDate),
       amount = Value(amount),
       imagePath = Value(imagePath);
  static Insertable<Receipt> custom({
    Expression<int>? id,
    Expression<int>? assessmentYearId,
    Expression<int>? categoryId,
    Expression<String>? merchant,
    Expression<String>? receiptNumber,
    Expression<DateTime>? receiptDate,
    Expression<double>? amount,
    Expression<String>? imagePath,
    Expression<String>? notes,
    Expression<String>? ocrText,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assessmentYearId != null) 'assessment_year_id': assessmentYearId,
      if (categoryId != null) 'category_id': categoryId,
      if (merchant != null) 'merchant': merchant,
      if (receiptNumber != null) 'receipt_number': receiptNumber,
      if (receiptDate != null) 'receipt_date': receiptDate,
      if (amount != null) 'amount': amount,
      if (imagePath != null) 'image_path': imagePath,
      if (notes != null) 'notes': notes,
      if (ocrText != null) 'ocr_text': ocrText,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ReceiptsCompanion copyWith({
    Value<int>? id,
    Value<int>? assessmentYearId,
    Value<int>? categoryId,
    Value<String>? merchant,
    Value<String?>? receiptNumber,
    Value<DateTime>? receiptDate,
    Value<double>? amount,
    Value<String>? imagePath,
    Value<String?>? notes,
    Value<String?>? ocrText,
    Value<DateTime>? createdAt,
    Value<DateTime?>? updatedAt,
  }) {
    return ReceiptsCompanion(
      id: id ?? this.id,
      assessmentYearId: assessmentYearId ?? this.assessmentYearId,
      categoryId: categoryId ?? this.categoryId,
      merchant: merchant ?? this.merchant,
      receiptNumber: receiptNumber ?? this.receiptNumber,
      receiptDate: receiptDate ?? this.receiptDate,
      amount: amount ?? this.amount,
      imagePath: imagePath ?? this.imagePath,
      notes: notes ?? this.notes,
      ocrText: ocrText ?? this.ocrText,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (assessmentYearId.present) {
      map['assessment_year_id'] = Variable<int>(assessmentYearId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (merchant.present) {
      map['merchant'] = Variable<String>(merchant.value);
    }
    if (receiptNumber.present) {
      map['receipt_number'] = Variable<String>(receiptNumber.value);
    }
    if (receiptDate.present) {
      map['receipt_date'] = Variable<DateTime>(receiptDate.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (ocrText.present) {
      map['ocr_text'] = Variable<String>(ocrText.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('assessmentYearId: $assessmentYearId, ')
          ..write('categoryId: $categoryId, ')
          ..write('merchant: $merchant, ')
          ..write('receiptNumber: $receiptNumber, ')
          ..write('receiptDate: $receiptDate, ')
          ..write('amount: $amount, ')
          ..write('imagePath: $imagePath, ')
          ..write('notes: $notes, ')
          ..write('ocrText: $ocrText, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AssessmentYearsTable assessmentYears = $AssessmentYearsTable(
    this,
  );
  late final $TaxCategoriesTable taxCategories = $TaxCategoriesTable(this);
  late final $TaxRulesTable taxRules = $TaxRulesTable(this);
  late final $TaxReliefsTable taxReliefs = $TaxReliefsTable(this);
  late final $ReceiptsTable receipts = $ReceiptsTable(this);
  late final AssessmentYearDao assessmentYearDao = AssessmentYearDao(
    this as AppDatabase,
  );
  late final TaxCategoryDao taxCategoryDao = TaxCategoryDao(
    this as AppDatabase,
  );
  late final TaxRuleDao taxRuleDao = TaxRuleDao(this as AppDatabase);
  late final ReceiptDao receiptDao = ReceiptDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    assessmentYears,
    taxCategories,
    taxRules,
    taxReliefs,
    receipts,
  ];
}

typedef $$AssessmentYearsTableCreateCompanionBuilder =
    AssessmentYearsCompanion Function({
      Value<int> id,
      required int year,
      Value<bool> isActive,
      Value<bool> isLocked,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$AssessmentYearsTableUpdateCompanionBuilder =
    AssessmentYearsCompanion Function({
      Value<int> id,
      Value<int> year,
      Value<bool> isActive,
      Value<bool> isLocked,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$AssessmentYearsTableReferences
    extends
        BaseReferences<_$AppDatabase, $AssessmentYearsTable, AssessmentYear> {
  $$AssessmentYearsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TaxRulesTable, List<TaxRule>> _taxRulesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.taxRules,
    aliasName: 'assessment_years__id__tax_rules__assessment_year_id',
  );

  $$TaxRulesTableProcessedTableManager get taxRulesRefs {
    final manager = $$TaxRulesTableTableManager(
      $_db,
      $_db.taxRules,
    ).filter((f) => f.assessmentYearId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_taxRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReceiptsTable, List<Receipt>> _receiptsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.receipts,
    aliasName: 'assessment_years__id__receipts__assessment_year_id',
  );

  $$ReceiptsTableProcessedTableManager get receiptsRefs {
    final manager = $$ReceiptsTableTableManager(
      $_db,
      $_db.receipts,
    ).filter((f) => f.assessmentYearId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AssessmentYearsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentYearsTable> {
  $$AssessmentYearsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> taxRulesRefs(
    Expression<bool> Function($$TaxRulesTableFilterComposer f) f,
  ) {
    final $$TaxRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taxRules,
      getReferencedColumn: (t) => t.assessmentYearId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxRulesTableFilterComposer(
            $db: $db,
            $table: $db.taxRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> receiptsRefs(
    Expression<bool> Function($$ReceiptsTableFilterComposer f) f,
  ) {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.receipts,
      getReferencedColumn: (t) => t.assessmentYearId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReceiptsTableFilterComposer(
            $db: $db,
            $table: $db.receipts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssessmentYearsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentYearsTable> {
  $$AssessmentYearsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLocked => $composableBuilder(
    column: $table.isLocked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssessmentYearsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentYearsTable> {
  $$AssessmentYearsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> taxRulesRefs<T extends Object>(
    Expression<T> Function($$TaxRulesTableAnnotationComposer a) f,
  ) {
    final $$TaxRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taxRules,
      getReferencedColumn: (t) => t.assessmentYearId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> receiptsRefs<T extends Object>(
    Expression<T> Function($$ReceiptsTableAnnotationComposer a) f,
  ) {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.receipts,
      getReferencedColumn: (t) => t.assessmentYearId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReceiptsTableAnnotationComposer(
            $db: $db,
            $table: $db.receipts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssessmentYearsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssessmentYearsTable,
          AssessmentYear,
          $$AssessmentYearsTableFilterComposer,
          $$AssessmentYearsTableOrderingComposer,
          $$AssessmentYearsTableAnnotationComposer,
          $$AssessmentYearsTableCreateCompanionBuilder,
          $$AssessmentYearsTableUpdateCompanionBuilder,
          (AssessmentYear, $$AssessmentYearsTableReferences),
          AssessmentYear,
          PrefetchHooks Function({bool taxRulesRefs, bool receiptsRefs})
        > {
  $$AssessmentYearsTableTableManager(
    _$AppDatabase db,
    $AssessmentYearsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentYearsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentYearsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentYearsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> year = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => AssessmentYearsCompanion(
                id: id,
                year: year,
                isActive: isActive,
                isLocked: isLocked,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int year,
                Value<bool> isActive = const Value.absent(),
                Value<bool> isLocked = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => AssessmentYearsCompanion.insert(
                id: id,
                year: year,
                isActive: isActive,
                isLocked: isLocked,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AssessmentYearsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({taxRulesRefs = false, receiptsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (taxRulesRefs) db.taxRules,
                    if (receiptsRefs) db.receipts,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (taxRulesRefs)
                        await $_getPrefetchedData<
                          AssessmentYear,
                          $AssessmentYearsTable,
                          TaxRule
                        >(
                          currentTable: table,
                          referencedTable: $$AssessmentYearsTableReferences
                              ._taxRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AssessmentYearsTableReferences(
                                db,
                                table,
                                p0,
                              ).taxRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.assessmentYearId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (receiptsRefs)
                        await $_getPrefetchedData<
                          AssessmentYear,
                          $AssessmentYearsTable,
                          Receipt
                        >(
                          currentTable: table,
                          referencedTable: $$AssessmentYearsTableReferences
                              ._receiptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AssessmentYearsTableReferences(
                                db,
                                table,
                                p0,
                              ).receiptsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.assessmentYearId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AssessmentYearsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssessmentYearsTable,
      AssessmentYear,
      $$AssessmentYearsTableFilterComposer,
      $$AssessmentYearsTableOrderingComposer,
      $$AssessmentYearsTableAnnotationComposer,
      $$AssessmentYearsTableCreateCompanionBuilder,
      $$AssessmentYearsTableUpdateCompanionBuilder,
      (AssessmentYear, $$AssessmentYearsTableReferences),
      AssessmentYear,
      PrefetchHooks Function({bool taxRulesRefs, bool receiptsRefs})
    >;
typedef $$TaxCategoriesTableCreateCompanionBuilder =
    TaxCategoriesCompanion Function({
      Value<int> id,
      required String code,
      required String nameMs,
      required String nameEn,
      Value<String?> descriptionMs,
      Value<String?> descriptionEn,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$TaxCategoriesTableUpdateCompanionBuilder =
    TaxCategoriesCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> nameMs,
      Value<String> nameEn,
      Value<String?> descriptionMs,
      Value<String?> descriptionEn,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$TaxCategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $TaxCategoriesTable, TaxCategory> {
  $$TaxCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$TaxRulesTable, List<TaxRule>> _taxRulesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.taxRules,
    aliasName: 'tax_categories__id__tax_rules__category_id',
  );

  $$TaxRulesTableProcessedTableManager get taxRulesRefs {
    final manager = $$TaxRulesTableTableManager(
      $_db,
      $_db.taxRules,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_taxRulesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReceiptsTable, List<Receipt>> _receiptsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.receipts,
    aliasName: 'tax_categories__id__receipts__category_id',
  );

  $$ReceiptsTableProcessedTableManager get receiptsRefs {
    final manager = $$ReceiptsTableTableManager(
      $_db,
      $_db.receipts,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TaxCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $TaxCategoriesTable> {
  $$TaxCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameMs => $composableBuilder(
    column: $table.nameMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionMs => $composableBuilder(
    column: $table.descriptionMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> taxRulesRefs(
    Expression<bool> Function($$TaxRulesTableFilterComposer f) f,
  ) {
    final $$TaxRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taxRules,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxRulesTableFilterComposer(
            $db: $db,
            $table: $db.taxRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> receiptsRefs(
    Expression<bool> Function($$ReceiptsTableFilterComposer f) f,
  ) {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.receipts,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReceiptsTableFilterComposer(
            $db: $db,
            $table: $db.receipts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaxCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaxCategoriesTable> {
  $$TaxCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameMs => $composableBuilder(
    column: $table.nameMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nameEn => $composableBuilder(
    column: $table.nameEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionMs => $composableBuilder(
    column: $table.descriptionMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaxCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaxCategoriesTable> {
  $$TaxCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get nameMs =>
      $composableBuilder(column: $table.nameMs, builder: (column) => column);

  GeneratedColumn<String> get nameEn =>
      $composableBuilder(column: $table.nameEn, builder: (column) => column);

  GeneratedColumn<String> get descriptionMs => $composableBuilder(
    column: $table.descriptionMs,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionEn => $composableBuilder(
    column: $table.descriptionEn,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> taxRulesRefs<T extends Object>(
    Expression<T> Function($$TaxRulesTableAnnotationComposer a) f,
  ) {
    final $$TaxRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taxRules,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> receiptsRefs<T extends Object>(
    Expression<T> Function($$ReceiptsTableAnnotationComposer a) f,
  ) {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.receipts,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReceiptsTableAnnotationComposer(
            $db: $db,
            $table: $db.receipts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TaxCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaxCategoriesTable,
          TaxCategory,
          $$TaxCategoriesTableFilterComposer,
          $$TaxCategoriesTableOrderingComposer,
          $$TaxCategoriesTableAnnotationComposer,
          $$TaxCategoriesTableCreateCompanionBuilder,
          $$TaxCategoriesTableUpdateCompanionBuilder,
          (TaxCategory, $$TaxCategoriesTableReferences),
          TaxCategory,
          PrefetchHooks Function({bool taxRulesRefs, bool receiptsRefs})
        > {
  $$TaxCategoriesTableTableManager(_$AppDatabase db, $TaxCategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> nameMs = const Value.absent(),
                Value<String> nameEn = const Value.absent(),
                Value<String?> descriptionMs = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => TaxCategoriesCompanion(
                id: id,
                code: code,
                nameMs: nameMs,
                nameEn: nameEn,
                descriptionMs: descriptionMs,
                descriptionEn: descriptionEn,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String nameMs,
                required String nameEn,
                Value<String?> descriptionMs = const Value.absent(),
                Value<String?> descriptionEn = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => TaxCategoriesCompanion.insert(
                id: id,
                code: code,
                nameMs: nameMs,
                nameEn: nameEn,
                descriptionMs: descriptionMs,
                descriptionEn: descriptionEn,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TaxCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({taxRulesRefs = false, receiptsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (taxRulesRefs) db.taxRules,
                    if (receiptsRefs) db.receipts,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (taxRulesRefs)
                        await $_getPrefetchedData<
                          TaxCategory,
                          $TaxCategoriesTable,
                          TaxRule
                        >(
                          currentTable: table,
                          referencedTable: $$TaxCategoriesTableReferences
                              ._taxRulesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TaxCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).taxRulesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (receiptsRefs)
                        await $_getPrefetchedData<
                          TaxCategory,
                          $TaxCategoriesTable,
                          Receipt
                        >(
                          currentTable: table,
                          referencedTable: $$TaxCategoriesTableReferences
                              ._receiptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TaxCategoriesTableReferences(
                                db,
                                table,
                                p0,
                              ).receiptsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.categoryId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TaxCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaxCategoriesTable,
      TaxCategory,
      $$TaxCategoriesTableFilterComposer,
      $$TaxCategoriesTableOrderingComposer,
      $$TaxCategoriesTableAnnotationComposer,
      $$TaxCategoriesTableCreateCompanionBuilder,
      $$TaxCategoriesTableUpdateCompanionBuilder,
      (TaxCategory, $$TaxCategoriesTableReferences),
      TaxCategory,
      PrefetchHooks Function({bool taxRulesRefs, bool receiptsRefs})
    >;
typedef $$TaxRulesTableCreateCompanionBuilder =
    TaxRulesCompanion Function({
      Value<int> id,
      required int assessmentYearId,
      required int categoryId,
      required double maximumAmount,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$TaxRulesTableUpdateCompanionBuilder =
    TaxRulesCompanion Function({
      Value<int> id,
      Value<int> assessmentYearId,
      Value<int> categoryId,
      Value<double> maximumAmount,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$TaxRulesTableReferences
    extends BaseReferences<_$AppDatabase, $TaxRulesTable, TaxRule> {
  $$TaxRulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AssessmentYearsTable _assessmentYearIdTable(_$AppDatabase db) => db
      .assessmentYears
      .createAlias('tax_rules__assessment_year_id__assessment_years__id');

  $$AssessmentYearsTableProcessedTableManager get assessmentYearId {
    final $_column = $_itemColumn<int>('assessment_year_id')!;

    final manager = $$AssessmentYearsTableTableManager(
      $_db,
      $_db.assessmentYears,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_assessmentYearIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TaxCategoriesTable _categoryIdTable(_$AppDatabase db) => db
      .taxCategories
      .createAlias('tax_rules__category_id__tax_categories__id');

  $$TaxCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$TaxCategoriesTableTableManager(
      $_db,
      $_db.taxCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TaxRulesTableFilterComposer
    extends Composer<_$AppDatabase, $TaxRulesTable> {
  $$TaxRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maximumAmount => $composableBuilder(
    column: $table.maximumAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AssessmentYearsTableFilterComposer get assessmentYearId {
    final $$AssessmentYearsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentYearId,
      referencedTable: $db.assessmentYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentYearsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxCategoriesTableFilterComposer get categoryId {
    final $$TaxCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.taxCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.taxCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaxRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaxRulesTable> {
  $$TaxRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maximumAmount => $composableBuilder(
    column: $table.maximumAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AssessmentYearsTableOrderingComposer get assessmentYearId {
    final $$AssessmentYearsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentYearId,
      referencedTable: $db.assessmentYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentYearsTableOrderingComposer(
            $db: $db,
            $table: $db.assessmentYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxCategoriesTableOrderingComposer get categoryId {
    final $$TaxCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.taxCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.taxCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaxRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaxRulesTable> {
  $$TaxRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get maximumAmount => $composableBuilder(
    column: $table.maximumAmount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AssessmentYearsTableAnnotationComposer get assessmentYearId {
    final $$AssessmentYearsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentYearId,
      referencedTable: $db.assessmentYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentYearsTableAnnotationComposer(
            $db: $db,
            $table: $db.assessmentYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxCategoriesTableAnnotationComposer get categoryId {
    final $$TaxCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.taxCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaxRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaxRulesTable,
          TaxRule,
          $$TaxRulesTableFilterComposer,
          $$TaxRulesTableOrderingComposer,
          $$TaxRulesTableAnnotationComposer,
          $$TaxRulesTableCreateCompanionBuilder,
          $$TaxRulesTableUpdateCompanionBuilder,
          (TaxRule, $$TaxRulesTableReferences),
          TaxRule,
          PrefetchHooks Function({bool assessmentYearId, bool categoryId})
        > {
  $$TaxRulesTableTableManager(_$AppDatabase db, $TaxRulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> assessmentYearId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<double> maximumAmount = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => TaxRulesCompanion(
                id: id,
                assessmentYearId: assessmentYearId,
                categoryId: categoryId,
                maximumAmount: maximumAmount,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int assessmentYearId,
                required int categoryId,
                required double maximumAmount,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => TaxRulesCompanion.insert(
                id: id,
                assessmentYearId: assessmentYearId,
                categoryId: categoryId,
                maximumAmount: maximumAmount,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TaxRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({assessmentYearId = false, categoryId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (assessmentYearId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.assessmentYearId,
                                    referencedTable: $$TaxRulesTableReferences
                                        ._assessmentYearIdTable(db),
                                    referencedColumn: $$TaxRulesTableReferences
                                        ._assessmentYearIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable: $$TaxRulesTableReferences
                                        ._categoryIdTable(db),
                                    referencedColumn: $$TaxRulesTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$TaxRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaxRulesTable,
      TaxRule,
      $$TaxRulesTableFilterComposer,
      $$TaxRulesTableOrderingComposer,
      $$TaxRulesTableAnnotationComposer,
      $$TaxRulesTableCreateCompanionBuilder,
      $$TaxRulesTableUpdateCompanionBuilder,
      (TaxRule, $$TaxRulesTableReferences),
      TaxRule,
      PrefetchHooks Function({bool assessmentYearId, bool categoryId})
    >;
typedef $$TaxReliefsTableCreateCompanionBuilder =
    TaxReliefsCompanion Function({
      Value<int> id,
      required String code,
      required String category,
      required String titleBm,
      required String titleEn,
      required double maxAmount,
      Value<bool> isActive,
      required int assessmentYear,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$TaxReliefsTableUpdateCompanionBuilder =
    TaxReliefsCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> category,
      Value<String> titleBm,
      Value<String> titleEn,
      Value<double> maxAmount,
      Value<bool> isActive,
      Value<int> assessmentYear,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

class $$TaxReliefsTableFilterComposer
    extends Composer<_$AppDatabase, $TaxReliefsTable> {
  $$TaxReliefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleBm => $composableBuilder(
    column: $table.titleBm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxAmount => $composableBuilder(
    column: $table.maxAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get assessmentYear => $composableBuilder(
    column: $table.assessmentYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TaxReliefsTableOrderingComposer
    extends Composer<_$AppDatabase, $TaxReliefsTable> {
  $$TaxReliefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleBm => $composableBuilder(
    column: $table.titleBm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxAmount => $composableBuilder(
    column: $table.maxAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get assessmentYear => $composableBuilder(
    column: $table.assessmentYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TaxReliefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaxReliefsTable> {
  $$TaxReliefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get titleBm =>
      $composableBuilder(column: $table.titleBm, builder: (column) => column);

  GeneratedColumn<String> get titleEn =>
      $composableBuilder(column: $table.titleEn, builder: (column) => column);

  GeneratedColumn<double> get maxAmount =>
      $composableBuilder(column: $table.maxAmount, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get assessmentYear => $composableBuilder(
    column: $table.assessmentYear,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TaxReliefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaxReliefsTable,
          TaxRelief,
          $$TaxReliefsTableFilterComposer,
          $$TaxReliefsTableOrderingComposer,
          $$TaxReliefsTableAnnotationComposer,
          $$TaxReliefsTableCreateCompanionBuilder,
          $$TaxReliefsTableUpdateCompanionBuilder,
          (
            TaxRelief,
            BaseReferences<_$AppDatabase, $TaxReliefsTable, TaxRelief>,
          ),
          TaxRelief,
          PrefetchHooks Function()
        > {
  $$TaxReliefsTableTableManager(_$AppDatabase db, $TaxReliefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaxReliefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaxReliefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaxReliefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> titleBm = const Value.absent(),
                Value<String> titleEn = const Value.absent(),
                Value<double> maxAmount = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> assessmentYear = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => TaxReliefsCompanion(
                id: id,
                code: code,
                category: category,
                titleBm: titleBm,
                titleEn: titleEn,
                maxAmount: maxAmount,
                isActive: isActive,
                assessmentYear: assessmentYear,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String category,
                required String titleBm,
                required String titleEn,
                required double maxAmount,
                Value<bool> isActive = const Value.absent(),
                required int assessmentYear,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => TaxReliefsCompanion.insert(
                id: id,
                code: code,
                category: category,
                titleBm: titleBm,
                titleEn: titleEn,
                maxAmount: maxAmount,
                isActive: isActive,
                assessmentYear: assessmentYear,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TaxReliefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaxReliefsTable,
      TaxRelief,
      $$TaxReliefsTableFilterComposer,
      $$TaxReliefsTableOrderingComposer,
      $$TaxReliefsTableAnnotationComposer,
      $$TaxReliefsTableCreateCompanionBuilder,
      $$TaxReliefsTableUpdateCompanionBuilder,
      (TaxRelief, BaseReferences<_$AppDatabase, $TaxReliefsTable, TaxRelief>),
      TaxRelief,
      PrefetchHooks Function()
    >;
typedef $$ReceiptsTableCreateCompanionBuilder =
    ReceiptsCompanion Function({
      Value<int> id,
      required int assessmentYearId,
      required int categoryId,
      required String merchant,
      Value<String?> receiptNumber,
      required DateTime receiptDate,
      required double amount,
      required String imagePath,
      Value<String?> notes,
      Value<String?> ocrText,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });
typedef $$ReceiptsTableUpdateCompanionBuilder =
    ReceiptsCompanion Function({
      Value<int> id,
      Value<int> assessmentYearId,
      Value<int> categoryId,
      Value<String> merchant,
      Value<String?> receiptNumber,
      Value<DateTime> receiptDate,
      Value<double> amount,
      Value<String> imagePath,
      Value<String?> notes,
      Value<String?> ocrText,
      Value<DateTime> createdAt,
      Value<DateTime?> updatedAt,
    });

final class $$ReceiptsTableReferences
    extends BaseReferences<_$AppDatabase, $ReceiptsTable, Receipt> {
  $$ReceiptsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AssessmentYearsTable _assessmentYearIdTable(_$AppDatabase db) => db
      .assessmentYears
      .createAlias('receipts__assessment_year_id__assessment_years__id');

  $$AssessmentYearsTableProcessedTableManager get assessmentYearId {
    final $_column = $_itemColumn<int>('assessment_year_id')!;

    final manager = $$AssessmentYearsTableTableManager(
      $_db,
      $_db.assessmentYears,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_assessmentYearIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TaxCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.taxCategories.createAlias('receipts__category_id__tax_categories__id');

  $$TaxCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager = $$TaxCategoriesTableTableManager(
      $_db,
      $_db.taxCategories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get merchant => $composableBuilder(
    column: $table.merchant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receiptDate => $composableBuilder(
    column: $table.receiptDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ocrText => $composableBuilder(
    column: $table.ocrText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AssessmentYearsTableFilterComposer get assessmentYearId {
    final $$AssessmentYearsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentYearId,
      referencedTable: $db.assessmentYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentYearsTableFilterComposer(
            $db: $db,
            $table: $db.assessmentYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxCategoriesTableFilterComposer get categoryId {
    final $$TaxCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.taxCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.taxCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get merchant => $composableBuilder(
    column: $table.merchant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receiptDate => $composableBuilder(
    column: $table.receiptDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ocrText => $composableBuilder(
    column: $table.ocrText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AssessmentYearsTableOrderingComposer get assessmentYearId {
    final $$AssessmentYearsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentYearId,
      referencedTable: $db.assessmentYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentYearsTableOrderingComposer(
            $db: $db,
            $table: $db.assessmentYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxCategoriesTableOrderingComposer get categoryId {
    final $$TaxCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.taxCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.taxCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get merchant =>
      $composableBuilder(column: $table.merchant, builder: (column) => column);

  GeneratedColumn<String> get receiptNumber => $composableBuilder(
    column: $table.receiptNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receiptDate => $composableBuilder(
    column: $table.receiptDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get ocrText =>
      $composableBuilder(column: $table.ocrText, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AssessmentYearsTableAnnotationComposer get assessmentYearId {
    final $$AssessmentYearsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assessmentYearId,
      referencedTable: $db.assessmentYears,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssessmentYearsTableAnnotationComposer(
            $db: $db,
            $table: $db.assessmentYears,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TaxCategoriesTableAnnotationComposer get categoryId {
    final $$TaxCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.taxCategories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaxCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.taxCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReceiptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReceiptsTable,
          Receipt,
          $$ReceiptsTableFilterComposer,
          $$ReceiptsTableOrderingComposer,
          $$ReceiptsTableAnnotationComposer,
          $$ReceiptsTableCreateCompanionBuilder,
          $$ReceiptsTableUpdateCompanionBuilder,
          (Receipt, $$ReceiptsTableReferences),
          Receipt,
          PrefetchHooks Function({bool assessmentYearId, bool categoryId})
        > {
  $$ReceiptsTableTableManager(_$AppDatabase db, $ReceiptsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> assessmentYearId = const Value.absent(),
                Value<int> categoryId = const Value.absent(),
                Value<String> merchant = const Value.absent(),
                Value<String?> receiptNumber = const Value.absent(),
                Value<DateTime> receiptDate = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> ocrText = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => ReceiptsCompanion(
                id: id,
                assessmentYearId: assessmentYearId,
                categoryId: categoryId,
                merchant: merchant,
                receiptNumber: receiptNumber,
                receiptDate: receiptDate,
                amount: amount,
                imagePath: imagePath,
                notes: notes,
                ocrText: ocrText,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int assessmentYearId,
                required int categoryId,
                required String merchant,
                Value<String?> receiptNumber = const Value.absent(),
                required DateTime receiptDate,
                required double amount,
                required String imagePath,
                Value<String?> notes = const Value.absent(),
                Value<String?> ocrText = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> updatedAt = const Value.absent(),
              }) => ReceiptsCompanion.insert(
                id: id,
                assessmentYearId: assessmentYearId,
                categoryId: categoryId,
                merchant: merchant,
                receiptNumber: receiptNumber,
                receiptDate: receiptDate,
                amount: amount,
                imagePath: imagePath,
                notes: notes,
                ocrText: ocrText,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReceiptsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({assessmentYearId = false, categoryId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (assessmentYearId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.assessmentYearId,
                                    referencedTable: $$ReceiptsTableReferences
                                        ._assessmentYearIdTable(db),
                                    referencedColumn: $$ReceiptsTableReferences
                                        ._assessmentYearIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (categoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.categoryId,
                                    referencedTable: $$ReceiptsTableReferences
                                        ._categoryIdTable(db),
                                    referencedColumn: $$ReceiptsTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ReceiptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReceiptsTable,
      Receipt,
      $$ReceiptsTableFilterComposer,
      $$ReceiptsTableOrderingComposer,
      $$ReceiptsTableAnnotationComposer,
      $$ReceiptsTableCreateCompanionBuilder,
      $$ReceiptsTableUpdateCompanionBuilder,
      (Receipt, $$ReceiptsTableReferences),
      Receipt,
      PrefetchHooks Function({bool assessmentYearId, bool categoryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AssessmentYearsTableTableManager get assessmentYears =>
      $$AssessmentYearsTableTableManager(_db, _db.assessmentYears);
  $$TaxCategoriesTableTableManager get taxCategories =>
      $$TaxCategoriesTableTableManager(_db, _db.taxCategories);
  $$TaxRulesTableTableManager get taxRules =>
      $$TaxRulesTableTableManager(_db, _db.taxRules);
  $$TaxReliefsTableTableManager get taxReliefs =>
      $$TaxReliefsTableTableManager(_db, _db.taxReliefs);
  $$ReceiptsTableTableManager get receipts =>
      $$ReceiptsTableTableManager(_db, _db.receipts);
}
