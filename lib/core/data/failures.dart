import 'package:odyssey_mobile/l10n/strings.dart';
import 'package:odyssey_mobile/core/failure.dart';

// TODO: Refactor to enums.

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

class UpdateImpossibleFailure extends Failure {
  const UpdateImpossibleFailure();

  @override
  String get errorMessage => AppStrings.updateImpossibleFailureMessage;
}
