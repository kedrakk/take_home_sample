import 'dart:convert';

import 'package:take_home/const/string_consts.dart';

import '../data/price_model.dart';
import 'package:http/http.dart' as http;

abstract class IGetNetworkData {
  Future<Prices> getPrices();
}

class GetNetworkData implements IGetNetworkData {
  @override
  Future<Prices> getPrices() async {
    try {
      final response = await http.get(Uri.parse(Apis.getPrices));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prices = Prices.fromJson(data);
        return prices;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
