import 'package:flutter/material.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/data/price_model.dart';
import 'package:take_home/widgets/data_table_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.primary,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Take Home'),
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
      body: Container(
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children: [
            const Text(
              'Metal Prices',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Updated on ${Prices.demoPrices.currentTime}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: MainTheme.cream,
                ),
              ),
            ),
            const SizedBox(height: 10),
            DataTableWidget(
              prices: Prices.demoPrices,
            ),
          ],
        ),
      ),
    );
  }
}
