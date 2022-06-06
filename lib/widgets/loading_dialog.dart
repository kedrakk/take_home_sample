import 'package:flutter/material.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/widgets/indicator_widget.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        title: const Text("Success"),
        content: const Text("Your booking has been successfully created"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                'homeScreen',
                (route) => false,
              );
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

void showInfoModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IndicatorWidget(
                bgColor: Colors.grey[200]!,
                text: "Not available",
                borderColor: Colors.grey[200]!,
              ),
              IndicatorWidget(
                bgColor: MainTheme.cream,
                text: "Available",
                borderColor: Colors.grey[200]!,
              ),
              const IndicatorWidget(
                bgColor: MainTheme.primary,
                text: "Selected",
                borderColor: MainTheme.primary,
              ),
            ]),
      );
    },
  );
}
