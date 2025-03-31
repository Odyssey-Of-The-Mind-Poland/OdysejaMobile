abstract class Performance {
  String get team;
  int get performanceId;
  int get stage;
  int get problem;
  int get age;
  String get performance;
  String get spontan;
  String get performanceDay;
  String get spontanDay;
  int get part;
  String get league;
  abstract bool isFavourite;
  int get groupId;
  String get searchableTeam => team.toLowerCase();
  Future<void> updatePerformance();
  DateTime get performanceDate;
}
