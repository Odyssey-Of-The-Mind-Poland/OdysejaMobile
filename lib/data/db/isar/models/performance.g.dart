// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPerformanceModelDbCollection on Isar {
  IsarCollection<PerformanceModelDb> get performanceModelDbs =>
      this.collection();
}

const PerformanceModelDbSchema = CollectionSchema(
  name: r'PerformanceModelDb',
  id: -8863298924368622558,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'city': PropertySchema(
      id: 1,
      name: r'city',
      type: IsarType.long,
    ),
    r'groupId': PropertySchema(
      id: 2,
      name: r'groupId',
      type: IsarType.long,
    ),
    r'isFavourite': PropertySchema(
      id: 3,
      name: r'isFavourite',
      type: IsarType.bool,
    ),
    r'league': PropertySchema(
      id: 4,
      name: r'league',
      type: IsarType.string,
    ),
    r'part': PropertySchema(
      id: 5,
      name: r'part',
      type: IsarType.long,
    ),
    r'performance': PropertySchema(
      id: 6,
      name: r'performance',
      type: IsarType.string,
    ),
    r'performanceDay': PropertySchema(
      id: 7,
      name: r'performanceDay',
      type: IsarType.string,
    ),
    r'performanceId': PropertySchema(
      id: 8,
      name: r'performanceId',
      type: IsarType.long,
    ),
    r'problem': PropertySchema(
      id: 9,
      name: r'problem',
      type: IsarType.long,
    ),
    r'searchableTeam': PropertySchema(
      id: 10,
      name: r'searchableTeam',
      type: IsarType.string,
    ),
    r'spontan': PropertySchema(
      id: 11,
      name: r'spontan',
      type: IsarType.string,
    ),
    r'spontanDay': PropertySchema(
      id: 12,
      name: r'spontanDay',
      type: IsarType.string,
    ),
    r'stage': PropertySchema(
      id: 13,
      name: r'stage',
      type: IsarType.long,
    ),
    r'team': PropertySchema(
      id: 14,
      name: r'team',
      type: IsarType.string,
    )
  },
  estimateSize: _performanceModelDbEstimateSize,
  serialize: _performanceModelDbSerialize,
  deserialize: _performanceModelDbDeserialize,
  deserializeProp: _performanceModelDbDeserializeProp,
  idName: r'id',
  indexes: {
    r'city': IndexSchema(
      id: 2121973393509345332,
      name: r'city',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'city',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isFavourite': IndexSchema(
      id: -3295437635301440716,
      name: r'isFavourite',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isFavourite',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'group': LinkSchema(
      id: 4235506625030253595,
      name: r'group',
      target: r'PerformanceGroupModelDb',
      single: true,
      linkName: r'performancesIsarLinks',
    )
  },
  embeddedSchemas: {},
  getId: _performanceModelDbGetId,
  getLinks: _performanceModelDbGetLinks,
  attach: _performanceModelDbAttach,
  version: '3.0.5',
);

int _performanceModelDbEstimateSize(
  PerformanceModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.league.length * 3;
  bytesCount += 3 + object.performance.length * 3;
  bytesCount += 3 + object.performanceDay.length * 3;
  bytesCount += 3 + object.searchableTeam.length * 3;
  bytesCount += 3 + object.spontan.length * 3;
  bytesCount += 3 + object.spontanDay.length * 3;
  bytesCount += 3 + object.team.length * 3;
  return bytesCount;
}

void _performanceModelDbSerialize(
  PerformanceModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeLong(offsets[1], object.city);
  writer.writeLong(offsets[2], object.groupId);
  writer.writeBool(offsets[3], object.isFavourite);
  writer.writeString(offsets[4], object.league);
  writer.writeLong(offsets[5], object.part);
  writer.writeString(offsets[6], object.performance);
  writer.writeString(offsets[7], object.performanceDay);
  writer.writeLong(offsets[8], object.performanceId);
  writer.writeLong(offsets[9], object.problem);
  writer.writeString(offsets[10], object.searchableTeam);
  writer.writeString(offsets[11], object.spontan);
  writer.writeString(offsets[12], object.spontanDay);
  writer.writeLong(offsets[13], object.stage);
  writer.writeString(offsets[14], object.team);
}

PerformanceModelDb _performanceModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformanceModelDb();
  object.age = reader.readLong(offsets[0]);
  object.city = reader.readLong(offsets[1]);
  object.id = id;
  object.isFavourite = reader.readBool(offsets[3]);
  object.league = reader.readString(offsets[4]);
  object.part = reader.readLong(offsets[5]);
  object.performance = reader.readString(offsets[6]);
  object.performanceDay = reader.readString(offsets[7]);
  object.performanceId = reader.readLong(offsets[8]);
  object.problem = reader.readLong(offsets[9]);
  object.spontan = reader.readString(offsets[11]);
  object.spontanDay = reader.readString(offsets[12]);
  object.stage = reader.readLong(offsets[13]);
  object.team = reader.readString(offsets[14]);
  return object;
}

P _performanceModelDbDeserializeProp<P>(
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
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performanceModelDbGetId(PerformanceModelDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _performanceModelDbGetLinks(
    PerformanceModelDb object) {
  return [object.group];
}

void _performanceModelDbAttach(
    IsarCollection<dynamic> col, Id id, PerformanceModelDb object) {
  object.id = id;
  object.group.attach(
      col, col.isar.collection<PerformanceGroupModelDb>(), r'group', id);
}

extension PerformanceModelDbQueryWhereSort
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QWhere> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere> anyCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'city'),
      );
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhere>
      anyIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isFavourite'),
      );
    });
  }
}

extension PerformanceModelDbQueryWhere
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QWhereClause> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityEqualTo(int city) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'city',
        value: [city],
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityNotEqualTo(int city) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city',
              lower: [],
              upper: [city],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city',
              lower: [city],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city',
              lower: [city],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'city',
              lower: [],
              upper: [city],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityGreaterThan(
    int city, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'city',
        lower: [city],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityLessThan(
    int city, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'city',
        lower: [],
        upper: [city],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      cityBetween(
    int lowerCity,
    int upperCity, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'city',
        lower: [lowerCity],
        includeLower: includeLower,
        upper: [upperCity],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      isFavouriteEqualTo(bool isFavourite) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isFavourite',
        value: [isFavourite],
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterWhereClause>
      isFavouriteNotEqualTo(bool isFavourite) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavourite',
              lower: [],
              upper: [isFavourite],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavourite',
              lower: [isFavourite],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavourite',
              lower: [isFavourite],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavourite',
              lower: [],
              upper: [isFavourite],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PerformanceModelDbQueryFilter
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QFilterCondition> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      ageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'age',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      cityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
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

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      isFavouriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavourite',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'league',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'league',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'league',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      leagueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'league',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'part',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'part',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'part',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      partBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'part',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'performance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'performance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'performance',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'performance',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performance',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'performance',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performanceDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performanceDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performanceDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performanceDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'performanceDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'performanceDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'performanceDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'performanceDay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performanceDay',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceDayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'performanceDay',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'performanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'performanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'performanceId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      performanceIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'performanceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problem',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'problem',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'problem',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      problemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'problem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchableTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'searchableTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'searchableTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'searchableTeam',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'searchableTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'searchableTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'searchableTeam',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'searchableTeam',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'searchableTeam',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      searchableTeamIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'searchableTeam',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spontan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'spontan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'spontan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'spontan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'spontan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'spontan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'spontan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'spontan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spontan',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'spontan',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spontanDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'spontanDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'spontanDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'spontanDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'spontanDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'spontanDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'spontanDay',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'spontanDay',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'spontanDay',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      spontanDayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'spontanDay',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      stageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'team',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'team',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'team',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'team',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'team',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'team',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'team',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      teamIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'team',
        value: '',
      ));
    });
  }
}

extension PerformanceModelDbQueryObject
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QFilterCondition> {}

extension PerformanceModelDbQueryLinks
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QFilterCondition> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      group(FilterQuery<PerformanceGroupModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'group');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterFilterCondition>
      groupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'group', 0, true, 0, true);
    });
  }
}

extension PerformanceModelDbQuerySortBy
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QSortBy> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByLeague() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByLeagueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performance', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performance', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceDay', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceDay', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByPerformanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByProblemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySearchableTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableTeam', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySearchableTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableTeam', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontan', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontan', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontanDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontanDay', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortBySpontanDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontanDay', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      sortByTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team', Sort.desc);
    });
  }
}

extension PerformanceModelDbQuerySortThenBy
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QSortThenBy> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByIsFavouriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavourite', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByLeague() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByLeagueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performance', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performance', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceDay', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceDay', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByPerformanceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'performanceId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByProblemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySearchableTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableTeam', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySearchableTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'searchableTeam', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontan', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontan', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontanDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontanDay', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenBySpontanDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'spontanDay', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.desc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team', Sort.asc);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QAfterSortBy>
      thenByTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team', Sort.desc);
    });
  }
}

extension PerformanceModelDbQueryWhereDistinct
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct> {
  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByIsFavourite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavourite');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByLeague({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'league', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'part');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPerformance({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performance', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPerformanceDay({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performanceDay',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByPerformanceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'performanceId');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'problem');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctBySearchableTeam({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'searchableTeam',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctBySpontan({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'spontan', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctBySpontanDay({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'spontanDay', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stage');
    });
  }

  QueryBuilder<PerformanceModelDb, PerformanceModelDb, QDistinct>
      distinctByTeam({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'team', caseSensitive: caseSensitive);
    });
  }
}

extension PerformanceModelDbQueryProperty
    on QueryBuilder<PerformanceModelDb, PerformanceModelDb, QQueryProperty> {
  QueryBuilder<PerformanceModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<PerformanceModelDb, bool, QQueryOperations>
      isFavouriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavourite');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations> leagueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'league');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> partProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'part');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      performanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performance');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      performanceDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performanceDay');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations>
      performanceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'performanceId');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> problemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'problem');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      searchableTeamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'searchableTeam');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations> spontanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spontan');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations>
      spontanDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'spontanDay');
    });
  }

  QueryBuilder<PerformanceModelDb, int, QQueryOperations> stageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stage');
    });
  }

  QueryBuilder<PerformanceModelDb, String, QQueryOperations> teamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'team');
    });
  }
}
