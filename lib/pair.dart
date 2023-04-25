import 'package:meta/meta.dart';

class DateModel {
  String monthName;
  List<int> days;
  int daysBefore;
  int daysAfter;

  DateModel({
    @required this.monthName,
    @required this.days,
    @required this.daysBefore,
    @required this.daysAfter,
  });
}
