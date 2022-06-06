import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_home/const/theme.dart';
import 'package:take_home/network/get_data.dart';
import 'package:take_home/provider/prices_provider.dart';
import 'package:take_home/repository/data_repo.dart';
import 'package:take_home/widgets/data_table_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PricesProvider(
        dataRepo: DataRepo(
          getNetworkData: GetNetworkData(),
        ),
        context: context,
      ),
      builder: (context, _) {
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
          body: Consumer<PricesProvider>(
            builder: ((context, value, child) {
              return value.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: MainTheme.cream,
                        color: MainTheme.cream,
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
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
                              "Updated on ${value.prices.currentTime}",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: MainTheme.cream,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          DataTableWidget(
                            prices: value.prices,
                          ),
                        ],
                      ),
                    );
            }),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Navigator.pushNamed(context, 'bookingScreen'),
            label: const Text(
              "Click here to book",
            ),
          ),
        );
      },
    );
  }
}
