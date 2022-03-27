import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/features/translator/presentation/pages/morse_translator_page.dart';
import 'features/translator/presentation/bloc/script_bloc.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Morse Translator",
      home: BlocProvider(
        create: (_) => di.sl<ScriptBloc>(),
          child: MorseTranslatorPage()),
    );
  }

}
