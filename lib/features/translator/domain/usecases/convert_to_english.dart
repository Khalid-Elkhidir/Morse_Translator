import 'package:dartz/dartz.dart';
import 'package:translator/core/error/failures.dart';
import 'package:translator/core/usecase.dart';
import 'package:translator/features/translator/domain/entities/script.dart';
import 'package:translator/features/translator/domain/repositories/script_repository.dart';

class ConvertToEnglish implements UseCase<Script, String> {
  final ScriptRepository repository;

  ConvertToEnglish(this.repository);

  @override
  Future<Either<Failure, Script>> call(String script) async{
    return repository.convertToEnglish(Script(text: script));
  }

}