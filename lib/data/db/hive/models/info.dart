import 'package:odyssey_mobile/domain/entities/info.dart';

class InfoHiveModel extends Info {
  @override
  final int number;

  @override
  final String infoName;

  @override
  final String infoText;

  @override
  final int sortNumber;

  InfoHiveModel(this.number, this.infoName, this.infoText, this.sortNumber);
}
