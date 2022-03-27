import 'package:flutter_test/flutter_test.dart';
import 'package:translator/features/translator/data/models/script_model.dart';
import 'package:translator/features/translator/domain/entities/script.dart';

void main() {
  final tScriptModel = ScriptModel(text: "test");
  final tEnglishModel = ScriptModel(text: "test");
  final tMorseModel = ScriptModel(text: "- . ... -");
  final tInvalidModel = ScriptModel(text: "test ^");

  test(
    "should be a subclass of Script entity",
    () async {
      expect(tScriptModel, isA<Script>());
    },
  );

  group(
      "determine if script is valid",
      (){
        test(
            "should be valid",
            (){
              final result = tScriptModel.isValid();
              expect(result, true);
            });
        test(
            "should be invalid",
                (){
              final result = tInvalidModel.isValid();
              expect(result, false);
            });
      });

  group(
      "determine script type",
      (){
       test(
           "script is in english",
           () {
             final result = tEnglishModel.isEnglish();

             expect(result, true);
           });
       test(
           "script is in morse",
               () {
             final result = tMorseModel.isEnglish();

             expect(result, false);
               });
      });
}
