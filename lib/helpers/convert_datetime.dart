String convertDateTimeDisplay(DateTime dateTime) {
  String? month;

  switch (dateTime.month) {
    case 1:
      month = 'Jan';
      break;
    case 2:
      month = 'Feb';
    case 3:
      month = 'Mar';
      break;
    case 4:
      month = 'Apr';
    case 5:
      month = 'May';
      break;
    case 6:
      month = 'Jun';
    case 7:
      month = 'Jul';
      break;
    case 8:
      month = 'Aug';
    case 9:
      month = 'Sep';
      break;
    case 10:
      month = 'Oct';
    case 11:
      month = 'Nov';
      break;
    case 12:
      month = 'Dec';
      break;
  }

  return '$month ${dateTime.day} ${dateTime.hour}:${dateTime.minute}';
}
