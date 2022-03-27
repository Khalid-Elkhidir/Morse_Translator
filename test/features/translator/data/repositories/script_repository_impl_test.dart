import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:translator/features/translator/data/data_sources/script_data_source.dart';
import 'package:translator/features/translator/data/models/script_model.dart';
import 'package:translator/features/translator/data/repositories/script_repository_impl.dart';

import 'script_repository_impl_test.mocks.dart';

@GenerateMocks([ScriptDataSource])
void main() {
  MockScriptDataSource mockScriptDataSource = MockScriptDataSource();
  ScriptRepositoryImpl repository = ScriptRepositoryImpl(mockScriptDataSource);

  ScriptModel tEnglishModel = ScriptModel(text: "test");
  ScriptModel tMorseModel = ScriptModel(text: "- . ... -");
  group("script is valid", () {
    test(
      "should convert script to morse",
      () async {
        final result = await repository.convertToMorse(tEnglishModel);

        // verify(mockScriptDataSource(tEnglishModel));
        // verify(repository(tEnglishModel));
        expect(result, isA<ScriptModel>());
      },
    );
    // test("should convert script to english",
    //       () async {
    //
    // },
    //   );
  });
}
