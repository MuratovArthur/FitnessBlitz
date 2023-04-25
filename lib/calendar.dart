import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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

  List<int> dates = [
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

  final myController = TextEditingController();
  Color row1color = Colors.black;
  Color row2color = Colors.black;
  Color row3color = Colors.black;
  Color row4color = Colors.black;
  Color row5color = Colors.black;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void reSearch() {
    setState(() {
      row1color = Colors.black;
      row2color = Colors.black;
      row3color = Colors.black;
      row4color = Colors.black;
      row5color = Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        new TextEditingController().clear();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFe30017),
          title: Text(
            'Calendar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Mon',
                    style: TextStyle(
                        color: Colors.pink[200],
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text('Tue',
                      style: TextStyle(
                          color: Colors.pink[200],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Wed',
                      style: TextStyle(
                          color: Colors.pink[200],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Thu',
                      style: TextStyle(
                          color: Colors.pink[200],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Fri',
                      style: TextStyle(
                          color: Colors.pink[200],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Sat',
                      style: TextStyle(
                          color: Colors.pink[200],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  Text('Sun',
                      style: TextStyle(
                          color: Colors.pink[200],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 1; i < 8; i++)
                    Text(
                      i.toString(),
                      style: TextStyle(color: row1color, fontSize: 20.0),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 8; i < 15; i++)
                    Text(
                      i.toString(),
                      style: TextStyle(color: row2color, fontSize: 20.0),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 15; i < 22; i++)
                    Text(
                      i.toString(),
                      style: TextStyle(color: row3color, fontSize: 20.0),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 22; i < 29; i++)
                    Text(
                      i.toString(),
                      style: TextStyle(color: row4color, fontSize: 20.0),
                    )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Row(
                  children: [
                    for (int i = 29; i <= dates.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Text(
                          i.toString(),
                          style: TextStyle(color: row5color, fontSize: 20.0),
                        ),
                      )
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 0),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: 50,
                      child: TextField(
                        style: TextStyle(fontSize: 20.0),
                        controller: myController,
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.pink[200]),
                      onPressed: () {
                        // when button is pressed
                        // searchedDate is value from input form parsed to integer
                        int searchedDate = int.parse(myController.text);

                        // index of element equal to searchedDate
                        int result = binarySearch(dates, searchedDate, 0, 30);

                        // if statement to identify the location of index in rows (weeks)
                        if (result > -1 && result < 7) {
                          setState(() {
                            reSearch();
                            // color change to green
                            row1color = Colors.green;
                          });
                        } else if (result > 6 && result < 14) {
                          setState(() {
                            reSearch();
                            row2color = Colors.green;
                          });
                        } else if (result > 13 && result < 21) {
                          setState(() {
                            reSearch();
                            row3color = Colors.green;
                          });
                        } else if (result > 20 && result < 28) {
                          setState(() {
                            reSearch();
                            row4color = Colors.green;
                          });
                        } else if (result > 27 && result < 30) {
                          setState(() {
                            reSearch();
                            row5color = Colors.green;
                          });
                        } else if (result == -1) {
                          setState(() {
                            reSearch();
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // Retrieve the text the user has entered by using the
                                  // TextEditingController.
                                  content: Text(
                                    'Not found!',
                                    style: TextStyle(color: Color(0xFFe30017)),
                                  ),
                                );
                              },
                            );
                          });
                        }
                      },
                      child: Text(
                        'Find!',
                        style: TextStyle(fontSize: 20),
                      ))
                ])),
          ],
        ),
      ),
    );
  }
}
