import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:take_home/const/string_consts.dart';
import 'package:take_home/data/time_slots.dart';

import '../data/price_model.dart';
import 'package:http/http.dart' as http;

abstract class IGetNetworkData {
  Future<Prices> getPrices();
  Future<String> userLogin();
  Future<List<TimeSlot>> getAppointmentSlots();
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

  @override
  Future<String> userLogin() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final value = await auth.signInAnonymously();
      return value.user!.uid;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<TimeSlot>> getAppointmentSlots() async {
    try {
      final response = await http.get(Uri.parse(Apis.getSlots));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final timeSlots =
            List<TimeSlot>.from(data.map((x) => TimeSlot.fromJson(x)));
        return timeSlots;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
