import 'package:bmi_calculator/card_designs.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';
import 'bmi_calculation.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {this.bmiStringResult, this.bmiInt, this.bmiAdvice, this.colorResult});

  final bmiStringResult;
  final bmiInt;
  final bmiAdvice;
  final Color colorResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
              alignment: Alignment.center,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ItemCard(
              cl: kActiveCardColor,
              card: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiStringResult,
                    style: TextStyle(
                      color: colorResult,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiInt.toString(),
                    style: kBMITextStyle,
                  ),
                  Text(bmiAdvice,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorResult,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
          ),
          BottomBarButton(
            ButtonTitle: 'RECALCULATE BMI',
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                'MainPage',
              );
            },
          ),
        ],
      ),
    );
  }
}
