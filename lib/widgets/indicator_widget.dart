import 'package:flutter/cupertino.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
    required this.bgColor,
    required this.text,
    required this.borderColor,
  }) : super(key: key);
  final Color bgColor;
  final String text;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: borderColor,
            ),
          ),
        ),
        Text(text),
      ],
    );
  }
}
