import 'package:flutter/material.dart';
import 'constants.dart';

class BottomBarButton extends StatelessWidget {
  BottomBarButton({this.onTap, this.ButtonTitle});

  final Function onTap;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomCardColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomBarHeight,
        child: Center(
          child: Text(ButtonTitle,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
