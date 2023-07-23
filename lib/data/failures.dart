import 'package:odyssey_mobile/consts/strings.dart';
import 'package:odyssey_mobile/domain/failure.dart';

class DataBaseFailure extends Failure {
  const DataBaseFailure();

  @override
  String get errorMessage => AppStrings.databaseFailureMessage;
}

class DataBaseFavFailure extends Failure {
  const DataBaseFavFailure();

  @override
  String get errorMessage => AppStrings.databaseFailureMessage;
}

class ServerFailure extends Failure {
  const ServerFailure();

  @override
  String get errorMessage => AppStrings.serverFailureMessage;
}

class ConnectionFailure extends Failure {
  const ConnectionFailure();

  @override
  String get errorMessage => AppStrings.connectionFailureMessage;
}

class TimeoutFailure extends Failure {
  const TimeoutFailure();

  @override
  String get errorMessage => AppStrings.timeoutFailureMessage;
}

class UnknownFailure extends Failure {
  const UnknownFailure();

  @override
  String get errorMessage => AppStrings.unknownFailureMessage;
}

class Offline extends Failure {
  const Offline();

  @override
  String get errorMessage => AppStrings.updateFailedFailureMessage;
}

class UrlLauncherFailure extends Failure {
  const UrlLauncherFailure();

  @override
  String get errorMessage => AppStrings.urlLauncherFailureMessage;
}
