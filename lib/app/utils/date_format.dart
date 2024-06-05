import 'package:intl/intl.dart';

const kDateFormat = "dd MMM yyyy";
const kDateMonthFormat = "dd MMM";
const kMonthDateFormat = "MMMd";
const kDateTimeFormat = "dd MMM yyyy hh:mm a";
const kDateTimeFormatWithoutYear = "dd MMM hh:mm a";
const kDateTimeFormatWithSeconds = "dd MMM yyyy hh:mm:ss a";
const kTimeFormat = "jm";
const kDdMmYyyy = "yyyy-MM-dd";
const kDdMmYyHhMm = "dd-MM-yy HH:mm";
const kDayMmDd = "EEEE, MMM d";
const kDyMmDd = "EE, MMM d";

String formatDate(String date, {String format = kDateFormat}) {
  final parsedDate = DateTime.tryParse(date)?.toLocal();
  if (parsedDate == null) {
    return date;
  }
  return DateFormat(format).format(parsedDate);
}

Duration calculateTotalDuration(
    String startDateTimeString, String endDateTimeString) {
  // Parse the start and end date and time strings
  DateTime startDateTime =
      DateFormat('dd-MM-yy HH:mm').parse(startDateTimeString);
  DateTime endDateTime = DateFormat('dd-MM-yy HH:mm').parse(endDateTimeString);

  // Calculate the duration between the start and end date times
  Duration totalDuration = endDateTime.difference(startDateTime);

  return totalDuration;
}



String formatDuration(Duration duration) {
  List<String> parts = [];

  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);

  if (days > 0) {
    parts.add('$days ${days == 1 ? 'day' : 'days'}');
  }

  if (hours > 0) {
    parts.add('$hours ${hours == 1 ? 'hr' : 'hrs'}');
  }

  if (minutes > 0) {
    parts.add('$minutes ${minutes == 1 ? 'Min' : 'Mins'}');
  }

  return parts.isEmpty ? '0 Mins' : parts.join(', ');
}
