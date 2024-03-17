// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSponsorModelDbCollection on Isar {
  IsarCollection<SponsorModelDb> get sponsorModelDbs => this.collection();
}

const SponsorModelDbSchema = CollectionSchema(
  name: r'SponsorModelDb',
  id: 015012701879546,
  properties: {
    r'column': PropertySchema(
      id: 0,
      name: r'column',
      type: IsarType.long,
    ),
    r'row': PropertySchema(
      id: 1,
      name: r'row',
      type: IsarType.long,
    ),
    r'sponsorId': PropertySchema(
      id: 2,
      name: r'sponsorId',
      type: IsarType.long,
    )
  },
  estimateSize: _sponsorModelDbEstimateSize,
  serialize: _sponsorModelDbSerialize,
  deserialize: _sponsorModelDbDeserialize,
  deserializeProp: _sponsorModelDbDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _sponsorModelDbGetId,
  getLinks: _sponsorModelDbGetLinks,
  attach: _sponsorModelDbAttach,
  version: '3.0.5',
);

int _sponsorModelDbEstimateSize(
  SponsorModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _sponsorModelDbSerialize(
  SponsorModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.column);
  writer.writeLong(offsets[1], object.row);
  writer.writeLong(offsets[2], object.sponsorId);
}

SponsorModelDb _sponsorModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SponsorModelDb();
  object.column = reader.readLong(offsets[0]);
  object.id = id;
  object.row = reader.readLong(offsets[1]);
  object.sponsorId = reader.readLong(offsets[2]);
  return object;
}

P _sponsorModelDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sponsorModelDbGetId(SponsorModelDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _sponsorModelDbGetLinks(SponsorModelDb object) {
  return [];
}

void _sponsorModelDbAttach(
    IsarCollection<dynamic> col, Id id, SponsorModelDb object) {
  object.id = id;
}

extension SponsorModelDbQueryWhereSort
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QWhere> {
  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SponsorModelDbQueryWhere
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QWhereClause> {
  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterWhereClause> idBetween(
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

extension SponsorModelDbQueryFilter
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QFilterCondition> {
  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      columnEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'column',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      columnGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'column',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      columnLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'column',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      columnBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'column',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
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

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
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

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      rowEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'row',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      rowGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'row',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      rowLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'row',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      rowBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'row',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      sponsorIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sponsorId',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      sponsorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sponsorId',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      sponsorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sponsorId',
        value: value,
      ));
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterFilterCondition>
      sponsorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sponsorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SponsorModelDbQueryObject
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QFilterCondition> {}

extension SponsorModelDbQueryLinks
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QFilterCondition> {}

extension SponsorModelDbQuerySortBy
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QSortBy> {
  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> sortByColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'column', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy>
      sortByColumnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'column', Sort.desc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> sortByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> sortByRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.desc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> sortBySponsorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sponsorId', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy>
      sortBySponsorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sponsorId', Sort.desc);
    });
  }
}

extension SponsorModelDbQuerySortThenBy
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QSortThenBy> {
  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> thenByColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'column', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy>
      thenByColumnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'column', Sort.desc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> thenByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> thenByRowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'row', Sort.desc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy> thenBySponsorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sponsorId', Sort.asc);
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QAfterSortBy>
      thenBySponsorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sponsorId', Sort.desc);
    });
  }
}

extension SponsorModelDbQueryWhereDistinct
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QDistinct> {
  QueryBuilder<SponsorModelDb, SponsorModelDb, QDistinct> distinctByColumn() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'column');
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QDistinct> distinctByRow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'row');
    });
  }

  QueryBuilder<SponsorModelDb, SponsorModelDb, QDistinct>
      distinctBySponsorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sponsorId');
    });
  }
}

extension SponsorModelDbQueryProperty
    on QueryBuilder<SponsorModelDb, SponsorModelDb, QQueryProperty> {
  QueryBuilder<SponsorModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SponsorModelDb, int, QQueryOperations> columnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'column');
    });
  }

  QueryBuilder<SponsorModelDb, int, QQueryOperations> rowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'row');
    });
  }

  QueryBuilder<SponsorModelDb, int, QQueryOperations> sponsorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sponsorId');
    });
  }
}
