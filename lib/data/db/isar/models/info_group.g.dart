// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_group.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetInfoGroupModelDbCollection on Isar {
  IsarCollection<InfoGroupModelDb> get infoGroupModelDbs => this.collection();
}

const InfoGroupModelDbSchema = CollectionSchema(
  name: r'InfoGroupModelDb',
  id: 2560460958706835118,
  properties: {
    r'infoList': PropertySchema(
      id: 0,
      name: r'infoList',
      type: IsarType.objectList,
      target: r'InfoModelDb',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 2,
      name: r'number',
      type: IsarType.long,
    )
  },
  estimateSize: _infoGroupModelDbEstimateSize,
  serialize: _infoGroupModelDbSerialize,
  deserialize: _infoGroupModelDbDeserialize,
  deserializeProp: _infoGroupModelDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'InfoModelDb': InfoModelDbSchema},
  getId: _infoGroupModelDbGetId,
  getLinks: _infoGroupModelDbGetLinks,
  attach: _infoGroupModelDbAttach,
  version: '3.0.5',
);

int _infoGroupModelDbEstimateSize(
  InfoGroupModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.infoList.length * 3;
  {
    final offsets = allOffsets[InfoModelDb]!;
    for (var i = 0; i < object.infoList.length; i++) {
      final value = object.infoList[i];
      bytesCount += InfoModelDbSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _infoGroupModelDbSerialize(
  InfoGroupModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<InfoModelDb>(
    offsets[0],
    allOffsets,
    InfoModelDbSchema.serialize,
    object.infoList,
  );
  writer.writeString(offsets[1], object.name);
  writer.writeLong(offsets[2], object.number);
}

InfoGroupModelDb _infoGroupModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InfoGroupModelDb();
  object.id = id;
  object.infoList = reader.readObjectList<InfoModelDb>(
        offsets[0],
        InfoModelDbSchema.deserialize,
        allOffsets,
        InfoModelDb(),
      ) ??
      [];
  object.name = reader.readString(offsets[1]);
  object.number = reader.readLong(offsets[2]);
  return object;
}

P _infoGroupModelDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<InfoModelDb>(
            offset,
            InfoModelDbSchema.deserialize,
            allOffsets,
            InfoModelDb(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _infoGroupModelDbGetId(InfoGroupModelDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _infoGroupModelDbGetLinks(InfoGroupModelDb object) {
  return [];
}

void _infoGroupModelDbAttach(
    IsarCollection<dynamic> col, Id id, InfoGroupModelDb object) {
  object.id = id;
}

extension InfoGroupModelDbQueryWhereSort
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QWhere> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InfoGroupModelDbQueryWhere
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QWhereClause> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InfoGroupModelDbQueryFilter
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QFilterCondition> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'infoList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'infoList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'infoList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'infoList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'infoList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'infoList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      numberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      numberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      numberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      numberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'number',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InfoGroupModelDbQueryObject
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QFilterCondition> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterFilterCondition>
      infoListElement(FilterQuery<InfoModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'infoList');
    });
  }
}

extension InfoGroupModelDbQueryLinks
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QFilterCondition> {}

extension InfoGroupModelDbQuerySortBy
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QSortBy> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      sortByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }
}

extension InfoGroupModelDbQuerySortThenBy
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QSortThenBy> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.asc);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QAfterSortBy>
      thenByNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'number', Sort.desc);
    });
  }
}

extension InfoGroupModelDbQueryWhereDistinct
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct> {
  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QDistinct>
      distinctByNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'number');
    });
  }
}

extension InfoGroupModelDbQueryProperty
    on QueryBuilder<InfoGroupModelDb, InfoGroupModelDb, QQueryProperty> {
  QueryBuilder<InfoGroupModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InfoGroupModelDb, List<InfoModelDb>, QQueryOperations>
      infoListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'infoList');
    });
  }

  QueryBuilder<InfoGroupModelDb, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<InfoGroupModelDb, int, QQueryOperations> numberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'number');
    });
  }
}
