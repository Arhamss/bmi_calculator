import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_icons.dart';
import 'card_designs.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'bmi_calculation.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender GenderSelect;
  int height = 180;
  int weight = 30;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ItemCard(
                    cl: GenderSelect == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    card: CardDetails(
                        gender: 'MALE', GenderLogo: FontAwesomeIcons.mars),
                    onPress: () {
                      setState(() {
                        GenderSelect = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ItemCard(
                    cl: GenderSelect == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    card: CardDetails(
                        gender: 'FEMALE', GenderLogo: FontAwesomeIcons.venus),
                    onPress: () {
                      setState(() {
                        GenderSelect = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            )),
            Expanded(
              child: ItemCard(
                cl: kActiveCardColor,
                card: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kBoldTextStyle,
                        ),
                        SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Color(0xFFEB1555),
                        overlayColor: Color(0x298D8E98),
                        thumbColor: Colors.white,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                //Weight Card
                child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ItemCard(
                      cl: kActiveCardColor,
                      card: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                weight.toString(),
                                style: kBoldTextStyle,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'KG',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                ichild: FontAwesomeIcons.minus,
                                WhenPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              RoundIconButton(
                                ichild: FontAwesomeIcons.plus,
                                WhenPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    //Age card
                    child: ItemCard(
                      cl: kActiveCardColor,
                      card: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                age.toString(),
                                style: kBoldTextStyle,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'yrs',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                ichild: FontAwesomeIcons.minus,
                                WhenPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              RoundIconButton(
                                ichild: FontAwesomeIcons.plus,
                                WhenPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            BottomBarButton(
              ButtonTitle: 'CALCULATE BMI',
              onTap: () {
                bmiCalc calc = bmiCalc(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiInt: calc.GetBMI(),
                      bmiStringResult: calc.GetStringResult(),
                      bmiAdvice: calc.GetInterpret(),
                      colorResult: calc.getFcl(),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.ichild, this.WhenPressed});
  final IconData ichild;
  final Function WhenPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: WhenPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(
        ichild,
        color: Color(0xFFEB1555),
      ),
    );
  }
}
