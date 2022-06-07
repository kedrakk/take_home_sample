class TimeSlot {
  String date;
  List<Slots> slots;

  TimeSlot({
    required this.date,
    required this.slots,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> data) {
    final date = data['date'] as String;
    var tempSlots = <Slots>[];
    if (data['slots'] != null) {
      data['slots'].forEach((v) {
        tempSlots.add(
          Slots.fromJson(v),
        );
      });
    }
    return TimeSlot(
      date: date,
      slots: tempSlots,
    );
  }
}

class Slots {
  String startTime;
  String endTime;
  bool available;

  Slots({
    required this.startTime,
    required this.endTime,
    required this.available,
  });

  factory Slots.fromJson(Map<String, dynamic> json) {
    final startTime = json['start_time'] as String;
    final endTime = json['end_time'] as String;
    final available = json['available'] as bool;
    return Slots(
      startTime: startTime,
      endTime: endTime,
      available: available,
    );
  }
}
