// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_group.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetPerformanceGroupModelDbCollection on Isar {
  IsarCollection<PerformanceGroupModelDb> get performanceGroupModelDbs {
    return getCollection('PerformanceGroupModelDb');
  }
}

final PerformanceGroupModelDbSchema = CollectionSchema(
  name: 'PerformanceGroupModelDb',
  schema:
      '{"name":"PerformanceGroupModelDb","idName":"id","properties":[{"name":"age","type":"Long"},{"name":"day","type":"String"},{"name":"groupId","type":"Long"},{"name":"part","type":"Long"},{"name":"problem","type":"Long"},{"name":"stage","type":"Long"}],"indexes":[{"name":"stage_problem_age","unique":false,"properties":[{"name":"stage","type":"Value","caseSensitive":false},{"name":"problem","type":"Value","caseSensitive":false},{"name":"age","type":"Value","caseSensitive":false}]}],"links":[{"name":"performancesIsarLinks","target":"PerformanceModelDb"}]}',
  nativeAdapter: const _PerformanceGroupModelDbNativeAdapter(),
  webAdapter: const _PerformanceGroupModelDbWebAdapter(),
  idName: 'id',
  propertyIds: {
    'age': 0,
    'day': 1,
    'groupId': 2,
    'part': 3,
    'problem': 4,
    'stage': 5
  },
  listProperties: {},
  indexIds: {'stage_problem_age': 0},
  indexTypes: {
    'stage_problem_age': [
      NativeIndexType.long,
      NativeIndexType.long,
      NativeIndexType.long,
    ]
  },
  linkIds: {'performancesIsarLinks': 0},
  backlinkIds: {},
  linkedCollections: ['PerformanceModelDb'],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [obj.performancesIsarLinks],
  version: 2,
);

class _PerformanceGroupModelDbWebAdapter
    extends IsarWebTypeAdapter<PerformanceGroupModelDb> {
  const _PerformanceGroupModelDbWebAdapter();

  @override
  Object serialize(IsarCollection<PerformanceGroupModelDb> collection,
      PerformanceGroupModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'age', object.age);
    IsarNative.jsObjectSet(jsObj, 'day', object.day);
    IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'part', object.part);
    IsarNative.jsObjectSet(jsObj, 'problem', object.problem);
    IsarNative.jsObjectSet(jsObj, 'stage', object.stage);
    return jsObj;
  }

  @override
  PerformanceGroupModelDb deserialize(
      IsarCollection<PerformanceGroupModelDb> collection, dynamic jsObj) {
    final object = PerformanceGroupModelDb();
    object.age =
        IsarNative.jsObjectGet(jsObj, 'age') ?? double.negativeInfinity;
    object.day = IsarNative.jsObjectGet(jsObj, 'day') ?? '';
    object.groupId =
        IsarNative.jsObjectGet(jsObj, 'groupId') ?? double.negativeInfinity;
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.part =
        IsarNative.jsObjectGet(jsObj, 'part') ?? double.negativeInfinity;
    object.problem =
        IsarNative.jsObjectGet(jsObj, 'problem') ?? double.negativeInfinity;
    object.stage =
        IsarNative.jsObjectGet(jsObj, 'stage') ?? double.negativeInfinity;
    attachLinks(collection.isar, IsarNative.jsObjectGet(jsObj, 'id'), object);
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'age':
        return (IsarNative.jsObjectGet(jsObj, 'age') ?? double.negativeInfinity)
            as P;
      case 'day':
        return (IsarNative.jsObjectGet(jsObj, 'day') ?? '') as P;
      case 'groupId':
        return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'part':
        return (IsarNative.jsObjectGet(jsObj, 'part') ??
            double.negativeInfinity) as P;
      case 'problem':
        return (IsarNative.jsObjectGet(jsObj, 'problem') ??
            double.negativeInfinity) as P;
      case 'stage':
        return (IsarNative.jsObjectGet(jsObj, 'stage') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, PerformanceGroupModelDb object) {
    object.performancesIsarLinks.attach(
      id,
      isar.performanceGroupModelDbs,
      isar.getCollection<PerformanceModelDb>('PerformanceModelDb'),
      'performancesIsarLinks',
      false,
    );
  }
}

class _PerformanceGroupModelDbNativeAdapter
    extends IsarNativeTypeAdapter<PerformanceGroupModelDb> {
  const _PerformanceGroupModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<PerformanceGroupModelDb> collection,
      IsarRawObject rawObj,
      PerformanceGroupModelDb object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.age;
    final _age = value0;
    final value1 = object.day;
    final _day = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_day.length) as int;
    final value2 = object.groupId;
    final _groupId = value2;
    final value3 = object.part;
    final _part = value3;
    final value4 = object.problem;
    final _problem = value4;
    final value5 = object.stage;
    final _stage = value5;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _age);
    writer.writeBytes(offsets[1], _day);
    writer.writeLong(offsets[2], _groupId);
    writer.writeLong(offsets[3], _part);
    writer.writeLong(offsets[4], _problem);
    writer.writeLong(offsets[5], _stage);
  }

  @override
  PerformanceGroupModelDb deserialize(
      IsarCollection<PerformanceGroupModelDb> collection,
      int id,
      IsarBinaryReader reader,
      List<int> offsets) {
    final object = PerformanceGroupModelDb();
    object.age = reader.readLong(offsets[0]);
    object.day = reader.readString(offsets[1]);
    object.groupId = reader.readLong(offsets[2]);
    object.id = id;
    object.part = reader.readLong(offsets[3]);
    object.problem = reader.readLong(offsets[4]);
    object.stage = reader.readLong(offsets[5]);
    attachLinks(collection.isar, id, object);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLong(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readLong(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      case 4:
        return (reader.readLong(offset)) as P;
      case 5:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, PerformanceGroupModelDb object) {
    object.performancesIsarLinks.attach(
      id,
      isar.performanceGroupModelDbs,
      isar.getCollection<PerformanceModelDb>('PerformanceModelDb'),
      'performancesIsarLinks',
      false,
    );
  }
}

extension PerformanceGroupModelDbQueryWhereSort
    on QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QWhere> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterWhere>
      anyStageProblemAge() {
    return addWhereClauseInternal(
        const WhereClause(indexName: 'stage_problem_age'));
  }
}

extension PerformanceGroupModelDbQueryWhere on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QWhereClause> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualTo(int stage) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage],
      includeLower: true,
      upper: [stage],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageNotEqualTo(int stage) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        upper: [stage],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        lower: [stage],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        lower: [stage],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        upper: [stage],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageGreaterThan(
    int stage, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage],
      includeLower: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageLessThan(
    int stage, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      upper: [stage],
      includeUpper: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageBetween(
    int lowerStage,
    int upperStage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [lowerStage],
      includeLower: includeLower,
      upper: [upperStage],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualTo(int stage, int problem) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage, problem],
      includeLower: true,
      upper: [stage, problem],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemNotEqualTo(int stage, int problem) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        upper: [stage, problem],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        lower: [stage, problem],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        lower: [stage, problem],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        upper: [stage, problem],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToProblemGreaterThan(
    int stage,
    int problem, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage, problem],
      includeLower: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToProblemLessThan(
    int stage,
    int problem, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      upper: [stage, problem],
      includeUpper: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToProblemBetween(
    int stage,
    int lowerProblem,
    int upperProblem, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage, lowerProblem],
      includeLower: includeLower,
      upper: [stage, upperProblem],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterWhereClause>
      stageProblemAgeEqualTo(int stage, int problem, int age) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage, problem, age],
      includeLower: true,
      upper: [stage, problem, age],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterWhereClause>
      stageProblemAgeNotEqualTo(int stage, int problem, int age) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        upper: [stage, problem, age],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        lower: [stage, problem, age],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        lower: [stage, problem, age],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'stage_problem_age',
        upper: [stage, problem, age],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAgeGreaterThan(
    int stage,
    int problem,
    int age, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage, problem, age],
      includeLower: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAgeLessThan(
    int stage,
    int problem,
    int age, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      upper: [stage, problem, age],
      includeUpper: include,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAgeBetween(
    int stage,
    int problem,
    int lowerAge,
    int upperAge, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'stage_problem_age',
      lower: [stage, problem, lowerAge],
      includeLower: includeLower,
      upper: [stage, problem, upperAge],
      includeUpper: includeUpper,
    ));
  }
}

extension PerformanceGroupModelDbQueryFilter on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QFilterCondition> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'age',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'day',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      dayContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      dayMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'day',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'groupId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'part',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'part',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'part',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'part',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'problem',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'problem',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'problem',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'problem',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stage',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'stage',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'stage',
      value: value,
    ));
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'stage',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension PerformanceGroupModelDbQueryLinks on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QFilterCondition> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      performancesIsarLinks(FilterQuery<PerformanceModelDb> q) {
    return linkInternal(
      isar.performanceModelDbs,
      q,
      'performancesIsarLinks',
    );
  }
}

extension PerformanceGroupModelDbQueryWhereSortBy
    on QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QSortBy> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByDay() {
    return addSortByInternal('day', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByDayDesc() {
    return addSortByInternal('day', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByPart() {
    return addSortByInternal('part', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByPartDesc() {
    return addSortByInternal('part', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByProblem() {
    return addSortByInternal('problem', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByProblemDesc() {
    return addSortByInternal('problem', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByStage() {
    return addSortByInternal('stage', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByStageDesc() {
    return addSortByInternal('stage', Sort.desc);
  }
}

extension PerformanceGroupModelDbQueryWhereSortThenBy on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QSortThenBy> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByDay() {
    return addSortByInternal('day', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByDayDesc() {
    return addSortByInternal('day', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByPart() {
    return addSortByInternal('part', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByPartDesc() {
    return addSortByInternal('part', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByProblem() {
    return addSortByInternal('problem', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByProblemDesc() {
    return addSortByInternal('problem', Sort.desc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByStage() {
    return addSortByInternal('stage', Sort.asc);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByStageDesc() {
    return addSortByInternal('stage', Sort.desc);
  }
}

extension PerformanceGroupModelDbQueryWhereDistinct on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByAge() {
    return addDistinctByInternal('age');
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByDay({bool caseSensitive = true}) {
    return addDistinctByInternal('day', caseSensitive: caseSensitive);
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByPart() {
    return addDistinctByInternal('part');
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByProblem() {
    return addDistinctByInternal('problem');
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByStage() {
    return addDistinctByInternal('stage');
  }
}

extension PerformanceGroupModelDbQueryProperty on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QQueryProperty> {
  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> ageProperty() {
    return addPropertyNameInternal('age');
  }

  QueryBuilder<PerformanceGroupModelDb, String, QQueryOperations>
      dayProperty() {
    return addPropertyNameInternal('day');
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations>
      groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<PerformanceGroupModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> partProperty() {
    return addPropertyNameInternal('part');
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations>
      problemProperty() {
    return addPropertyNameInternal('problem');
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> stageProperty() {
    return addPropertyNameInternal('stage');
  }
}
