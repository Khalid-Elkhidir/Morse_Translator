part of 'script_bloc.dart';

abstract class ScriptState extends Equatable {
  const ScriptState();
}

class Empty extends ScriptState {
  @override
  List<Object> get props => [];
}

class Loaded extends ScriptState {
  @override
  List<Object> get props => [script];

  final Script script;

  const Loaded({required this.script});
}
class Error extends ScriptState {
  @override
  List<Object> get props => [message];

  final String message;

  const Error({required this.message});
}