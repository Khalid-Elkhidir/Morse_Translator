import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const<dynamic> []]);
}

class ValidFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ForeignLanguageFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}