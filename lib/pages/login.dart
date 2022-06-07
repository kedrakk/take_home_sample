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
        title: const Text('Take Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Please Login To Continue',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              style: MainTheme.elevatedButtonStyle(context),
              onPressed: () => _signInAnonymously(context),
              icon: const Icon(Icons.account_circle_outlined),
              label: const Text("Click here to login"),
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
        arguments: value,
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
