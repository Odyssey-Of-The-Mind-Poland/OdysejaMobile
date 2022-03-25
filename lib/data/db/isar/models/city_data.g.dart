// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetCityDataModelDbCollection on Isar {
  IsarCollection<CityDataModelDb> get cityDataModelDbs {
    return getCollection('CityDataModelDb');
  }
}

final CityDataModelDbSchema = CollectionSchema(
  name: 'CityDataModelDb',
  schema:
      '{"name":"CityDataModelDb","idName":"id","properties":[{"name":"cityId","type":"Long"},{"name":"cityName","type":"String"}],"indexes":[{"name":"cityId","unique":false,"properties":[{"name":"cityId","type":"Value","caseSensitive":false}]}],"links":[{"name":"infoIsarLinks","target":"InfoGroupModelDb"},{"name":"performanceGroupIsarLinks","target":"PerformanceGroupModelDb"},{"name":"stageIsarLinks","target":"StageModelDb"}]}',
  nativeAdapter: const _CityDataModelDbNativeAdapter(),
  webAdapter: const _CityDataModelDbWebAdapter(),
  idName: 'id',
  propertyIds: {'cityId': 0, 'cityName': 1},
  listProperties: {},
  indexIds: {'cityId': 0},
  indexTypes: {
    'cityId': [
      NativeIndexType.long,
    ]
  },
  linkIds: {
    'infoIsarLinks': 0,
    'performanceGroupIsarLinks': 1,
    'stageIsarLinks': 2
  },
  backlinkIds: {},
  linkedCollections: [
    'InfoGroupModelDb',
    'PerformanceGroupModelDb',
    'StageModelDb'
  ],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) =>
      [obj.infoIsarLinks, obj.performanceGroupIsarLinks, obj.stageIsarLinks],
  version: 2,
);

class _CityDataModelDbWebAdapter extends IsarWebTypeAdapter<CityDataModelDb> {
  const _CityDataModelDbWebAdapter();

  @override
  Object serialize(
      IsarCollection<CityDataModelDb> collection, CityDataModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'cityId', object.cityId);
    IsarNative.jsObjectSet(jsObj, 'cityName', object.cityName);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    return jsObj;
  }

  @override
  CityDataModelDb deserialize(
      IsarCollection<CityDataModelDb> collection, dynamic jsObj) {
    final object = CityDataModelDb();
    object.cityId =
        IsarNative.jsObjectGet(jsObj, 'cityId') ?? double.negativeInfinity;
    object.cityName = IsarNative.jsObjectGet(jsObj, 'cityName') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    attachLinks(collection.isar, IsarNative.jsObjectGet(jsObj, 'id'), object);
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'cityId':
        return (IsarNative.jsObjectGet(jsObj, 'cityId') ??
            double.negativeInfinity) as P;
      case 'cityName':
        return (IsarNative.jsObjectGet(jsObj, 'cityName') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, CityDataModelDb object) {
    object.infoIsarLinks.attach(
      id,
      isar.cityDataModelDbs,
      isar.getCollection<InfoGroupModelDb>('InfoGroupModelDb'),
      'infoIsarLinks',
      false,
    );
    object.performanceGroupIsarLinks.attach(
      id,
      isar.cityDataModelDbs,
      isar.getCollection<PerformanceGroupModelDb>('PerformanceGroupModelDb'),
      'performanceGroupIsarLinks',
      false,
    );
    object.stageIsarLinks.attach(
      id,
      isar.cityDataModelDbs,
      isar.getCollection<StageModelDb>('StageModelDb'),
      'stageIsarLinks',
      false,
    );
  }
}

class _CityDataModelDbNativeAdapter
    extends IsarNativeTypeAdapter<CityDataModelDb> {
  const _CityDataModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<CityDataModelDb> collection,
      IsarRawObject rawObj,
      CityDataModelDb object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.cityId;
    final _cityId = value0;
    final value1 = object.cityName;
    final _cityName = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_cityName.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _cityId);
    writer.writeBytes(offsets[1], _cityName);
  }

  @override
  CityDataModelDb deserialize(IsarCollection<CityDataModelDb> collection,
      int id, IsarBinaryReader reader, List<int> offsets) {
    final object = CityDataModelDb();
    object.cityId = reader.readLong(offsets[0]);
    object.cityName = reader.readString(offsets[1]);
    object.id = id;
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
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, CityDataModelDb object) {
    object.infoIsarLinks.attach(
      id,
      isar.cityDataModelDbs,
      isar.getCollection<InfoGroupModelDb>('InfoGroupModelDb'),
      'infoIsarLinks',
      false,
    );
    object.performanceGroupIsarLinks.attach(
      id,
      isar.cityDataModelDbs,
      isar.getCollection<PerformanceGroupModelDb>('PerformanceGroupModelDb'),
      'performanceGroupIsarLinks',
      false,
    );
    object.stageIsarLinks.attach(
      id,
      isar.cityDataModelDbs,
      isar.getCollection<StageModelDb>('StageModelDb'),
      'stageIsarLinks',
      false,
    );
  }
}

extension CityDataModelDbQueryWhereSort
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QWhere> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhere> anyCityId() {
    return addWhereClauseInternal(const WhereClause(indexName: 'cityId'));
  }
}

extension CityDataModelDbQueryWhere
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QWhereClause> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause> idEqualTo(
      int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause> idBetween(
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdEqualTo(int cityId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'cityId',
      lower: [cityId],
      includeLower: true,
      upper: [cityId],
      includeUpper: true,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdNotEqualTo(int cityId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'cityId',
        upper: [cityId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'cityId',
        lower: [cityId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'cityId',
        lower: [cityId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'cityId',
        upper: [cityId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdGreaterThan(
    int cityId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'cityId',
      lower: [cityId],
      includeLower: include,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdLessThan(
    int cityId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'cityId',
      upper: [cityId],
      includeUpper: include,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdBetween(
    int lowerCityId,
    int upperCityId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'cityId',
      lower: [lowerCityId],
      includeLower: includeLower,
      upper: [upperCityId],
      includeUpper: includeUpper,
    ));
  }
}

extension CityDataModelDbQueryFilter
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QFilterCondition> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cityId',
      value: value,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cityId',
      value: value,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cityId',
      value: value,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cityId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'cityName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'cityName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'cityName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'cityName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'cityName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'cityName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'cityName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'cityName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
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
}

extension CityDataModelDbQueryLinks
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QFilterCondition> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinks(FilterQuery<InfoGroupModelDb> q) {
    return linkInternal(
      isar.infoGroupModelDbs,
      q,
      'infoIsarLinks',
    );
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinks(FilterQuery<PerformanceGroupModelDb> q) {
    return linkInternal(
      isar.performanceGroupModelDbs,
      q,
      'performanceGroupIsarLinks',
    );
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinks(FilterQuery<StageModelDb> q) {
    return linkInternal(
      isar.stageModelDbs,
      q,
      'stageIsarLinks',
    );
  }
}

extension CityDataModelDbQueryWhereSortBy
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QSortBy> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> sortByCityId() {
    return addSortByInternal('cityId', Sort.asc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      sortByCityIdDesc() {
    return addSortByInternal('cityId', Sort.desc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      sortByCityName() {
    return addSortByInternal('cityName', Sort.asc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      sortByCityNameDesc() {
    return addSortByInternal('cityName', Sort.desc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension CityDataModelDbQueryWhereSortThenBy
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QSortThenBy> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> thenByCityId() {
    return addSortByInternal('cityId', Sort.asc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      thenByCityIdDesc() {
    return addSortByInternal('cityId', Sort.desc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      thenByCityName() {
    return addSortByInternal('cityName', Sort.asc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      thenByCityNameDesc() {
    return addSortByInternal('cityName', Sort.desc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension CityDataModelDbQueryWhereDistinct
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> distinctByCityId() {
    return addDistinctByInternal('cityId');
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> distinctByCityName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('cityName', caseSensitive: caseSensitive);
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }
}

extension CityDataModelDbQueryProperty
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QQueryProperty> {
  QueryBuilder<CityDataModelDb, int, QQueryOperations> cityIdProperty() {
    return addPropertyNameInternal('cityId');
  }

  QueryBuilder<CityDataModelDb, String, QQueryOperations> cityNameProperty() {
    return addPropertyNameInternal('cityName');
  }

  QueryBuilder<CityDataModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }
}
