import 'package:flutter_test/flutter_test.dart';
import 'package:translator/features/translator/data/data_sources/script_data_source.dart';
import 'package:translator/features/translator/domain/entities/script.dart';

main() {
  ScriptDataSourceImpl dataSource = ScriptDataSourceImpl();
  Script script = Script(text: "test");
  Script scriptM = Script(text: "- . ... -");
  test("convert english to morse",
          () async {
        var result = await dataSource.convertToMorse(script);
        expect(result.text, scriptM.text);
      }
  );

  test("convert morse to english",
          () async {
        var result = await dataSource.convertToEnglish(scriptM);
        expect(result.text, script.text);
      }
  );
}