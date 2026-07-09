// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

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
  @override
  List<GeneratedColumn> get $columns => [id, year, isActive, createdAt];
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
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
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
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
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
  final DateTime createdAt;
  const AssessmentYear({
    required this.id,
    required this.year,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['year'] = Variable<int>(year);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AssessmentYearsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentYearsCompanion(
      id: Value(id),
      year: Value(year),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'year': serializer.toJson<int>(year),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AssessmentYear copyWith({
    int? id,
    int? year,
    bool? isActive,
    DateTime? createdAt,
  }) => AssessmentYear(
    id: id ?? this.id,
    year: year ?? this.year,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  AssessmentYear copyWithCompanion(AssessmentYearsCompanion data) {
    return AssessmentYear(
      id: data.id.present ? data.id.value : this.id,
      year: data.year.present ? data.year.value : this.year,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentYear(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, year, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentYear &&
          other.id == this.id &&
          other.year == this.year &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class AssessmentYearsCompanion extends UpdateCompanion<AssessmentYear> {
  final Value<int> id;
  final Value<int> year;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const AssessmentYearsCompanion({
    this.id = const Value.absent(),
    this.year = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AssessmentYearsCompanion.insert({
    this.id = const Value.absent(),
    required int year,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : year = Value(year);
  static Insertable<AssessmentYear> custom({
    Expression<int>? id,
    Expression<int>? year,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (year != null) 'year': year,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AssessmentYearsCompanion copyWith({
    Value<int>? id,
    Value<int>? year,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return AssessmentYearsCompanion(
      id: id ?? this.id,
      year: year ?? this.year,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentYearsCompanion(')
          ..write('id: $id, ')
          ..write('year: $year, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [assessmentYears];
}

typedef $$AssessmentYearsTableCreateCompanionBuilder =
    AssessmentYearsCompanion Function({
      Value<int> id,
      required int year,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$AssessmentYearsTableUpdateCompanionBuilder =
    AssessmentYearsCompanion Function({
      Value<int> id,
      Value<int> year,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
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

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
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
          (
            AssessmentYear,
            BaseReferences<
              _$AppDatabase,
              $AssessmentYearsTable,
              AssessmentYear
            >,
          ),
          AssessmentYear,
          PrefetchHooks Function()
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
                Value<DateTime> createdAt = const Value.absent(),
              }) => AssessmentYearsCompanion(
                id: id,
                year: year,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int year,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AssessmentYearsCompanion.insert(
                id: id,
                year: year,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (
        AssessmentYear,
        BaseReferences<_$AppDatabase, $AssessmentYearsTable, AssessmentYear>,
      ),
      AssessmentYear,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AssessmentYearsTableTableManager get assessmentYears =>
      $$AssessmentYearsTableTableManager(_db, _db.assessmentYears);
}
