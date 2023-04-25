import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dashBoard.dart';
import 'register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

// asynchronous function for user login
  Future login() async {
    // path for login.php file
    var url = "http://127.0.0.1:8888/login.php";
    // response from login.php, which has 2 options for json_encode
    // response may take some time, so await is used here
    var response = await http.post(url, body: {
      "email": email.text,
      "password": pass.text,
    });
    // decode response from login.php
    var data = json.decode(response.body);
    print(data);
    if (data[1] == "Success") {
      String name = data[0]["name"];
      String surname = data[0]["surname"];
      String barcode = data[0]["barcode"];
      String email = data[0]["email"];
      String phoneNumber = data[0]["phoneNumber"];
      String dateOfBirth = data[0]["dateOfBirth"];

      // if all data is valid and user with such username and password is found
      Navigator.push(
        context,
        MaterialPageRoute(
          // navigation to dashboard page, where username variable will be equal to user.text (entered username in login form)
          builder: (context) => DashBoard(
            barcode: barcode,
            name: name,
            surname: surname,
            email: email,
            phoneNumber: phoneNumber,
            dateOfBirth: dateOfBirth,
          ),
        ),
      );
    } else {
      // if there is no user with such username and password
      FlutterToast(context).showToast(
          child: Text(
        'Invalid username or password',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22, color: Colors.red),
      ));
    }
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
            'Login Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 40, 15, 40),
                child: Image.asset(
                  'assets/blitz_logo.png',
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: email,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: pass,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFECEFF1),
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFFe30017),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: Text(
                  'Don\'t have an account? Sign up',
                  style: TextStyle(
                    color: Color(0xFFe30017),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
