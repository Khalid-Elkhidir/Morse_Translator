import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:translator/features/translator/data/data_sources/script_data_source.dart';
import 'package:translator/features/translator/data/repositories/script_repository_impl.dart';
import 'package:translator/features/translator/domain/entities/script.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_english.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_morse.dart';
import 'package:translator/features/translator/presentation/bloc/script_bloc.dart';


void main() {
  ScriptDataSourceImpl scriptDataSource = ScriptDataSourceImpl();
  ScriptRepositoryImpl repository = ScriptRepositoryImpl(scriptDataSource);
  ConvertToMorse convertToMorse = ConvertToMorse(repository);
  ConvertToEnglish convertToEnglish = ConvertToEnglish(repository);

  ScriptBloc bloc = ScriptBloc(
      convertToMorse: convertToMorse, convertToEnglish: convertToEnglish);

  test(
    "initial state should be Empty",
        () {
        expect(bloc.state, equals(Empty()));
    },);

  blocTest<ScriptBloc, ScriptState>(
      "should emit error when the input is invalid",
      build: () => ScriptBloc(
          convertToMorse: convertToMorse, convertToEnglish: convertToEnglish),
    act: (b) { b.add(ConvertScriptToMorse("^"));
    print(b.state);
    },
    expect: () => [
      Error(message: "Invalid Input")
    ]
  );

  blocTest<ScriptBloc, ScriptState>(
  "should emit Loaded if the input is valid",
      build: () => bloc,
    act: (b) => b.add(ConvertScriptToMorse("test")),
    expect: () => [
      Loaded(script: Script(text: "- . ... -"))
    ]
  );
}