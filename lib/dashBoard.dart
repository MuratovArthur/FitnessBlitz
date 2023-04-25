import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:php_mysql_login_register/calendar_beta.dart';
import 'reusable_card.dart';
import 'cardChild.dart';
import 'chat.dart';
import 'bmi.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile.dart';

_launchURL() async {
  const url = 'https://kaspi.kz';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class DashBoard extends StatefulWidget {
  final String name;
  final String barcode;
  final String surname;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  DashBoard(
      {Key key,
      @required this.name,
      @required this.barcode,
      this.surname,
      this.dateOfBirth,
      this.email,
      this.phoneNumber})
      : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  logout(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // navigation to dashboard page, where username variable will be equal to user.text (entered username in login form)
                  builder: (context) => Profile(
                    barcode: widget.barcode,
                    name: widget.name,
                    surname: widget.surname,
                    email: widget.email,
                    phoneNumber: widget.phoneNumber,
                    dateOfBirth: widget.dateOfBirth,
                  ),
                ),
              );
            },
          )
        ],
        backgroundColor: Color(0xFFe30017),
        title: Text(
          'Welcome ' + widget.name + '!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/blitz_logo.png',
                        ),
                      ),
                      height: 70,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarcodeWidget(
                          barcode: Barcode.isbn(drawEndChar: true),
                          data: widget.barcode,
                        ),
                      ),
                      height: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'This is your unique barcode. For more information visit www.fitnessblitz.com or call +7 708 165 6995',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      height: 70,
                    ),
                  ],
                ),
                height: 250.0,
                margin: const EdgeInsets.only(
                    bottom: 6.0), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Color(0xFFdddbdc),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ReusableCard(
                    color: Colors.white,
                    cardChild: CardChild(
                      icon: Icons.calendar_today,
                      text: 'CALENDAR',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalendarBeta(),
                        ),
                      );
                    },
                  )),
                  Expanded(
                      child: ReusableCard(
                    color: Colors.white,
                    cardChild: CardChild(
                      icon: Icons.message,
                      text: 'CHAT',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chat(),
                        ),
                      );
                    },
                  )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: ReusableCard(
                    color: Colors.white,
                    cardChild: CardChild(
                      icon: Icons.calculate,
                      text: 'BMI',
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InputPage(),
                        ),
                      );
                    },
                  )),
                  Expanded(
                      child: ReusableCard(
                    color: Colors.white,
                    cardChild: CardChild(
                      icon: Icons.money_rounded,
                      text: 'PAYMENT',
                    ),
                    onPressed: () {
                      _launchURL();
                    },
                  )),
                ],
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            logout(context);
          });
        },
        child: Icon(
          Icons.logout,
        ),
        backgroundColor: Color(0xFFe30017),
      ),
    );
  }
}
