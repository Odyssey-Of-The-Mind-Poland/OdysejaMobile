// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCityDataModelDbCollection on Isar {
  IsarCollection<CityDataModelDb> get cityDataModelDbs => this.collection();
}

final CityDataModelDbSchema = CollectionSchema(
  name: r'CityDataModelDb',
  id: BigInt.parse("-719440796596843741").toInt(),
  properties: {
    r'cityId': PropertySchema(
      id: BigInt.parse("0").toInt(),
      name: r'cityId',
      type: IsarType.long,
    ),
    r'cityName': PropertySchema(
      id: BigInt.parse("1").toInt(),
      name: r'cityName',
      type: IsarType.string,
    )
  },
  estimateSize: _cityDataModelDbEstimateSize,
  serialize: _cityDataModelDbSerialize,
  deserialize: _cityDataModelDbDeserialize,
  deserializeProp: _cityDataModelDbDeserializeProp,
  idName: r'id',
  indexes: {
    r'cityId': IndexSchema(
      id: BigInt.parse("7617551301138149930").toInt(),
      name: r'cityId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'cityId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'stageIsarLinks': LinkSchema(
      id: BigInt.parse("-2872438133364429224").toInt(),
      name: r'stageIsarLinks',
      target: r'StageModelDb',
      single: false,
    ),
    r'performanceGroupIsarLinks': LinkSchema(
      id: BigInt.parse("-8470396827598225880").toInt(),
      name: r'performanceGroupIsarLinks',
      target: r'PerformanceGroupModelDb',
      single: false,
    ),
    r'infoIsarLinks': LinkSchema(
      id: BigInt.parse("3408283943511362216").toInt(),
      name: r'infoIsarLinks',
      target: r'InfoGroupModelDb',
      single: false,
    ),
    r'sponsorIsarLinks': LinkSchema(
      id: BigInt.parse("2834043992176695344").toInt(),
      name: r'sponsorIsarLinks',
      target: r'SponsorModelDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _cityDataModelDbGetId,
  getLinks: _cityDataModelDbGetLinks,
  attach: _cityDataModelDbAttach,
  version: '3.1.0',
);

int _cityDataModelDbEstimateSize(
  CityDataModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cityName.length * 3;
  return bytesCount;
}

void _cityDataModelDbSerialize(
  CityDataModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cityId);
  writer.writeString(offsets[1], object.cityName);
}

CityDataModelDb _cityDataModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CityDataModelDb();
  object.cityId = reader.readLong(offsets[0]);
  object.cityName = reader.readString(offsets[1]);
  object.id = id;
  return object;
}

P _cityDataModelDbDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cityDataModelDbGetId(CityDataModelDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _cityDataModelDbGetLinks(CityDataModelDb object) {
  return [
    object.stageIsarLinks,
    object.performanceGroupIsarLinks,
    object.infoIsarLinks,
    object.sponsorIsarLinks
  ];
}

void _cityDataModelDbAttach(
    IsarCollection<dynamic> col, Id id, CityDataModelDb object) {
  object.id = id;
  object.stageIsarLinks
      .attach(col, col.isar.collection<StageModelDb>(), r'stageIsarLinks', id);
  object.performanceGroupIsarLinks.attach(
      col,
      col.isar.collection<PerformanceGroupModelDb>(),
      r'performanceGroupIsarLinks',
      id);
  object.infoIsarLinks.attach(
      col, col.isar.collection<InfoGroupModelDb>(), r'infoIsarLinks', id);
  object.sponsorIsarLinks.attach(
      col, col.isar.collection<SponsorModelDb>(), r'sponsorIsarLinks', id);
}

extension CityDataModelDbQueryWhereSort
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QWhere> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhere> anyCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'cityId'),
      );
    });
  }
}

extension CityDataModelDbQueryWhere
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QWhereClause> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause> idBetween(
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdEqualTo(int cityId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'cityId',
        value: [cityId],
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdNotEqualTo(int cityId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cityId',
              lower: [],
              upper: [cityId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cityId',
              lower: [cityId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cityId',
              lower: [cityId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'cityId',
              lower: [],
              upper: [cityId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdGreaterThan(
    int cityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cityId',
        lower: [cityId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdLessThan(
    int cityId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cityId',
        lower: [],
        upper: [cityId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterWhereClause>
      cityIdBetween(
    int lowerCityId,
    int upperCityId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'cityId',
        lower: [lowerCityId],
        includeLower: includeLower,
        upper: [upperCityId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CityDataModelDbQueryFilter
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QFilterCondition> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cityId',
        value: value,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cityName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cityName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cityName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cityName',
        value: '',
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      cityNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cityName',
        value: '',
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
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

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
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
}

extension CityDataModelDbQueryObject
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QFilterCondition> {}

extension CityDataModelDbQueryLinks
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QFilterCondition> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinks(FilterQuery<StageModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'stageIsarLinks');
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'stageIsarLinks', length, true, length, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'stageIsarLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'stageIsarLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'stageIsarLinks', 0, true, length, include);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'stageIsarLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      stageIsarLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'stageIsarLinks', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinks(FilterQuery<PerformanceGroupModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'performanceGroupIsarLinks');
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performanceGroupIsarLinks', length, true, length, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performanceGroupIsarLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performanceGroupIsarLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performanceGroupIsarLinks', 0, true, length, include);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performanceGroupIsarLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      performanceGroupIsarLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performanceGroupIsarLinks', lower, includeLower,
          upper, includeUpper);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinks(FilterQuery<InfoGroupModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'infoIsarLinks');
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'infoIsarLinks', length, true, length, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'infoIsarLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'infoIsarLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'infoIsarLinks', 0, true, length, include);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'infoIsarLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      infoIsarLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'infoIsarLinks', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinks(FilterQuery<SponsorModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'sponsorIsarLinks');
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sponsorIsarLinks', length, true, length, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sponsorIsarLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sponsorIsarLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'sponsorIsarLinks', 0, true, length, include);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sponsorIsarLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterFilterCondition>
      sponsorIsarLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'sponsorIsarLinks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension CityDataModelDbQuerySortBy
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QSortBy> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> sortByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.asc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      sortByCityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.desc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      sortByCityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityName', Sort.asc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      sortByCityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityName', Sort.desc);
    });
  }
}

extension CityDataModelDbQuerySortThenBy
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QSortThenBy> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> thenByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.asc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      thenByCityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityId', Sort.desc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      thenByCityName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityName', Sort.asc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy>
      thenByCityNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cityName', Sort.desc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CityDataModelDbQueryWhereDistinct
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> {
  QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> distinctByCityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cityId');
    });
  }

  QueryBuilder<CityDataModelDb, CityDataModelDb, QDistinct> distinctByCityName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cityName', caseSensitive: caseSensitive);
    });
  }
}

extension CityDataModelDbQueryProperty
    on QueryBuilder<CityDataModelDb, CityDataModelDb, QQueryProperty> {
  QueryBuilder<CityDataModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CityDataModelDb, int, QQueryOperations> cityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cityId');
    });
  }

  QueryBuilder<CityDataModelDb, String, QQueryOperations> cityNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cityName');
    });
  }
}
