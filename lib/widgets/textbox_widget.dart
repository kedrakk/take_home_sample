import 'package:flutter/material.dart';
import 'package:take_home/const/theme.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[300]!,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: MainTheme.primary,
              ),
            )),
      ),
    );
  }
}
