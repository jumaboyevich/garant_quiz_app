import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/// Cache failure
class ParsingFailure extends Failure {
  const ParsingFailure(super.errorMessage);
}
