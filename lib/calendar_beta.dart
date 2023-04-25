import 'package:flutter/material.dart';
import 'pair.dart';

class CalendarBeta extends StatefulWidget {
  @override
  _CalendarBetaState createState() => _CalendarBetaState();
}

List<int> daysList31 = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31
];
List<int> daysList30 = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30
];
List<int> daysList29 = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29
];

List<int> daysList28 = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28
];

List<DateModel> datesData = [
  DateModel(
      monthName: 'January', daysAfter: 6, daysBefore: 5, days: daysList31),
  DateModel(
      monthName: 'February', daysAfter: 13, daysBefore: 1, days: daysList28),
  DateModel(monthName: 'March', daysAfter: 10, daysBefore: 1, days: daysList31),
  DateModel(monthName: 'April', daysAfter: 8, daysBefore: 4, days: daysList30),
  DateModel(monthName: 'May', daysAfter: 5, daysBefore: 6, days: daysList31),
  DateModel(monthName: 'June', daysAfter: 10, daysBefore: 2, days: daysList30),
  DateModel(monthName: 'July', daysAfter: 7, daysBefore: 4, days: daysList31),
  DateModel(
      monthName: 'August', daysAfter: 11, daysBefore: 0, days: daysList31),
  DateModel(
      monthName: 'September', daysAfter: 9, daysBefore: 3, days: daysList30),
  DateModel(
      monthName: 'October', daysAfter: 6, daysBefore: 5, days: daysList31),
  DateModel(
      monthName: 'November', daysAfter: 11, daysBefore: 1, days: daysList30),
  DateModel(
      monthName: 'December', daysAfter: 8, daysBefore: 3, days: daysList31),
];

class _CalendarBetaState extends State<CalendarBeta> {
  int binarySearch(List<int> arr, int searchingValue, int min, int max) {
    if (max >= min) {
      int mid = ((max + min) / 2).floor();
      // If the value of element at the middle is equal to searchingValue
      if (searchingValue == arr[mid]) {
        return mid;
      } // If element is larger than mid, then it can only be present in right subarray
      else if (searchingValue > arr[mid]) {
        return binarySearch(arr, searchingValue, mid + 1, max);
      } // If element is smaller than mid, then it can only be present in left subarray
      else if (searchingValue < arr[mid]) {
        return binarySearch(arr, searchingValue, min, mid - 1);
      }
    }
    // If there is no element that is equal to searchingValue
    return -1;
  }

  List<Color> textColor = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];

  int m = 0;

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFe30017),
          title: Text(
            'Calendar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      // print(datesData[0].monthName,
                      setState(() {
                        if (m >= 1) {
                          m = m - 1;
                        }
                      });
                    },
                  ),
                  Text(
                    datesData[m].monthName.toString(),
                    style: TextStyle(fontSize: 30.0),
                  ),
                  GestureDetector(
                    child: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      setState(() {
                        if (m <= 10) {
                          m = m + 1;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Mon',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text('Tue',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Wed',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Thu',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Fri',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Sat',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Sun',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 7,
              children: <Widget>[
                for (int i = 0; i <= datesData[m].daysBefore - 1; i++)
                  Center(
                    child: Text(
                      datesData[((m - 1) >= 0) ? m - 1 : datesData.length - 1]
                          .days[i +
                              datesData[((m - 1) >= 0)
                                      ? m - 1
                                      : datesData.length - 1]
                                  .days
                                  .length -
                              datesData[m].daysBefore]
                          .toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                for (int i = 0; i <= datesData[m].days.length - 1; i++)
                  Center(
                    child: Text(
                      datesData[m].days[i].toString(),
                      style: TextStyle(
                          color: textColor[i],
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                for (int i = 0; i <= datesData[m].daysAfter - 1; i++)
                  Center(
                    child: Text(
                      datesData[m].days[i].toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Container(
                    width: 50,
                    child: TextField(
                      style: TextStyle(fontSize: 20.0),
                      controller: myController,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    int searchedDate = int.parse(myController.text);

                    int result =
                        binarySearch(datesData[m].days, searchedDate, 0, 30);
                    setState(() {
                      for (int a = 0; a <= 30; a++) {
                        textColor[a] = Colors.black;
                      }

                      textColor[result] = Colors.green;
                    });
                  },
                  child: Text(
                    'Find!',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ]),
        ));
  }
}
