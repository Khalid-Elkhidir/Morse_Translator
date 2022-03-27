import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:translator/features/translator/domain/entities/script.dart';
import 'package:translator/features/translator/domain/repositories/script_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_morse.dart';

import 'convert_to_morse_test.mocks.dart';

@GenerateMocks([ScriptRepository])
void main() {
  
  MockScriptRepository mockScriptRepository = MockScriptRepository();
  ConvertToMorse usecase = ConvertToMorse(mockScriptRepository);

  setUp(() {
    mockScriptRepository = MockScriptRepository();
    usecase = ConvertToMorse(mockScriptRepository);
  });

  final Script tInsertedScript = Script(text: "test");
  final Script tConvertedScript = Script(text: "- . ... -");

  test(
      "get morse converted script for the inserted script from the repository",
      () async {
        when(mockScriptRepository.convertToMorse(tInsertedScript))
            .thenAnswer((_) async => Right(tConvertedScript));

        final result = await usecase(tInsertedScript.text);

        expect(result, Right(tConvertedScript));
        verify(mockScriptRepository.convertToMorse(tInsertedScript));
        verifyNoMoreInteractions(mockScriptRepository);
      },
  );
}