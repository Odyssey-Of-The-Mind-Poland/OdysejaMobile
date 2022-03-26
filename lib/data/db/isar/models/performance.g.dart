// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetPerformanceModelDbCollection on Isar {
  IsarCollection<PerformanceModelDb> get performanceModelDbs {
    return getCollection('PerformanceModelDb');
  }
}

final PerformanceModelDbSchema = CollectionSchema(
  name: 'PerformanceModelDb',
  schema:
      '{"name":"PerformanceModelDb","idName":"id","properties":[{"name":"age","type":"Long"},{"name":"city","type":"Long"},{"name":"groupId","type":"Long"},{"name":"isFavourite","type":"Bool"},{"name":"part","type":"Long"},{"name":"performance","type":"String"},{"name":"performanceDay","type":"String"},{"name":"performanceId","type":"Long"},{"name":"problem","type":"Long"},{"name":"spontan","type":"String"},{"name":"spontanDay","type":"String"},{"name":"stage","type":"Long"},{"name":"team","type":"String"}],"indexes":[{"name":"city_team","unique":false,"properties":[{"name":"city","type":"Value","caseSensitive":false},{"name":"team","type":"Hash","caseSensitive":true}]},{"name":"isFavourite","unique":false,"properties":[{"name":"isFavourite","type":"Value","caseSensitive":false}]},{"name":"team","unique":false,"properties":[{"name":"team","type":"Hash","caseSensitive":true}]}],"links":[]}',
  nativeAdapter: const _PerformanceModelDbNativeAdapter(),
  webAdapter: const _PerformanceModelDbWebAdapter(),
  idName: 'id',
  propertyIds: {
    'age': 0,
    'city': 1,
    'groupId': 2,
    'isFavourite': 3,
    'part': 4,
    'performance': 5,
    'performanceDay': 6,
    'performanceId': 7,
    'problem': 8,
    'spontan': 9,
    'spontanDay': 10,
    'stage': 11,
    'team': 12
  },
  listProperties: {},
  indexIds: {'city_team': 0, 'isFavourite': 1, 'team': 2},
  indexTypes: {
    'city_team': [
      NativeIndexType.long,
      NativeIndexType.stringHash,
    ],
    'isFavourite': [
      NativeIndexType.bool,
    ],
    'team': [
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {'group': 0},
  linkedCollections: ['PerformanceGroupModelDb'],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [obj.group],
  version: 2,
);

class _PerformanceModelDbWebAdapter
    extends IsarWebTypeAdapter<PerformanceModelDb> {
  const _PerformanceModelDbWebAdapter();

  @override
  Object serialize(IsarCollection<PerformanceModelDb> collection,
      PerformanceModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'age', object.age);
    IsarNative.jsObjectSet(jsObj, 'city', object.city);
    IsarNative.jsObjectSet(jsObj, 'groupId', object.groupId);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'isFavourite', object.isFavourite);
    IsarNative.jsObjectSet(jsObj, 'part', object.part);
    IsarNative.jsObjectSet(jsObj, 'performance', object.performance);
    IsarNative.jsObjectSet(jsObj, 'performanceDay', object.performanceDay);
    IsarNative.jsObjectSet(jsObj, 'performanceId', object.performanceId);
    IsarNative.jsObjectSet(jsObj, 'problem', object.problem);
    IsarNative.jsObjectSet(jsObj, 'spontan', object.spontan);
    IsarNative.jsObjectSet(jsObj, 'spontanDay', object.spontanDay);
    IsarNative.jsObjectSet(jsObj, 'stage', object.stage);
    IsarNative.jsObjectSet(jsObj, 'team', object.team);
    return jsObj;
  }

  @override
  PerformanceModelDb deserialize(
      IsarCollection<PerformanceModelDb> collection, dynamic jsObj) {
    final object = PerformanceModelDb();
    object.age =
        IsarNative.jsObjectGet(jsObj, 'age') ?? double.negativeInfinity;
    object.city =
        IsarNative.jsObjectGet(jsObj, 'city') ?? double.negativeInfinity;
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.isFavourite = IsarNative.jsObjectGet(jsObj, 'isFavourite') ?? false;
    object.part =
        IsarNative.jsObjectGet(jsObj, 'part') ?? double.negativeInfinity;
    object.performance = IsarNative.jsObjectGet(jsObj, 'performance') ?? '';
    object.performanceDay =
        IsarNative.jsObjectGet(jsObj, 'performanceDay') ?? '';
    object.performanceId = IsarNative.jsObjectGet(jsObj, 'performanceId') ??
        double.negativeInfinity;
    object.problem =
        IsarNative.jsObjectGet(jsObj, 'problem') ?? double.negativeInfinity;
    object.spontan = IsarNative.jsObjectGet(jsObj, 'spontan') ?? '';
    object.spontanDay = IsarNative.jsObjectGet(jsObj, 'spontanDay') ?? '';
    object.stage =
        IsarNative.jsObjectGet(jsObj, 'stage') ?? double.negativeInfinity;
    object.team = IsarNative.jsObjectGet(jsObj, 'team') ?? '';
    attachLinks(collection.isar, IsarNative.jsObjectGet(jsObj, 'id'), object);
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'age':
        return (IsarNative.jsObjectGet(jsObj, 'age') ?? double.negativeInfinity)
            as P;
      case 'city':
        return (IsarNative.jsObjectGet(jsObj, 'city') ??
            double.negativeInfinity) as P;
      case 'groupId':
        return (IsarNative.jsObjectGet(jsObj, 'groupId') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'isFavourite':
        return (IsarNative.jsObjectGet(jsObj, 'isFavourite') ?? false) as P;
      case 'part':
        return (IsarNative.jsObjectGet(jsObj, 'part') ??
            double.negativeInfinity) as P;
      case 'performance':
        return (IsarNative.jsObjectGet(jsObj, 'performance') ?? '') as P;
      case 'performanceDay':
        return (IsarNative.jsObjectGet(jsObj, 'performanceDay') ?? '') as P;
      case 'performanceId':
        return (IsarNative.jsObjectGet(jsObj, 'performanceId') ??
            double.negativeInfinity) as P;
      case 'problem':
        return (IsarNative.jsObjectGet(jsObj, 'problem') ??
            double.negativeInfinity) as P;
      case 'spontan':
        return (IsarNative.jsObjectGet(jsObj, 'spontan') ?? '') as P;
      case 'spontanDay':
        return (IsarNative.jsObjectGet(jsObj, 'spontanDay') ?? '') as P;
      case 'stage':
        return (IsarNative.jsObjectGet(jsObj, 'stage') ??
            double.negativeInfinity) as P;
      case 'team':
        return (IsarNative.jsObjectGet(jsObj, 'team') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, PerformanceModelDb object) {
    object.group.attach(
      id,
      isar.performanceModelDbs,
      isar.getCollection<PerformanceGroupModelDb>('PerformanceGroupModelDb'),
      'group',
      true,
    );
  }
}

class _PerformanceModelDbNativeAdapter
    extends IsarNativeTypeAdapter<PerformanceModelDb> {
  const _PerformanceModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<PerformanceModelDb> collection,
      IsarRawObject rawObj,
      PerformanceModelDb object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.age;
    final _age = value0;
    final value1 = object.city;
    final _city = value1;
    final value2 = object.groupId;
    final _groupId = value2;
    final value3 = object.isFavourite;
    final _isFavourite = value3;
    final value4 = object.part;
    final _part = value4;
    final value5 = object.performance;
    final _performance = IsarBinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += (_performance.length) as int;
    final value6 = object.performanceDay;
    final _performanceDay = IsarBinaryWriter.utf8Encoder.convert(value6);
    dynamicSize += (_performanceDay.length) as int;
    final value7 = object.performanceId;
    final _performanceId = value7;
    final value8 = object.problem;
    final _problem = value8;
    final value9 = object.spontan;
    final _spontan = IsarBinaryWriter.utf8Encoder.convert(value9);
    dynamicSize += (_spontan.length) as int;
    final value10 = object.spontanDay;
    final _spontanDay = IsarBinaryWriter.utf8Encoder.convert(value10);
    dynamicSize += (_spontanDay.length) as int;
    final value11 = object.stage;
    final _stage = value11;
    final value12 = object.team;
    final _team = IsarBinaryWriter.utf8Encoder.convert(value12);
    dynamicSize += (_team.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _age);
    writer.writeLong(offsets[1], _city);
    writer.writeLong(offsets[2], _groupId);
    writer.writeBool(offsets[3], _isFavourite);
    writer.writeLong(offsets[4], _part);
    writer.writeBytes(offsets[5], _performance);
    writer.writeBytes(offsets[6], _performanceDay);
    writer.writeLong(offsets[7], _performanceId);
    writer.writeLong(offsets[8], _problem);
    writer.writeBytes(offsets[9], _spontan);
    writer.writeBytes(offsets[10], _spontanDay);
    writer.writeLong(offsets[11], _stage);
    writer.writeBytes(offsets[12], _team);
  }

  @override
  PerformanceModelDb deserialize(IsarCollection<PerformanceModelDb> collection,
      int id, IsarBinaryReader reader, List<int> offsets) {
    final object = PerformanceModelDb();
    object.age = reader.readLong(offsets[0]);
    object.city = reader.readLong(offsets[1]);
    object.id = id;
    object.isFavourite = reader.readBool(offsets[3]);
    object.part = reader.readLong(offsets[4]);
    object.performance = reader.readString(offsets[5]);
    object.performanceDay = reader.readString(offsets[6]);
    object.performanceId = reader.readLong(offsets[7]);
    object.problem = reader.readLong(offsets[8]);
    object.spontan = reader.readString(offsets[9]);
    object.spontanDay = reader.readString(offsets[10]);
    object.stage = reader.readLong(offsets[11]);
    object.team = reader.readString(offsets[12]);
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
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readLong(offset)) as P;
      case 3:
        return (reader.readBool(offset)) as P;
      case 4:
        return (reader.readLong(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readString(offset)) as P;
      case 7:
        return (reader.readLong(offset)) as P;
      case 8:
        return (reader.readLong(offset)) as P;
      case 9:
        return (reader.readString(offset)) as P;
      case 10:
        return (reader.readString(offset)) as P;
      case 11:
        return (reader.readLong(offset)) as P;
      case 12:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, PerformanceModelDb object) {
    object.group.attach(
      id,
      isar.performanceModelDbs,
      isar.getCollection<PerformanceGroupModelDb>('PerformanceGroupModelDb'),
      'group',
      true,
    );
  }
}

extension PerformanceModelDbQueryWhereSort
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QWhere> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere>
      anyCityTeam() {
    return addWhereClauseInternal(const WhereClause(indexName: 'city_team'));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere>
      anyIsFavourite() {
    return addWhereClauseInternal(const WhereClause(indexName: 'isFavourite'));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere> anyTeam() {
    return addWhereClauseInternal(const WhereClause(indexName: 'team'));
  }
}

extension PerformanceModelDbQueryWhere
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QWhereClause> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idNotEqualTo(int? id) {
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityEqualTo(int city) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_team',
      lower: [city],
      includeLower: true,
      upper: [city],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityNotEqualTo(int city) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        upper: [city],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        lower: [city],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        lower: [city],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        upper: [city],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityGreaterThan(
    int city, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_team',
      lower: [city],
      includeLower: include,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityLessThan(
    int city, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_team',
      upper: [city],
      includeUpper: include,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityBetween(
    int lowerCity,
    int upperCity, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_team',
      lower: [lowerCity],
      includeLower: includeLower,
      upper: [upperCity],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityTeamEqualTo(int city, String team) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_team',
      lower: [city, team],
      includeLower: true,
      upper: [city, team],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityTeamNotEqualTo(int city, String team) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        upper: [city, team],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        lower: [city, team],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        lower: [city, team],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_team',
        upper: [city, team],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      isFavouriteEqualTo(bool isFavourite) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'isFavourite',
      lower: [isFavourite],
      includeLower: true,
      upper: [isFavourite],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      isFavouriteNotEqualTo(bool isFavourite) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'isFavourite',
        upper: [isFavourite],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'isFavourite',
        lower: [isFavourite],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'isFavourite',
        lower: [isFavourite],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'isFavourite',
        upper: [isFavourite],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      teamEqualTo(String team) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'team',
      lower: [team],
      includeLower: true,
      upper: [team],
      includeUpper: true,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      teamNotEqualTo(String team) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'team',
        upper: [team],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'team',
        lower: [team],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'team',
        lower: [team],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'team',
        upper: [team],
        includeUpper: false,
      ));
    }
  }
}

extension PerformanceModelDbQueryFilter
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QFilterCondition> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'age',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageGreaterThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageLessThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'city',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'city',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'city',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'city',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdGreaterThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdLessThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      isFavouriteEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isFavourite',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'part',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partGreaterThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partLessThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'performance',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'performance',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'performance',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'performance',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'performance',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'performance',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'performance',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'performance',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'performanceDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'performanceDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'performanceDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'performanceDay',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'performanceDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'performanceDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'performanceDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'performanceDay',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'performanceId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'performanceId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'performanceId',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'performanceId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'problem',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemGreaterThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemLessThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'spontan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'spontan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'spontan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'spontan',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'spontan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'spontan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'spontan',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'spontan',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'spontanDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'spontanDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'spontanDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'spontanDay',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'spontanDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'spontanDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'spontanDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'spontanDay',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'stage',
      value: value,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageGreaterThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageLessThan(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'team',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'team',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'team',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'team',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'team',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'team',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'team',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'team',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension PerformanceModelDbQueryLinks
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QFilterCondition> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      group(FilterQuery<PerformanceGroupModelDb> q) {
    return linkInternal(
      isar.performanceGroupModelDbs,
      q,
      'group',
    );
  }
}

extension PerformanceModelDbQueryWhereSortBy
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QSortBy> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByCity() {
    return addSortByInternal('city', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByCityDesc() {
    return addSortByInternal('city', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByIsFavourite() {
    return addSortByInternal('isFavourite', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByIsFavouriteDesc() {
    return addSortByInternal('isFavourite', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPart() {
    return addSortByInternal('part', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPartDesc() {
    return addSortByInternal('part', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformance() {
    return addSortByInternal('performance', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceDesc() {
    return addSortByInternal('performance', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceDay() {
    return addSortByInternal('performanceDay', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceDayDesc() {
    return addSortByInternal('performanceDay', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceId() {
    return addSortByInternal('performanceId', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceIdDesc() {
    return addSortByInternal('performanceId', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByProblem() {
    return addSortByInternal('problem', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByProblemDesc() {
    return addSortByInternal('problem', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontan() {
    return addSortByInternal('spontan', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontanDesc() {
    return addSortByInternal('spontan', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontanDay() {
    return addSortByInternal('spontanDay', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontanDayDesc() {
    return addSortByInternal('spontanDay', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByStage() {
    return addSortByInternal('stage', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByStageDesc() {
    return addSortByInternal('stage', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByTeam() {
    return addSortByInternal('team', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByTeamDesc() {
    return addSortByInternal('team', Sort.desc);
  }
}

extension PerformanceModelDbQueryWhereSortThenBy
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QSortThenBy> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByAge() {
    return addSortByInternal('age', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByAgeDesc() {
    return addSortByInternal('age', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByCity() {
    return addSortByInternal('city', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByCityDesc() {
    return addSortByInternal('city', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByGroupId() {
    return addSortByInternal('groupId', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByGroupIdDesc() {
    return addSortByInternal('groupId', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByIsFavourite() {
    return addSortByInternal('isFavourite', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByIsFavouriteDesc() {
    return addSortByInternal('isFavourite', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPart() {
    return addSortByInternal('part', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPartDesc() {
    return addSortByInternal('part', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformance() {
    return addSortByInternal('performance', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceDesc() {
    return addSortByInternal('performance', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceDay() {
    return addSortByInternal('performanceDay', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceDayDesc() {
    return addSortByInternal('performanceDay', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceId() {
    return addSortByInternal('performanceId', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceIdDesc() {
    return addSortByInternal('performanceId', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByProblem() {
    return addSortByInternal('problem', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByProblemDesc() {
    return addSortByInternal('problem', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontan() {
    return addSortByInternal('spontan', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontanDesc() {
    return addSortByInternal('spontan', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontanDay() {
    return addSortByInternal('spontanDay', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontanDayDesc() {
    return addSortByInternal('spontanDay', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByStage() {
    return addSortByInternal('stage', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByStageDesc() {
    return addSortByInternal('stage', Sort.desc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByTeam() {
    return addSortByInternal('team', Sort.asc);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByTeamDesc() {
    return addSortByInternal('team', Sort.desc);
  }
}

extension PerformanceModelDbQueryWhereDistinct
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByAge() {
    return addDistinctByInternal('age');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByCity() {
    return addDistinctByInternal('city');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByGroupId() {
    return addDistinctByInternal('groupId');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByIsFavourite() {
    return addDistinctByInternal('isFavourite');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPart() {
    return addDistinctByInternal('part');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPerformance({bool caseSensitive = true}) {
    return addDistinctByInternal('performance', caseSensitive: caseSensitive);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPerformanceDay({bool caseSensitive = true}) {
    return addDistinctByInternal('performanceDay',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPerformanceId() {
    return addDistinctByInternal('performanceId');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByProblem() {
    return addDistinctByInternal('problem');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctBySpontan({bool caseSensitive = true}) {
    return addDistinctByInternal('spontan', caseSensitive: caseSensitive);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctBySpontanDay({bool caseSensitive = true}) {
    return addDistinctByInternal('spontanDay', caseSensitive: caseSensitive);
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByStage() {
    return addDistinctByInternal('stage');
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByTeam({bool caseSensitive = true}) {
    return addDistinctByInternal('team', caseSensitive: caseSensitive);
  }
}

extension PerformanceModelDbQueryProperty
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QQueryProperty> {
  QueryBuilder<PerformanceModelDb, int, QQueryOperations> ageProperty() {
    return addPropertyNameInternal('age');
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> cityProperty() {
    return addPropertyNameInternal('city');
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> groupIdProperty() {
    return addPropertyNameInternal('groupId');
  }

  QueryBuilder<PerformanceModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<PerformanceModelDb, bool, QQueryOperations>
      isFavouriteProperty() {
    return addPropertyNameInternal('isFavourite');
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> partProperty() {
    return addPropertyNameInternal('part');
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      performanceProperty() {
    return addPropertyNameInternal('performance');
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      performanceDayProperty() {
    return addPropertyNameInternal('performanceDay');
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations>
      performanceIdProperty() {
    return addPropertyNameInternal('performanceId');
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> problemProperty() {
    return addPropertyNameInternal('problem');
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations> spontanProperty() {
    return addPropertyNameInternal('spontan');
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      spontanDayProperty() {
    return addPropertyNameInternal('spontanDay');
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> stageProperty() {
    return addPropertyNameInternal('stage');
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations> teamProperty() {
    return addPropertyNameInternal('team');
  }
}
