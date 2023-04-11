// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_group.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetPerformanceGroupModelDbCollection on Isar {
  IsarCollection<PerformanceGroupModelDb> get performanceGroupModelDbs =>
      this.collection();
}

const PerformanceGroupModelDbSchema = CollectionSchema(
  name: r'PerformanceGroupModelDb',
  id: 2365503603692017367,
  properties: {
    r'age': PropertySchema(
      id: 0,
      name: r'age',
      type: IsarType.long,
    ),
    r'day': PropertySchema(
      id: 1,
      name: r'day',
      type: IsarType.string,
    ),
    r'groupId': PropertySchema(
      id: 2,
      name: r'groupId',
      type: IsarType.long,
    ),
    r'league': PropertySchema(
      id: 3,
      name: r'league',
      type: IsarType.string,
    ),
    r'part': PropertySchema(
      id: 4,
      name: r'part',
      type: IsarType.long,
    ),
    r'problem': PropertySchema(
      id: 5,
      name: r'problem',
      type: IsarType.long,
    ),
    r'stage': PropertySchema(
      id: 6,
      name: r'stage',
      type: IsarType.long,
    )
  },
  estimateSize: _performanceGroupModelDbEstimateSize,
  serialize: _performanceGroupModelDbSerialize,
  deserialize: _performanceGroupModelDbDeserialize,
  deserializeProp: _performanceGroupModelDbDeserializeProp,
  idName: r'id',
  indexes: {
    r'stage_problem_age': IndexSchema(
      id: 857636620667929960,
      name: r'stage_problem_age',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'stage',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'problem',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'age',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'performancesIsarLinks': LinkSchema(
      id: 7856486198716847802,
      name: r'performancesIsarLinks',
      target: r'PerformanceModelDb',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _performanceGroupModelDbGetId,
  getLinks: _performanceGroupModelDbGetLinks,
  attach: _performanceGroupModelDbAttach,
  version: '3.0.5',
);

int _performanceGroupModelDbEstimateSize(
  PerformanceGroupModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.day.length * 3;
  bytesCount += 3 + object.league.length * 3;
  return bytesCount;
}

void _performanceGroupModelDbSerialize(
  PerformanceGroupModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.age);
  writer.writeString(offsets[1], object.day);
  writer.writeLong(offsets[2], object.groupId);
  writer.writeString(offsets[3], object.league);
  writer.writeLong(offsets[4], object.part);
  writer.writeLong(offsets[5], object.problem);
  writer.writeLong(offsets[6], object.stage);
}

PerformanceGroupModelDb _performanceGroupModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PerformanceGroupModelDb();
  object.age = reader.readLong(offsets[0]);
  object.day = reader.readString(offsets[1]);
  object.groupId = reader.readLong(offsets[2]);
  object.id = id;
  object.league = reader.readString(offsets[3]);
  object.part = reader.readLong(offsets[4]);
  object.problem = reader.readLong(offsets[5]);
  object.stage = reader.readLong(offsets[6]);
  return object;
}

P _performanceGroupModelDbDeserializeProp<P>(
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
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _performanceGroupModelDbGetId(PerformanceGroupModelDb object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _performanceGroupModelDbGetLinks(
    PerformanceGroupModelDb object) {
  return [object.performancesIsarLinks];
}

void _performanceGroupModelDbAttach(
    IsarCollection<dynamic> col, Id id, PerformanceGroupModelDb object) {
  object.id = id;
  object.performancesIsarLinks.attach(col,
      col.isar.collection<PerformanceModelDb>(), r'performancesIsarLinks', id);
}

extension PerformanceGroupModelDbQueryWhereSort
    on QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QWhere> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterWhere>
      anyStageProblemAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'stage_problem_age'),
      );
    });
  }
}

extension PerformanceGroupModelDbQueryWhere on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QWhereClause> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToAnyProblemAge(int stage) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stage_problem_age',
        value: [stage],
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageNotEqualToAnyProblemAge(int stage) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [],
              upper: [stage],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [],
              upper: [stage],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageGreaterThanAnyProblemAge(
    int stage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageLessThanAnyProblemAge(
    int stage, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [],
        upper: [stage],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageBetweenAnyProblemAge(
    int lowerStage,
    int upperStage, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [lowerStage],
        includeLower: includeLower,
        upper: [upperStage],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAnyAge(int stage, int problem) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stage_problem_age',
        value: [stage, problem],
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterWhereClause>
      stageEqualToProblemNotEqualToAnyAge(int stage, int problem) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage],
              upper: [stage, problem],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage, problem],
              includeLower: false,
              upper: [stage],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage, problem],
              includeLower: false,
              upper: [stage],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage],
              upper: [stage, problem],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToProblemGreaterThanAnyAge(
    int stage,
    int problem, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage, problem],
        includeLower: include,
        upper: [stage],
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToProblemLessThanAnyAge(
    int stage,
    int problem, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage],
        upper: [stage, problem],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageEqualToProblemBetweenAnyAge(
    int stage,
    int lowerProblem,
    int upperProblem, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage, lowerProblem],
        includeLower: includeLower,
        upper: [stage, upperProblem],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterWhereClause>
      stageProblemAgeEqualTo(int stage, int problem, int age) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'stage_problem_age',
        value: [stage, problem, age],
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterWhereClause>
      stageProblemEqualToAgeNotEqualTo(int stage, int problem, int age) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage, problem],
              upper: [stage, problem, age],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage, problem, age],
              includeLower: false,
              upper: [stage, problem],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage, problem, age],
              includeLower: false,
              upper: [stage, problem],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'stage_problem_age',
              lower: [stage, problem],
              upper: [stage, problem, age],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAgeGreaterThan(
    int stage,
    int problem,
    int age, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage, problem, age],
        includeLower: include,
        upper: [stage, problem],
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAgeLessThan(
    int stage,
    int problem,
    int age, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage, problem],
        upper: [stage, problem, age],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterWhereClause> stageProblemEqualToAgeBetween(
    int stage,
    int problem,
    int lowerAge,
    int upperAge, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'stage_problem_age',
        lower: [stage, problem, lowerAge],
        includeLower: includeLower,
        upper: [stage, problem, upperAge],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PerformanceGroupModelDbQueryFilter on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QFilterCondition> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'age',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> ageBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      dayContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'day',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      dayMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'day',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> dayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'day',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> groupIdBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueEqualTo(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueStartsWith(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueEndsWith(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      leagueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'league',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      leagueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'league',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'league',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> leagueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'league',
        value: '',
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'part',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> partBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'problem',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> problemBetween(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageGreaterThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageLessThan(
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

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> stageBetween(
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
}

extension PerformanceGroupModelDbQueryObject on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QFilterCondition> {}

extension PerformanceGroupModelDbQueryLinks on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QFilterCondition> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
          QAfterFilterCondition>
      performancesIsarLinks(FilterQuery<PerformanceModelDb> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'performancesIsarLinks');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> performancesIsarLinksLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performancesIsarLinks', length, true, length, true);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> performancesIsarLinksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performancesIsarLinks', 0, true, 0, true);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> performancesIsarLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'performancesIsarLinks', 0, false, 999999, true);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> performancesIsarLinksLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performancesIsarLinks', 0, true, length, include);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> performancesIsarLinksLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performancesIsarLinks', length, include, 999999, true);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb,
      QAfterFilterCondition> performancesIsarLinksLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'performancesIsarLinks', lower, includeLower, upper, includeUpper);
    });
  }
}

extension PerformanceGroupModelDbQuerySortBy
    on QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QSortBy> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByLeague() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByLeagueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByProblemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      sortByStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.desc);
    });
  }
}

extension PerformanceGroupModelDbQuerySortThenBy on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QSortThenBy> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'age', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'day', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByLeague() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByLeagueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'league', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByPartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'part', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByProblemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'problem', Sort.desc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.asc);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QAfterSortBy>
      thenByStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.desc);
    });
  }
}

extension PerformanceGroupModelDbQueryWhereDistinct on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct> {
  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'age');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByDay({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'day', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByLeague({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'league', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByPart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'part');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByProblem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'problem');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, PerformanceGroupModelDb, QDistinct>
      distinctByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stage');
    });
  }
}

extension PerformanceGroupModelDbQueryProperty on QueryBuilder<
    PerformanceGroupModelDb, PerformanceGroupModelDb, QQueryProperty> {
  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> ageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'age');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, String, QQueryOperations>
      dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'day');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations>
      groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, String, QQueryOperations>
      leagueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'league');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> partProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'part');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations>
      problemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'problem');
    });
  }

  QueryBuilder<PerformanceGroupModelDb, int, QQueryOperations> stageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stage');
    });
  }
}
