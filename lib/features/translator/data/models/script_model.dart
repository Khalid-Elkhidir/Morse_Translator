import 'package:translator/features/translator/domain/entities/script.dart';

class ScriptModel extends Script {
  const ScriptModel({required String text}) : super(text: text);

  bool isValid() {
    bool valid = true;
    String _text = text.toLowerCase().trim().replaceAll(" ", "");
    for (int i = 0; i < _text.length; i++) {
      if (_text[i] != "a" &&
          _text[i] != "b" &&
          _text[i] != "c" &&
          _text[i] != "d" &&
          _text[i] != "e" &&
          _text[i] != "f" &&
          _text[i] != "g" &&
          _text[i] != "h" &&
          _text[i] != "i" &&
          _text[i] != "j" &&
          _text[i] != "k" &&
          _text[i] != "l" &&
          _text[i] != "m" &&
          _text[i] != "n" &&
          _text[i] != "o" &&
          _text[i] != "p" &&
          _text[i] != "q" &&
          _text[i] != "r" &&
          _text[i] != "s" &&
          _text[i] != "t" &&
          _text[i] != "u" &&
          _text[i] != "v" &&
          _text[i] != "w" &&
          _text[i] != "x" &&
          _text[i] != "y" &&
          _text[i] != "z" &&
          _text[i] != "0" &&
          _text[i] != "1" &&
          _text[i] != "2" &&
          _text[i] != "3" &&
          _text[i] != "4" &&
          _text[i] != "5" &&
          _text[i] != "6" &&
          _text[i] != "7" &&
          _text[i] != "8" &&
          _text[i] != "9" &&
          _text[i] != "," &&
          _text[i] != "?" &&
          _text[i] != "'" &&
          _text[i] != "!" &&
          _text[i] != "/" &&
          _text[i] != "(" &&
          _text[i] != ")" &&
          _text[i] != "&" &&
          _text[i] != ":" &&
          _text[i] != ";" &&
          _text[i] != "=" &&
          _text[i] != "+" &&
          _text[i] != "_" &&
          _text[i] != "-" &&
          _text[i] != "." &&
          _text[i] != "\"" &&
          _text[i] != "\$" &&
          _text[i] != "@") {
        valid = false;
        break;
      }
    }
    return valid;
  }
  bool isEnglish() {
    bool state = true;
    final _text = text.toLowerCase();
    for (int i = 0; i < _text.length; i++) {
      if (_text[i] == "-" ||
          _text[i] == ".") {
        state = false;
      } else if(_text[i] == " " || _text[i] == "/"){
        continue;
      } else{
        state = true;
        break;
      }
    }
    return state;
  }
}
