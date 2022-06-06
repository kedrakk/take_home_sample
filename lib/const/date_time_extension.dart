import 'package:intl/intl.dart';

extension ParseDateString on String {
  String toTimeOnly() {
    return DateFormat.jm().format(DateTime.parse(this)).toString();
  }

  String toMonth() {
    return DateFormat("MMM").format(DateTime.parse(this)).toString();
  }

  String toDay() {
    return DateFormat("dd").format(DateTime.parse(this)).toString();
  }
}
