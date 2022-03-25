// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetProblemModelDbCollection on Isar {
  IsarCollection<ProblemModelDb> get problemModelDbs {
    return getCollection('ProblemModelDb');
  }
}

final ProblemModelDbSchema = CollectionSchema(
  name: 'ProblemModelDb',
  schema:
      '{"name":"ProblemModelDb","idName":"id","properties":[{"name":"name","type":"String"},{"name":"number","type":"Long"},{"name":"symbol","type":"String"},{"name":"title","type":"String"}],"indexes":[{"name":"number","unique":false,"properties":[{"name":"number","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _ProblemModelDbNativeAdapter(),
  webAdapter: const _ProblemModelDbWebAdapter(),
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

class _ProblemModelDbWebAdapter extends IsarWebTypeAdapter<ProblemModelDb> {
  const _ProblemModelDbWebAdapter();

  @override
  Object serialize(
      IsarCollection<ProblemModelDb> collection, ProblemModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'number', object.number);
    IsarNative.jsObjectSet(jsObj, 'symbol', object.symbol);
    IsarNative.jsObjectSet(jsObj, 'title', object.title);
    return jsObj;
  }

  @override
  ProblemModelDb deserialize(
      IsarCollection<ProblemModelDb> collection, dynamic jsObj) {
    final object = ProblemModelDb();
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
  void attachLinks(Isar isar, int id, ProblemModelDb object) {}
}

class _ProblemModelDbNativeAdapter
    extends IsarNativeTypeAdapter<ProblemModelDb> {
  const _ProblemModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<ProblemModelDb> collection,
      IsarRawObject rawObj,
      ProblemModelDb object,
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
  ProblemModelDb deserialize(IsarCollection<ProblemModelDb> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = ProblemModelDb();
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
  void attachLinks(Isar isar, int id, ProblemModelDb object) {}
}

extension ProblemModelDbQueryWhereSort
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QWhere> {
  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhere> anyNumber() {
    return addWhereClauseInternal(const WhereClause(indexName: 'number'));
  }
}

extension ProblemModelDbQueryWhere
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QWhereClause> {
  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> idEqualTo(
      int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> idBetween(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> numberEqualTo(
      int number) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      lower: [number],
      includeLower: true,
      upper: [number],
      includeUpper: true,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause>
      numberNotEqualTo(int number) {
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause>
      numberGreaterThan(
    int number, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      lower: [number],
      includeLower: include,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause>
      numberLessThan(
    int number, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'number',
      upper: [number],
      includeUpper: include,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterWhereClause> numberBetween(
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

extension ProblemModelDbQueryFilter
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QFilterCondition> {
  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      numberEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'number',
      value: value,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      numberBetween(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      symbolEqualTo(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      symbolBetween(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'symbol',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'symbol',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      titleEqualTo(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      titleLessThan(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      titleBetween(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ProblemModelDbQueryLinks
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QFilterCondition> {}

extension ProblemModelDbQueryWhereSortBy
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QSortBy> {
  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy>
      sortByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy>
      sortBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension ProblemModelDbQueryWhereSortThenBy
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QSortThenBy> {
  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy>
      thenByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenBySymbol() {
    return addSortByInternal('symbol', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy>
      thenBySymbolDesc() {
    return addSortByInternal('symbol', Sort.desc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }
}

extension ProblemModelDbQueryWhereDistinct
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QDistinct> {
  QueryBuilder<ProblemModelDb, ProblemModelDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QDistinct> distinctByNumber() {
    return addDistinctByInternal('number');
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('symbol', caseSensitive: caseSensitive);
  }

  QueryBuilder<ProblemModelDb, ProblemModelDb, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }
}

extension ProblemModelDbQueryProperty
    on QueryBuilder<ProblemModelDb, ProblemModelDb, QQueryProperty> {
  QueryBuilder<ProblemModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ProblemModelDb, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<ProblemModelDb, int, QQueryOperations> numberProperty() {
    return addPropertyNameInternal('number');
  }

  QueryBuilder<ProblemModelDb, String, QQueryOperations> symbolProperty() {
    return addPropertyNameInternal('symbol');
  }

  QueryBuilder<ProblemModelDb, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }
}
