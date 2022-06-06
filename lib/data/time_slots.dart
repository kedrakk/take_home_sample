class TimeSlot {
  String date;
  List<Slots> slots;

  TimeSlot({
    required this.date,
    required this.slots,
  });

  static List<TimeSlot> timeSlots = <TimeSlot>[
    TimeSlot(
      date: "2022-06-15",
      slots: <Slots>[
        Slots(
          startTime: "2022-06-15 09:15",
          endTime: "2022-06-15 09:30",
          available: false,
        ),
        Slots(
          startTime: "2022-06-15 09:30",
          endTime: "2022-06-15 09:45",
          available: true,
        ),
        Slots(
          startTime: "2022-06-15 09:45",
          endTime: "2022-06-15 10:00",
          available: true,
        ),
      ],
    ),
    TimeSlot(
      date: "2022-06-16",
      slots: <Slots>[
        Slots(
          startTime: "2022-06-16 10:00",
          endTime: "2022-06-16 10:15",
          available: true,
        ),
        Slots(
          startTime: "2022-06-16 10:15",
          endTime: "2022-06-16 10:30",
          available: true,
        ),
        Slots(
          startTime: "2022-06-16 10:30",
          endTime: "2022-06-16 10:45",
          available: true,
        ),
      ],
    ),
  ];
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
}
