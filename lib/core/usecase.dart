import 'package:dartz/dartz.dart';

import 'error/failures.dart';

abstract class UseCase<Type, String> {
  Future<Either<Failure, Type>> call(String script);
}