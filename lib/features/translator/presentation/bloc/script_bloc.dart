import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:translator/features/translator/domain/entities/script.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_english.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_morse.dart';

part 'script_event.dart';

part 'script_state.dart';

const String INVALID_INPUT_MESSAGE = "Invalid Input";


class ScriptBloc extends Bloc<ScriptEvent, ScriptState> {
  ConvertToMorse convertToMorse;
  ConvertToEnglish convertToEnglish;

  ScriptBloc({required this.convertToMorse, required this.convertToEnglish}) : super(Empty()) {
    on<ConvertScriptToMorse>((event, emit) async {
      final result = await convertToMorse(event.scriptString);
      result.fold((failure) {
        emit(Error(message: INVALID_INPUT_MESSAGE));
      }, (script) {
        emit(Loaded(script: script));
      });
    });

    on<ConvertScriptToEnglish>((event, emit) async {
      final result = await convertToEnglish(event.scriptString.trimRight());
      result.fold((failure) {
        emit(Error(message: INVALID_INPUT_MESSAGE));
      }, (script) {
        emit(Loaded(script: script));
      });
    });

    on<ClearScript>((event, emit) {
      emit(Empty());
    });

    on<CopyScript>((event, emit) {
      Clipboard.setData(ClipboardData(text: event.scriptString));
      emit(state);
    });
  }
}
