import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'edit.dart';

_launchURL() async {
  const url = 'https://www.fitnessblitz.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class Profile extends StatefulWidget {
  final String name;
  final String barcode;
  final String surname;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  Profile(
      {Key key,
      @required this.name,
      @required this.barcode,
      this.surname,
      this.dateOfBirth,
      this.email,
      this.phoneNumber})
      : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Color(0xFFe30017),
        title: Text(
          'Your profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: 75.0,
                    ),
                    CircleAvatar(
                      radius: 65.0,
                      backgroundImage: AssetImage('assets/avatar.png'),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(widget.name + ' ' + widget.surname,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      widget.email,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child: Card(
                          child: Container(
                              width: 380.0,
                              height: 220.0,
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 5.0, 0, 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Personal Information",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    // navigation to dashboard page, where username variable will be equal to user.text (entered username in login form)
                                                    builder: (context) =>
                                                        EditPage(
                                                      name: widget.name,
                                                      surname: widget.surname,
                                                      phoneNumber:
                                                          widget.phoneNumber,
                                                      dateOfBirth:
                                                          widget.dateOfBirth,
                                                      email: widget.email,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Icon(Icons.edit))
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'NAME:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(widget.name + ' ' + widget.surname)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'EMAIL:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(widget.email)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'PHONE NUMBER:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(widget.phoneNumber)
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'DATE OF BIRTH:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Text(widget.dateOfBirth)
                                      ],
                                    ),
                                  ],
                                ),
                              ))),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      _launchURL();
                    },
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/bottom.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
