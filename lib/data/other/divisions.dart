import 'package:odyssey_mobile/domain/entities/schedule_category_entity.dart';
import 'package:odyssey_mobile/consts/strings.dart';

// Overcomplicated solution for a simple problem, in case one day we'll become
// crazy and 'll internationalize the app.
const List<DivisionEntity> divisions = [
  JuniorDivision(),
  FirstDivision(),
  SecondDivision(),
  ThirdDivision(),
  ForthDivision(),
];

class JuniorDivision implements DivisionEntity {
  const JuniorDivision();

  @override
  final int number = 0;

  @override
  final String name = AppStrings.juniors;

  @override
  String get symbol => 'J';

  @override
  ScheduleCategory get category => ScheduleCategory.age;

  @override
  String get title => AppStrings.juniorGroup;
}

class FirstDivision implements DivisionEntity {
  const FirstDivision();

  @override
  final int number = 1;

  @override
  final String name = AppStrings.firstDivision;

  @override
  String get symbol => 'I';

  @override
  ScheduleCategory get category => ScheduleCategory.age;

  @override
  String get title => '${AppStrings.age} $symbol';
}

class SecondDivision implements DivisionEntity {
  const SecondDivision();

  @override
  final int number = 2;

  @override
  final String name = AppStrings.secondDivision;

  @override
  String get symbol => 'II';

  @override
  ScheduleCategory get category => ScheduleCategory.age;

  @override
  String get title => '${AppStrings.age} $symbol';
}

class ThirdDivision implements DivisionEntity {
  const ThirdDivision();

  @override
  final int number = 3;

  @override
  final String name = AppStrings.thirdDivision;

  @override
  String get symbol => 'III';

  @override
  ScheduleCategory get category => ScheduleCategory.age;

  @override
  String get title => '${AppStrings.age} $symbol';
}

class ForthDivision implements DivisionEntity {
  const ForthDivision();

  @override
  final int number = 4;

  @override
  final String name = AppStrings.forthDivision;

  @override
  String get symbol => 'IV';

  @override
  ScheduleCategory get category => ScheduleCategory.age;

  @override
  String get title => '${AppStrings.age} $symbol';
}
