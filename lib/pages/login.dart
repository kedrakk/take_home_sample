import 'package:flutter/material.dart';
import 'package:take_home/const/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Please Login To Continue'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton.icon(
                style: MainTheme.elevatedButtonStyle(context),
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined),
                label: const Text("Anonymosuly"),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: MainTheme.elevatedButtonStyle(context),
                onPressed: () {},
                icon: const Icon(Icons.account_circle_outlined),
                label: const Text("Via Google"),
              ),
            ),
          ],
        ));
  }
}
