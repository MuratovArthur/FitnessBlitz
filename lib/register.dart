import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import of http package
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

//style for alert text
  TextStyle redTextStyle = TextStyle(fontSize: 20, color: Colors.red);

  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7(###)###-##-##', filter: {"#": RegExp(r'[0-9]')});

  var maskFormatterDate = new MaskTextInputFormatter(mask: '####-##-##');

// asynchronous function for user registration
  Future register() async {
    print(name.text);
    print(surname.text);
    print(email.text);
    print(phoneNumber.text);
    print(dateOfBirth.text);
    print(password.text);
    print(passwordConfirm.text);

    // path for register.php file
    var url = "http://127.0.0.1:8888/register.php";
    // response from register.php, which has multiple options for json_encode
    // response may take some time, so await is used here
    var response = await http.post(url, body: {
      "name": name.text,
      "surname": surname.text,
      "email": email.text,
      "phoneNumber": phoneNumber.text,
      "dateOfBirth": dateOfBirth.text,
      "password": password.text,
      "passwordConfirm": passwordConfirm.text,
    });
    // decode response from register.php
    var data = json.decode(response.body);

    print(data);

    if (data == "userAlreadyExist") {
      // alert if there is already a user with entered username
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'This email is already used',
            style: redTextStyle,
          ));
    } else if (data == "emptyName") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please enter your name',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptySurname") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please enter your surname',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyEmail") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please enter your email',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "notValidEmail") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Email is not valid',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyPhoneNumber") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please enter your phone number',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyDateOfBirth") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please enter your date of birth',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyPassword") {
      // alert if password is empty
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please enter your password',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyPasswordConfirm") {
      // alert if password is empty
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Please confirm your password',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "passwordsDoNotMatch") {
      // alert if password is empty
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Passwords do not match',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "nameFormatError") {
      // alert if username consists of unexpected characters
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Use only alphabetic characters for your name',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "surnameFormatError") {
      // alert if username consists of unexpected characters
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Use only alphabetic characters for your surname',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "passwordLengthError") {
      // alert if password is too short
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Password must have at least 5 characters',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "InvalidDateOfBirth") {
      // alert if password is too short
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Date of birth does not match the format',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "InvalidPhoneNumber") {
      // alert if password is too short
      FlutterToast(context).showToast(
          gravity: ToastGravity.TOP,
          child: Text(
            'Phone number does not match the format',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "success") {
      // if all entered data is valid
      FlutterToast(context).showToast(
          child: Text(
        'Successful registration',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.green),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(
          // navigation to login page
          builder: (context) => MyHomePage(),
        ),
      );
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
            'Registration Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Surname',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: surname,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                inputFormatters: [maskFormatter],
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: phoneNumber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                inputFormatters: [maskFormatterDate],
                decoration: InputDecoration(
                  labelText: 'Date of birth (YYYY-MM-DD)',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: dateOfBirth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: password,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                controller: passwordConfirm,
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
                          'REGISTER',
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
                        register();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        MyHomePage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(-1.0, 0.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ));
                },
                child: Text(
                  'Already have an account? Sign in',
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
