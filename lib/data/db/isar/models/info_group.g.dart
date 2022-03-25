// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_group.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetInfoGroupModelDbCollection on Isar {
  IsarCollection<InfoGroupModelDb> get infoGroupModelDbs {
    return getCollection('InfoGroupModelDb');
  }
}

final InfoGroupModelDbSchema = CollectionSchema(
  name: 'InfoGroupModelDb',
  schema:
      '{"name":"InfoGroupModelDb","idName":"id","properties":[{"name":"name","type":"String"},{"name":"number","type":"Long"}],"indexes":[],"links":[{"name":"infoList","target":"InfoModelDb"}]}',
  nativeAdapter: const _InfoGroupModelDbNativeAdapter(),
  webAdapter: const _InfoGroupModelDbWebAdapter(),
  idName: 'id',
  propertyIds: {'name': 0, 'number': 1},
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {'infoList': 0},
  backlinkIds: {},
  linkedCollections: ['InfoModelDb'],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [obj.infoList],
  version: 2,
);

class _InfoGroupModelDbWebAdapter extends IsarWebTypeAdapter<InfoGroupModelDb> {
  const _InfoGroupModelDbWebAdapter();

  @override
  Object serialize(
      IsarCollection<InfoGroupModelDb> collection, InfoGroupModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'number', object.number);
    return jsObj;
  }

  @override
  InfoGroupModelDb deserialize(
      IsarCollection<InfoGroupModelDb> collection, dynamic jsObj) {
    final object = InfoGroupModelDb();
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
    object.number =
        IsarNative.jsObjectGet(jsObj, 'number') ?? double.negativeInfinity;
    attachLinks(collection.isar, IsarNative.jsObjectGet(jsObj, 'id'), object);
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
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, InfoGroupModelDb object) {
    object.infoList.attach(
      id,
      isar.infoGroupModelDbs,
      isar.getCollection<InfoModelDb>('InfoModelDb'),
      'infoList',
      false,
    );
  }
}

class _InfoGroupModelDbNativeAdapter
    extends IsarNativeTypeAdapter<InfoGroupModelDb> {
  const _InfoGroupModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<InfoGroupModelDb> collection,
      IsarRawObject rawObj,
      InfoGroupModelDb object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_name.length) as int;
    final value1 = object.number;
    final _number = value1;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _name);
    writer.writeLong(offsets[1], _number);
  }

  @override
  InfoGroupModelDb deserialize(IsarCollection<InfoGroupModelDb> collection,
      int id, IsarBinaryReader reader, List<int> offsets) {
    final object = InfoGroupModelDb();
    object.id = id;
    object.name = reader.readString(offsets[0]);
    object.number = reader.readLong(offsets[1]);
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
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, InfoGroupModelDb object) {
    object.infoList.attach(
      id,
      isar.infoGroupModelDbs,
      isar.getCollection<InfoModelDb>('InfoModelDb'),
      'infoList',
      false,
    );
  }
}

extension InfoGroupModelDbQueryWhereSort
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QWhere> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension InfoGroupModelDbQueryWhere
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QWhereClause> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause> idEqualTo(
      int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause> idBetween(
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
}

extension InfoGroupModelDbQueryFilter
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QFilterCondition> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      numberEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'number',
      value: value,
    ));
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
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
}

extension InfoGroupModelDbQueryLinks
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QFilterCondition> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoList(FilterQuery<InfoModelDb> q) {
    return linkInternal(
      isar.infoModelDbs,
      q,
      'infoList',
    );
  }
}

extension InfoGroupModelDbQueryWhereSortBy
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QSortBy> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }
}

extension InfoGroupModelDbQueryWhereSortThenBy
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QSortThenBy> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }
}

extension InfoGroupModelDbQueryWhereDistinct
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct>
      distinctByNumber() {
    return addDistinctByInternal('number');
  }
}

extension InfoGroupModelDbQueryProperty
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QQueryProperty> {
  QueryBuilder<InfoGroupModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<InfoGroupModelDb, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<InfoGroupModelDb, int, QQueryOperations> numberProperty() {
    return addPropertyNameInternal('number');
  }
}
