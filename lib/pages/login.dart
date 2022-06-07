import 'package:flutter/material.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/provider/get_it_service.dart';
import 'package:take_home/repository/data_repo.dart';
import 'package:take_home/widgets/snackbar_messages.dart';

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
              onPressed: () => _signInAnonymously(context),
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
      ),
    );
  }

  _signInAnonymously(BuildContext context) {
    getIt<IDataRepo>().userLogin().then((value) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        'homeScreen',
        (route) => false,
      );
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        showErrorMessage(
          e.toString(),
        ),
      );
    });
  }
}
