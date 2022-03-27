import 'package:flutter/material.dart';

class ScriptCard extends StatelessWidget {
  IconData icon;
  Function() onPressed;
  Function(String value) onChanged;
  Color color;
  Color iconAndTextColor;
  bool enabled;
  String? text;
  TextEditingController controller;
  bool visible;
  String errorMessage;

  ScriptCard({
    required this.icon,
    required this.onPressed,
    required this.onChanged,
    required this.controller,
    this.color = Colors.white,
    this.iconAndTextColor = Colors.black,
    this.enabled = true,
    this.text,
    this.visible = false,
    this.errorMessage = ""
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  child: Text(
                    errorMessage,
                    style: TextStyle(
                      color: iconAndTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  visible: visible,
                ),
                Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.hardEdge,
                  shape: const CircleBorder(),
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(icon),
                    color: iconAndTextColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              child: TextField(
                onSubmitted: (_) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                style: TextStyle(
                  color: iconAndTextColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                enabled: enabled,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 4,
                controller: controller,
                onChanged: (value) {
                  text = value;
                  onChanged(text!);
                },
              ),
            ),
          )),
        ],
      ),
    );
  }
}
