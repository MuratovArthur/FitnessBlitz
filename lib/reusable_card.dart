import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPressed;

  ReusableCard({@required this.color, this.cardChild, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 180,
        child: cardChild,
        margin: EdgeInsets.fromLTRB(15, 15, 15, 5),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Color(0xFFe30017))),
      ),
    );
  }
}
