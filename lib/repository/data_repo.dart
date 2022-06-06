import 'package:take_home/data/price_model.dart';
import 'package:take_home/network/get_data.dart';

abstract class IDataRepo {
  Future<Prices> getPrices();
}

class DataRepo implements IDataRepo {
  IGetNetworkData getNetworkData;
  DataRepo({required this.getNetworkData});

  @override
  Future<Prices> getPrices() {
    try {
      return getNetworkData.getPrices();
    } catch (e) {
      rethrow;
    }
  }
}
