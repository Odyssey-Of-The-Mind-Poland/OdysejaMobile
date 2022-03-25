// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetInfoModelDbCollection on Isar {
  IsarCollection<InfoModelDb> get infoModelDbs {
    return getCollection('InfoModelDb');
  }
}

final InfoModelDbSchema = CollectionSchema(
  name: 'InfoModelDb',
  schema:
      '{"name":"InfoModelDb","idName":"id","properties":[{"name":"city","type":"Long"},{"name":"infoName","type":"String"},{"name":"infoText","type":"String"},{"name":"number","type":"Long"}],"indexes":[{"name":"city_number","unique":false,"properties":[{"name":"city","type":"Value","caseSensitive":false},{"name":"number","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _InfoModelDbNativeAdapter(),
  webAdapter: const _InfoModelDbWebAdapter(),
  idName: 'id',
  propertyIds: {'city': 0, 'infoName': 1, 'infoText': 2, 'number': 3},
  listProperties: {},
  indexIds: {'city_number': 0},
  indexTypes: {
    'city_number': [
      NativeIndexType.long,
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

class _InfoModelDbWebAdapter extends IsarWebTypeAdapter<InfoModelDb> {
  const _InfoModelDbWebAdapter();

  @override
  Object serialize(IsarCollection<InfoModelDb> collection, InfoModelDb object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'city', object.city);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'infoName', object.infoName);
    IsarNative.jsObjectSet(jsObj, 'infoText', object.infoText);
    IsarNative.jsObjectSet(jsObj, 'number', object.number);
    return jsObj;
  }

  @override
  InfoModelDb deserialize(
      IsarCollection<InfoModelDb> collection, dynamic jsObj) {
    final object = InfoModelDb();
    object.city =
        IsarNative.jsObjectGet(jsObj, 'city') ?? double.negativeInfinity;
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.infoName = IsarNative.jsObjectGet(jsObj, 'infoName') ?? '';
    object.infoText = IsarNative.jsObjectGet(jsObj, 'infoText') ?? '';
    object.number =
        IsarNative.jsObjectGet(jsObj, 'number') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'city':
        return (IsarNative.jsObjectGet(jsObj, 'city') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'infoName':
        return (IsarNative.jsObjectGet(jsObj, 'infoName') ?? '') as P;
      case 'infoText':
        return (IsarNative.jsObjectGet(jsObj, 'infoText') ?? '') as P;
      case 'number':
        return (IsarNative.jsObjectGet(jsObj, 'number') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, InfoModelDb object) {}
}

class _InfoModelDbNativeAdapter extends IsarNativeTypeAdapter<InfoModelDb> {
  const _InfoModelDbNativeAdapter();

  @override
  void serialize(
      IsarCollection<InfoModelDb> collection,
      IsarRawObject rawObj,
      InfoModelDb object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.city;
    final _city = value0;
    final value1 = object.infoName;
    final _infoName = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_infoName.length) as int;
    final value2 = object.infoText;
    final _infoText = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_infoText.length) as int;
    final value3 = object.number;
    final _number = value3;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _city);
    writer.writeBytes(offsets[1], _infoName);
    writer.writeBytes(offsets[2], _infoText);
    writer.writeLong(offsets[3], _number);
  }

  @override
  InfoModelDb deserialize(IsarCollection<InfoModelDb> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = InfoModelDb();
    object.city = reader.readLong(offsets[0]);
    object.id = id;
    object.infoName = reader.readString(offsets[1]);
    object.infoText = reader.readString(offsets[2]);
    object.number = reader.readLong(offsets[3]);
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
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, InfoModelDb object) {}
}

extension InfoModelDbQueryWhereSort
    on QueryBuilder<InfoModelDb, InfoModelDb, QWhere> {
  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhere> anyCityNumber() {
    return addWhereClauseInternal(const WhereClause(indexName: 'city_number'));
  }
}

extension InfoModelDbQueryWhere
    on QueryBuilder<InfoModelDb, InfoModelDb, QWhereClause> {
  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> idBetween(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> cityEqualTo(
      int city) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      lower: [city],
      includeLower: true,
      upper: [city],
      includeUpper: true,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> cityNotEqualTo(
      int city) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        upper: [city],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        lower: [city],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        lower: [city],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        upper: [city],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> cityGreaterThan(
    int city, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      lower: [city],
      includeLower: include,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> cityLessThan(
    int city, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      upper: [city],
      includeUpper: include,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> cityBetween(
    int lowerCity,
    int upperCity, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      lower: [lowerCity],
      includeLower: includeLower,
      upper: [upperCity],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause> cityNumberEqualTo(
      int city, int number) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      lower: [city, number],
      includeLower: true,
      upper: [city, number],
      includeUpper: true,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause>
      cityNumberNotEqualTo(int city, int number) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        upper: [city, number],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        lower: [city, number],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        lower: [city, number],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'city_number',
        upper: [city, number],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause>
      cityEqualToNumberGreaterThan(
    int city,
    int number, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      lower: [city, number],
      includeLower: include,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause>
      cityEqualToNumberLessThan(
    int city,
    int number, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      upper: [city, number],
      includeUpper: include,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterWhereClause>
      cityEqualToNumberBetween(
    int city,
    int lowerNumber,
    int upperNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'city_number',
      lower: [city, lowerNumber],
      includeLower: includeLower,
      upper: [city, upperNumber],
      includeUpper: includeUpper,
    ));
  }
}

extension InfoModelDbQueryFilter
    on QueryBuilder<InfoModelDb, InfoModelDb, QFilterCondition> {
  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'city',
      value: value,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityGreaterThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityLessThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityBetween(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'infoName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'infoName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'infoName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoNameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'infoName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'infoName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'infoName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'infoName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'infoName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'infoText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'infoText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'infoText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoTextBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'infoText',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'infoText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'infoText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'infoText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'infoText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> numberEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'number',
      value: value,
    ));
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> numberLessThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> numberBetween(
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

extension InfoModelDbQueryLinks
    on QueryBuilder<InfoModelDb, InfoModelDb, QFilterCondition> {}

extension InfoModelDbQueryWhereSortBy
    on QueryBuilder<InfoModelDb, InfoModelDb, QSortBy> {
  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByCity() {
    return addSortByInternal('city', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByCityDesc() {
    return addSortByInternal('city', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByInfoName() {
    return addSortByInternal('infoName', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByInfoNameDesc() {
    return addSortByInternal('infoName', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByInfoText() {
    return addSortByInternal('infoText', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByInfoTextDesc() {
    return addSortByInternal('infoText', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> sortByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }
}

extension InfoModelDbQueryWhereSortThenBy
    on QueryBuilder<InfoModelDb, InfoModelDb, QSortThenBy> {
  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByCity() {
    return addSortByInternal('city', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByCityDesc() {
    return addSortByInternal('city', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByInfoName() {
    return addSortByInternal('infoName', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByInfoNameDesc() {
    return addSortByInternal('infoName', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByInfoText() {
    return addSortByInternal('infoText', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByInfoTextDesc() {
    return addSortByInternal('infoText', Sort.desc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByNumber() {
    return addSortByInternal('number', Sort.asc);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterSortBy> thenByNumberDesc() {
    return addSortByInternal('number', Sort.desc);
  }
}

extension InfoModelDbQueryWhereDistinct
    on QueryBuilder<InfoModelDb, InfoModelDb, QDistinct> {
  QueryBuilder<InfoModelDb, InfoModelDb, QDistinct> distinctByCity() {
    return addDistinctByInternal('city');
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QDistinct> distinctByInfoName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('infoName', caseSensitive: caseSensitive);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QDistinct> distinctByInfoText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('infoText', caseSensitive: caseSensitive);
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QDistinct> distinctByNumber() {
    return addDistinctByInternal('number');
  }
}

extension InfoModelDbQueryProperty
    on QueryBuilder<InfoModelDb, InfoModelDb, QQueryProperty> {
  QueryBuilder<InfoModelDb, int, QQueryOperations> cityProperty() {
    return addPropertyNameInternal('city');
  }

  QueryBuilder<InfoModelDb, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<InfoModelDb, String, QQueryOperations> infoNameProperty() {
    return addPropertyNameInternal('infoName');
  }

  QueryBuilder<InfoModelDb, String, QQueryOperations> infoTextProperty() {
    return addPropertyNameInternal('infoText');
  }

  QueryBuilder<InfoModelDb, int, QQueryOperations> numberProperty() {
    return addPropertyNameInternal('number');
  }
}
