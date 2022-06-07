import 'package:take_home/data/price_model.dart';
import 'package:take_home/network/get_data.dart';

import '../data/time_slots.dart';

abstract class IDataRepo {
  Future<String> userLogin();
  Future<Prices> getPrices();
  Future<List<TimeSlot>> getAppointmentSlots();
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

  @override
  Future<String> userLogin() {
    try {
      return getNetworkData.userLogin();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TimeSlot>> getAppointmentSlots() {
    try {
      return getNetworkData.getAppointmentSlots();
    } catch (e) {
      rethrow;
    }
  }
}
