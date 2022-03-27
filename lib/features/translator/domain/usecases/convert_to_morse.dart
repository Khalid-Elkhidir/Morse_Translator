import 'package:dartz/dartz.dart';
import 'package:translator/core/error/failures.dart';
import 'package:translator/core/usecase.dart';
import 'package:translator/features/translator/domain/entities/script.dart';
import 'package:translator/features/translator/domain/repositories/script_repository.dart';

class ConvertToMorse implements UseCase<Script, String> {
  final ScriptRepository repository;

  ConvertToMorse(this.repository);

  @override
  Future<Either<Failure, Script>> call(String script) async {
    return await repository.convertToMorse(Script(text: script));
  }
}
