// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const InfoModelDbSchema = Schema(
  name: r'InfoModelDb',
  id: 734683231690946,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.long,
    ),
    r'infoName': PropertySchema(
      id: 1,
      name: r'infoName',
      type: IsarType.string,
    ),
    r'infoText': PropertySchema(
      id: 2,
      name: r'infoText',
      type: IsarType.string,
    ),
    r'number': PropertySchema(
      id: 3,
      name: r'number',
      type: IsarType.long,
    ),
    r'sortNumber': PropertySchema(
      id: 4,
      name: r'sortNumber',
      type: IsarType.long,
    )
  },
  estimateSize: _infoModelDbEstimateSize,
  serialize: _infoModelDbSerialize,
  deserialize: _infoModelDbDeserialize,
  deserializeProp: _infoModelDbDeserializeProp,
);

int _infoModelDbEstimateSize(
  InfoModelDb object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.infoName.length * 3;
  bytesCount += 3 + object.infoText.length * 3;
  return bytesCount;
}

void _infoModelDbSerialize(
  InfoModelDb object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.city);
  writer.writeString(offsets[1], object.infoName);
  writer.writeString(offsets[2], object.infoText);
  writer.writeLong(offsets[3], object.number);
  writer.writeLong(offsets[4], object.sortNumber);
}

InfoModelDb _infoModelDbDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InfoModelDb();
  object.city = reader.readLong(offsets[0]);
  object.infoName = reader.readString(offsets[1]);
  object.infoText = reader.readString(offsets[2]);
  object.number = reader.readLong(offsets[3]);
  object.sortNumber = reader.readLong(offsets[4]);
  return object;
}

P _infoModelDbDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension InfoModelDbQueryFilter
    on QueryBuilder<InfoModelDb, InfoModelDb, QFilterCondition> {
  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityGreaterThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityLessThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> cityBetween(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'infoName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'infoName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoName',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'infoName',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'infoText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'infoText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'infoText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'infoText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'infoText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'infoText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> infoTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'infoText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'infoText',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      infoTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'infoText',
        value: '',
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> numberEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'number',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> numberLessThan(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition> numberBetween(
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

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      sortNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sortNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      sortNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sortNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      sortNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sortNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<InfoModelDb, InfoModelDb, QAfterFilterCondition>
      sortNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sortNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension InfoModelDbQueryObject
    on QueryBuilder<InfoModelDb, InfoModelDb, QFilterCondition> {}
