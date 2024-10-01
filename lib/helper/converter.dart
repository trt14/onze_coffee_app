String? formatDate(String? dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString!);
  // Format date as YYYY-MM-DD
  return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
}

String? formatTime(String? dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString!);
  // Format time as HH:MM:SS
  return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
}
