import 'package:intl/intl.dart';

String formateData(String date) {
  return DateFormat("MMMM dd,yyyy").format(DateTime.parse(date));
}
