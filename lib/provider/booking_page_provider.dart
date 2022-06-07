import 'package:flutter/material.dart';
import 'package:take_home/repository/data_repo.dart';

import '../data/time_slots.dart';

class BookingPageProvider with ChangeNotifier {
  BookingPageProvider({
    required this.dataRepo,
    required this.context,
  }) {
    _init();
  }

  IDataRepo dataRepo;
  BuildContext context;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _init() async {
    _isLoading = true;
    try {
      _timeSlots = await dataRepo.getAppointmentSlots();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
    _isLoading = false;
    _selectedTimeSlot = _timeSlots.isNotEmpty ? _timeSlots[0] : null;
    notifyListeners();
    //_timeSlots = TimeSlot.timeSlots;
  }

  late List<TimeSlot> _timeSlots;

  List<TimeSlot> get timeSlots => _timeSlots;

  void setTimeSlots(List<TimeSlot> timeSlots) {
    _timeSlots = timeSlots;
    _selectedTimeSlot = _timeSlots.isNotEmpty ? _timeSlots[0] : null;
    notifyListeners();
  }

  TimeSlot? _selectedTimeSlot;
  TimeSlot? get selectedTimeSlot => _selectedTimeSlot;

  void setSelectedTimeSlot(TimeSlot? timeSlot) {
    _selectedTimeSlot = timeSlot;
    _selectedSlot = null;
    notifyListeners();
  }

  Slots? _selectedSlot;
  Slots? get selectedSlot => _selectedSlot;

  void setSelectedSlot(Slots? slot) {
    _selectedSlot = slot;
    notifyListeners();
  }
}
