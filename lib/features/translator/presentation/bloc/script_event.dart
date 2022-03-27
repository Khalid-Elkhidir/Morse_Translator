part of 'script_bloc.dart';

abstract class ScriptEvent extends Equatable {
  const ScriptEvent();
}

class ConvertScriptToMorse extends ScriptEvent {
  final String scriptString;

  @override
  List<Object?> get props => [scriptString];

  const ConvertScriptToMorse(this.scriptString);
}

class ConvertScriptToEnglish extends ScriptEvent {
  @override
  List<Object?> get props => [scriptString];

  final String scriptString;

  const ConvertScriptToEnglish(this.scriptString);
}

class ClearScript extends ScriptEvent {
  @override
  List<Object?> get props => [];

  const ClearScript();
}

class CopyScript extends ScriptEvent {
  @override
  List<Object?> get props => [scriptString];
  final String scriptString;

  const CopyScript(this.scriptString);
}
