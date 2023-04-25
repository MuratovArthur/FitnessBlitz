import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import of http package
import 'package:http/http.dart' as http;
import 'main.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EditPage extends StatefulWidget {
  final String name;
  final String surname;
  final String phoneNumber;
  final String dateOfBirth;
  final String email;
  EditPage(
      {Key key,
      @required this.name,
      this.surname,
      this.dateOfBirth,
      this.phoneNumber,
      this.email})
      : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = widget.name;
    surname.text = widget.surname;
    phoneNumber.text = widget.phoneNumber;
    dateOfBirth.text = widget.dateOfBirth;
  }

//style for alert text
  TextStyle redTextStyle = TextStyle(fontSize: 20, color: Colors.red);

  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7(###)###-##-##', filter: {"#": RegExp(r'[0-9]')});

  var maskFormatterDate = new MaskTextInputFormatter(mask: '####-##-##');

// asynchronous function for user registration
  Future edit() async {
    // path for register.php file
    var url = "http://127.0.0.1:8888/edit.php";
    // response from register.php, which has multiple options for json_encode
    // response may take some time, so await is used here
    var response = await http.post(url, body: {
      "name": name.text,
      "surname": surname.text,
      "phoneNumber": phoneNumber.text,
      "dateOfBirth": dateOfBirth.text,
      "email": widget.email
    });
    // decode response from register.php
    var data = json.decode(response.body);

    print(data);

    if (data == "emptyName") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.BOTTOM,
          child: Text(
            'Please enter your name',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptySurname") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.BOTTOM,
          child: Text(
            'Please enter your surname',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyPhoneNumber") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.BOTTOM,
          child: Text(
            'Please enter your phone number',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "emptyDateOfBirth") {
      FlutterToast(context).showToast(
          gravity: ToastGravity.BOTTOM,
          child: Text(
            'Please enter your date of birth',
            textAlign: TextAlign.center,
            style: redTextStyle,
          ));
    } else if (data == "nameFormatError") {
      // alert if username consists of unexpected characters
      FlutterToast(context).showToast(
          gravity: ToastGravity.BOTTOM,
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
        'Successfully updated',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Colors.green),
      ));
      Navigator.push(
        context,
        MaterialPageRoute(
          // navigation to login page
          builder: (context) => MyApp(),
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
            'Edit your data',
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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'APPLY CHANGES',
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
                        edit();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
