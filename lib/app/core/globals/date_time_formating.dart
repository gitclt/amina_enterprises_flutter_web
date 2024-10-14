import 'package:intl/intl.dart';

String convertDateFormat(String inputDate) {
  List<String> parts = inputDate.split("-");
  String year = parts[0];
  String month = parts[1];
  String day = parts[2];

  return "$day-$month-$year";
}

String? convert2DateFormat(DateTime? inputDate) {
  if (inputDate == null) return '';
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final String formatted = formatter.format(inputDate);

  return formatted;
}

String? convertDateToTimeFormat(DateTime? inputDate) {
  if (inputDate == null) return '';
  final DateFormat formatter = DateFormat.jm();
  final String formatted = formatter.format(inputDate);

  return formatted;
}

String formatDateString(String inputDateString) {
  DateTime dateTime = DateTime.parse(inputDateString);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}

String? convert2DateFormat1(DateTime? inputDate) {
  if (inputDate == null) return '';
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(inputDate);

  return formatted;
}

String dateFormatString(String inputDateString) {
  DateTime dateTime = DateTime.parse(inputDateString);
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

String convertTimeFormat(String inputTime) {
  List<String> parts = inputTime.split(":");
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);

  String period = "AM";

  if (hour >= 12) {
    period = "PM";
    if (hour > 12) {
      hour -= 12;
    }
  }
  return "$hour:$minute $period";
}

String convertUnixTimestampToDate(int timestamp) {
  // Convert Unix timestamp to DateTime
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();

  // Create a DateFormat to format the DateTime into a string
  DateFormat formatter = DateFormat('dd-MM-yyyy');

  // Return the formatted date
  return formatter.format(date);
}

String convertUnixTimestampToTime(int timestamp) {
  // Convert Unix timestamp to DateTime
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp).toLocal();

  // Create a DateFormat to format the DateTime into a string
  DateFormat formatter = DateFormat('hh:mm a');

  // Return the formatted time
  return formatter.format(date);
}
