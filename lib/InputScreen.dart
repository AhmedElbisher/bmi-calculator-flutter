import 'package:bmi_calculator/CalculatorBrain.dart';
import 'package:bmi_calculator/ResultScrean.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'BottomButton.dart';
import 'Constants.dart';
import 'GenderCard.dart';
import 'ReusableCard.dart';
import 'RoundButton.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  double height = 180;
  int weight = 60;
  int age = 29;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 11,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                gender = Gender.male;
                              });
                            },
                            colour: gender == Gender.male
                                ? KCheckCardColor
                                : KUncheckCardColor,
                            customChild: GenderCard(
                              genderIcon: FontAwesomeIcons.mars,
                              genderString: "MALE",
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                                gender = Gender.female;
                              });
                            },
                            colour: gender == Gender.female
                                ? KCheckCardColor
                                : KUncheckCardColor,
                            customChild: GenderCard(
                              genderIcon: FontAwesomeIcons.venus,
                              genderString: "FEMALE",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: ReusableCard(
                        colour: KCheckCardColor,
                        customChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "HIGHT",
                              style: KNormalTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  (height.toInt()).toString(),
                                  style: KSuperTextStyle,
                                ),
                                Text(
                                  "cm",
                                  style: KNormalTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Colors.grey,
                                overlayColor: Color(0x29D4486A),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                thumbColor: KBottomContainerColor,
                                overlayShape: RoundSliderOverlayShape(
                                    overlayRadius: 15.0),
                              ),
                              child: Slider(
                                value: height,
                                onChanged: (double currheight) {
                                  setState(() {
                                    height = currheight;
                                  });
                                },
                                min: 120.0,
                                max: 220.0,
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            colour: KCheckCardColor,
                            customChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "WEIGHT",
                                  style: KNormalTextStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: KSuperTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    RoundButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            colour: KCheckCardColor,
                            customChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Age",
                                  style: KNormalTextStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: KSuperTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    RoundButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomButton(
              text: "CALCULATE YOUR BMI",
              onPressed: () {
                CalculatorBrain cal =
                    CalculatorBrain(weight: weight, height: height.toInt());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScrean(
                              bmi: cal.calculatrBMI(),
                              resultString: cal.getResultString(),
                              resultSummary: cal.getResultSummary(),
                            )));
              },
            ),
          )
        ],
      ),
    );
  }
}
