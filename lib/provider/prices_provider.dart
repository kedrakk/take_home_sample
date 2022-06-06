import 'package:flutter/material.dart';
import 'package:take_home/data/price_model.dart';
import 'package:take_home/repository/data_repo.dart';

class PricesProvider with ChangeNotifier {
  PricesProvider({
    required this.dataRepo,
    required this.context,
  }) {
    _getPrices();
  }

  IDataRepo dataRepo;
  BuildContext context;

  late Prices _prices;
  Prices get prices => _prices;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _getPrices() async {
    _isLoading = true;
    try {
      _prices = await dataRepo.getPrices();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
    _isLoading = false;
    notifyListeners();
  }
}
