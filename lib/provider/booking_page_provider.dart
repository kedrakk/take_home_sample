import 'package:flutter/material.dart';

import '../data/time_slots.dart';

class BookingPageProvider with ChangeNotifier {
  BookingPageProvider() {
    _init();
  }

  void _init() {
    _timeSlots = TimeSlot.timeSlots;
    _selectedTimeSlot = _timeSlots.isNotEmpty ? _timeSlots[0] : null;
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
