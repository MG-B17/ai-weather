String mapDateToDayName({required String date}) {
  DateTime dateTime = DateTime.parse(date);
  List<String> daysOfWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  String dayName = daysOfWeek[dateTime.weekday % 7];
  return dayName;
}