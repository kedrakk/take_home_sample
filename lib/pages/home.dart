import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              'loginScreen',
              (route) => false,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text("Welcome"),
      ),
    );
  }
}
