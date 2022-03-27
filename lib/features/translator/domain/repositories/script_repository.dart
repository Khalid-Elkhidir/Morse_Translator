import 'package:dartz/dartz.dart';
import 'package:translator/core/error/failures.dart';
import 'package:translator/features/translator/domain/entities/script.dart';

abstract class ScriptRepository {
  Future<Either<Failure, Script>> convertToEnglish(Script script);
  Future<Either<Failure, Script>> convertToMorse(Script script);
}