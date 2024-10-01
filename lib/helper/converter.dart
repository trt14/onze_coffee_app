DateTime formatDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  // Format date as YYYY-MM-DD
  return dateTime;
  // return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
}

DateTime formatTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  // Format time as HH:MM:SS
  return dateTime;
  // return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
}
