import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/features/translator/presentation/bloc/script_bloc.dart';
import 'package:translator/features/translator/presentation/widgets/script_card.dart';

class MorseTranslatorPage extends StatelessWidget {
  MorseTranslatorPage({Key? key}) : super(key: key);
  final TextEditingController topController = TextEditingController();
  final TextEditingController bottomController = TextEditingController();
  final Features features = Features();
  bool isSnackBarShown = false;

  @override
  Widget build(BuildContext context) {
    features.topController = topController;
    features.bottomController = bottomController;
    void translateToEnglish(String value) {
      BlocProvider.of<ScriptBloc>(context).add(ConvertScriptToEnglish(value));
    }

    void translateToMorse(String value) {
      BlocProvider.of<ScriptBloc>(context).add(ConvertScriptToMorse(value));
    }

    void copyText(String value) {
      BlocProvider.of<ScriptBloc>(context).add(CopyScript(value));
    }

    void clearText() {
      BlocProvider.of<ScriptBloc>(context).add(ClearScript());
    }

    void closeKeyboard() {
      FocusManager.instance.primaryFocus!.unfocus();
    }

    void showSnackBar() {
      isSnackBarShown = true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.blue,
          duration: const Duration(seconds: 2),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Copied to clipboard",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Icon(
                Icons.copy,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ).closed.then((value) => isSnackBarShown = false);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Morse Translator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            features,
            const SizedBox(
              height: 5,
            ),
            ScriptCard(
              icon: Icons.clear,
              controller: topController,
              onPressed: () {
                clearText();
                topController.clear();
                closeKeyboard();
              },
              onChanged: (value) {
                if (features.fromEnglish) {
                  translateToMorse(value);
                } else {
                  translateToEnglish(value);
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<ScriptBloc, ScriptState>(
              builder: (context, state) {
                if (state is Error) {
                  return ScriptCard(
                    icon: Icons.error,
                    controller: bottomController,
                    onPressed: () {},
                    onChanged: (value) {},
                    color: Colors.grey,
                    iconAndTextColor: Colors.red,
                    enabled: false,
                    visible: true,
                    errorMessage: state.message,
                  );
                } else if (state is Loaded) {
                  bottomController.text = state.script.text;
                  return ScriptCard(
                    icon: Icons.copy,
                    controller: bottomController,
                    onPressed: () {
                      copyText(state.script.text);
                      closeKeyboard();
                      if (isSnackBarShown == false) {
                        showSnackBar();
                      }
                    },
                    onChanged: (value) {},
                    color: Colors.blue,
                    iconAndTextColor: Colors.white,
                    enabled: false,
                  );
                } else {
                  bottomController.clear();
                  return ScriptCard(
                    icon: Icons.copy,
                    controller: bottomController,
                    onPressed: () {},
                    onChanged: (value) {},
                    color: Colors.blue,
                    iconAndTextColor: Colors.white,
                    enabled: false,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Features extends StatefulWidget {
  late TextEditingController topController;
  late TextEditingController bottomController;

  bool fromEnglish = true;

  String language(bool type) {
    if (type) {
      return "English";
    } else {
      return "Morse";
    }
  }

  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 12,
      child: Row(
        children: [
          Expanded(
              child: Text(
            widget.language(widget.fromEnglish),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )),
          Expanded(
              child: IconButton(
            onPressed: () {
              setState(() {
                widget.fromEnglish = !widget.fromEnglish;
                final text = widget.bottomController.text;
                widget.topController.text = text;
                if (widget.fromEnglish) {
                  BlocProvider.of<ScriptBloc>(context)
                      .add(ConvertScriptToMorse(text));
                } else {
                  BlocProvider.of<ScriptBloc>(context)
                      .add(ConvertScriptToEnglish(text));
                }
                widget.topController.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.topController.text.length),
                );
              });
            },
            icon: const Icon(
              Icons.swap_horiz,
              color: Colors.grey,
            ),
          )),
          Expanded(
              child: Text(
            widget.language(!widget.fromEnglish),
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          )),
        ],
      ),
    );
  }
}
