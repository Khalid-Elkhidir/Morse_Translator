import 'package:translator/features/translator/data/data_sources/dictionary.dart';
import 'package:translator/features/translator/data/models/script_model.dart';
import 'package:translator/features/translator/domain/entities/script.dart';

abstract class ScriptDataSource {
  Future<ScriptModel> convertToMorse(Script script);

  Future<ScriptModel> convertToEnglish(Script script);
}

class ScriptDataSourceImpl implements ScriptDataSource {
  @override
  Future<ScriptModel> convertToEnglish(Script script) async {
    final Map<String, dynamic> dictionary = Dictionary().dictionary;
    final List<String> scriptCharacters = [];
    final List<String> convertedScriptCharacters = [];
    final text = script.text.replaceAll(" / ", "/");
    String convertedText;
    String character = "";
    for (int i = 0; i < text.length; i++) {
      if (text[i] == "/") {
        scriptCharacters.add(character);
        scriptCharacters.add("/");
        character = "";
      } else if (text[i] == " ") {
        scriptCharacters.add(character);
        character = "";
        continue;
      } else {
        character += text[i];
        if (i == text.length - 1) {
          scriptCharacters.add(character);
        }
      }
    }

    for (int i = 0; i < scriptCharacters.length; i++) {
      if (scriptCharacters[i] == "/") {
        convertedScriptCharacters.add(" ");
      } else {
        var key = dictionary.keys.firstWhere(
            (key) => dictionary[key] == scriptCharacters[i],
            orElse: () => throw UnimplementedError());
        convertedScriptCharacters.add(key);
      }
    }
    convertedText = convertedScriptCharacters.join("");
    return ScriptModel(text: convertedText);
  }

  @override
  Future<ScriptModel> convertToMorse(Script script) async {
    final Map<String, dynamic> dictionary = Dictionary().dictionary;
    final List<String> scriptCharacters = [];
    final List<String> convertedScriptCharacters = [];
    final text = script.text.toLowerCase();
    String convertedText;
    for (int i = 0; i < text.length; i++) {
      scriptCharacters.add(text[i]);
    }

    for (int i = 0; i < scriptCharacters.length; i++) {
      if (scriptCharacters[i] == " ") {
        convertedScriptCharacters.removeLast();
        convertedScriptCharacters.add("/");
        continue;
      } else {
        convertedScriptCharacters.add(dictionary[scriptCharacters[i]]!);
      }
      convertedScriptCharacters.add(" ");
    }
    convertedText = convertedScriptCharacters.join("").trimRight();
    return ScriptModel(text: convertedText);
  }
}