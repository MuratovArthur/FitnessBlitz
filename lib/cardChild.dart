import 'package:flutter/material.dart';

class CardChild extends StatelessWidget {
  final IconData icon;
  final String text;

  CardChild({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Color(0xFFe30017),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: Color(0xFFe30017),
          ),
        )
      ],
    );
  }
}
