// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetStageModelDbCollection on Isar {
  IsarCollection<StageModelDb> get stageModelDbs {
    return getCollection('StageModelDb');
  }
}

final StageModelDbSchema = CollectionSchema(
  name: 'StageModelDb',
  schema:
      '{"name":"StageModelDb","idName":"id","properties":[{"name":"name","type":"String"},{"name":"number","type":"Long"},{"name":"symbol","type":"String"},{"name":"title","type":"String"}],"indexes":[{"name":"number","unique":false,"properties":[{"name":"number","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _StageModelDbNativeAdapter(),
  webAdapter: const _StageModelDbWebAdapter(),
  idName: 'id',
  propertyIds: {'name': 0, 'number': 1, 'symbol': 2, 'title': 3},
  listProperties: {},
  indexIds: {'number': 0},
  indexTypes: {
    'number': [
      NativeIndexType.long,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _StageModelDbWebAdapter extends IsarWebTypeAdapter<StageModelDb> {
  const _StageModelDbWebAdapter();

  @override
  Object serialize(
      IsarCollection<StageModelDb> collection, StageModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'number', object.number);
    IsarNative.jsObjectSet(jsObj, 'symbol', object.symbol);
    IsarNative.jsObjectSet(jsObj, 'title', object.title);
    return jsObj;
  }

  @override
  StageModelDb deserialize(
      IsarCollection<StageModelDb> collection, dynamic jsObj) {
    final object = StageModelDb();
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
    object.number =
        IsarNative.jsObjectGet(jsObj, 'number') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      case 'number':
        return (IsarNative.jsObjectGet(jsObj, 'number') ??
            double.negativeInfinity) as P;
      case 'symbol':
        return (IsarNative.jsObjectGet(jsObj, 'symbol') ?? '') as P;
      case 'title':
        return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, StageModelDb object) {}
}

class _StageModelDbNativeAdapter extends IsarNativeTypeAdapter<StageModelDb> {
  const _StageModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<StageModelDb> collection,
      IsarRawObject rawObj,
      StageModelDb object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_name.length) as int;
    final value1 = object.number;
    final _number = value1;
    final value2 = object.symbol;
    final _symbol = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_symbol.length) as int;
    final value3 = object.title;
    final _title = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_title.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _name);
    writer.writeLong(offsets[1], _number);
    writer.writeBytes(offsets[2], _symbol);
    writer.writeBytes(offsets[3], _title);
  }

  @override
  StageModelDb deserialize(IsarCollection<StageModelDb> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = StageModelDb();
    object.id = id;
    object.name = reader.readString(offsets[0]);
    object.number = reader.readLong(offsets[1]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, StageModelDb object) {}
}

extension StageModelDbQueryWhereSort
    on QueryBuilder<StageModelDb, StageModelDb, QWhere> {
  QueryBuilder<StageModelDb, StageModelDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhere> anyNumber() {
    return addWhereClauseInternal(const WhereClause(indexName: 'number'));
  }
}

extension StageModelDbQueryWhere
    on QueryBuilder<StageModelDb, StageModelDb, QWhereClause> {
  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> idEqualTo(
      int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> idNotEqualTo(
      int? id) {
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

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> idBetween(
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

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> numberEqualTo(
      int number) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      lower: [number],
      includeLower: true,
      upper: [number],
      includeUpper: true,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> numberNotEqualTo(
      int number) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'number',
        upper: [number],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'number',
        lower: [number],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'number',
        lower: [number],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'number',
        upper: [number],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> numberGreaterThan(
    int number, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      lower: [number],
      includeLower: include,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> numberLessThan(
    int number, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      upper: [number],
      includeUpper: include,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterWhereClause> numberBetween(
    int lowerNumber,
    int upperNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      lower: [lowerNumber],
      includeLower: includeLower,
      upper: [upperNumber],
      includeUpper: includeUpper,
    ));
  }
}

extension StageModelDbQueryFilter
    on QueryBuilder<StageModelDb, StageModelDb, QFilterCondition> {
  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> numberEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'number',
      value: value,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      numberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'number',
      value: value,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      numberLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'number',
      value: value,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> numberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'number',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> symbolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      symbolGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      symbolLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> symbolBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'symbol',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> symbolMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'symbol',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> titleLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension StageModelDbQueryLinks
    on QueryBuilder<StageModelDb, StageModelDb, QFilterCondition> {}

extension StageModelDbQueryWhereSortBy
    on QueryBuilder<StageModelDb, StageModelDb, QSortBy> {
  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension StageModelDbQueryWhereSortThenBy
    on QueryBuilder<StageModelDb, StageModelDb, QSortThenBy> {
  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<StageModelDb, StageModelDb, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension StageModelDbQueryWhereDistinct
    on QueryBuilder<StageModelDb, StageModelDb, QDistinct> {
  QueryBuilder<StageModelDb, StageModelDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<StageModelDb, StageModelDb, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<StageModelDb, StageModelDb, QDistinct> distinctByNumber() {
    return addDistinctByInternal('number');
  }

  QueryBuilder<StageModelDb, StageModelDb, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('symbol', caseSensitive: caseSensitive);
  }

  QueryBuilder<StageModelDb, StageModelDb, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension StageModelDbQueryProperty
    on QueryBuilder<StageModelDb, StageModelDb, QQueryProperty> {
  QueryBuilder<StageModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<StageModelDb, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<StageModelDb, int, QQueryOperations> numberProperty() {
    return addPropertyNameInternal('number');
  }

  QueryBuilder<StageModelDb, String, QQueryOperations> symbolProperty() {
    return addPropertyNameInternal('symbol');
  }

  QueryBuilder<StageModelDb, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
