import 'package:dartz/dartz.dart';
import 'package:translator/core/error/failures.dart';
import 'package:translator/features/translator/data/data_sources/script_data_source.dart';
import 'package:translator/features/translator/data/models/script_model.dart';
import 'package:translator/features/translator/domain/entities/script.dart';
import 'package:translator/features/translator/domain/repositories/script_repository.dart';

class ScriptRepositoryImpl
    implements ScriptRepository {
  final ScriptDataSource scriptDataSource;

  ScriptRepositoryImpl(this.scriptDataSource);

  @override
  Future<Either<Failure, Script>> convertToEnglish(Script script) async{
    final scriptModel = ScriptModel(text: script.text.trimRight());
    if(scriptModel.isValid()) {
      if(scriptModel.isEnglish() && scriptModel.text.isNotEmpty){
        return Left(ForeignLanguageFailure());
      } else {
        try {
          return Right(await scriptDataSource.convertToEnglish(script));
        }on UnimplementedError {
          return Left(ForeignLanguageFailure());
        }
      }
    }else{
      return Left(ValidFailure());
    }
  }

  @override
  Future<Either<Failure, Script>> convertToMorse(Script script) async{
    final scriptModel = ScriptModel(text: script.text);
    if(scriptModel.isValid()) {
      switch (scriptModel.isEnglish()) {
        case true:
          return Right(await scriptDataSource.convertToMorse(script));
        case false:
          return Left(ForeignLanguageFailure());
        default:
          return Left(UnknownFailure());
      }
    }else{
      return Left(ValidFailure());
    }
  }
}

