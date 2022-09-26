import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String code;
  final String message;
  final String severity;

  const Failure({
    required this.code,
    required this.message,
    required this.severity,
  });

  @override
  List<Object> get props => [code, message, severity];
}

class RestApiFailure extends Failure {
  const RestApiFailure({
    super.code = "REST_API_FAILURE",
    super.message = "Something went wrong when fetching data from API",
    super.severity = "HIGH",
  });
}
