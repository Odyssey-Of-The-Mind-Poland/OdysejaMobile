import 'package:intl/intl.dart';

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

  DateTime? getPerofrmanceDateTime() {
    try {
      final parsedTime = DateFormat('HH:mm').parse(performance);

      return DateTime(
        performanceDate.year,
        performanceDate.month,
        performanceDate.day,
        parsedTime.hour,
        parsedTime.minute,
      );
    } catch (e) {
      return null;
    }
  }
}
