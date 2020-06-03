import 'package:bmi_calculator/BottomButton.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/material.dart';

class ResultScrean extends StatelessWidget {
  ResultScrean(
      {@required this.bmi,
      @required this.resultString,
      @required this.resultSummary});
  final String bmi;
  final String resultString;
  final String resultSummary;

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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(
                child: Text(
                  "RESULT",
                  style: KResultTitle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ReusableCard(
                colour: KCheckCardColor,
                customChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultString,
                      style: KResultType,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      bmi,
                      style: KResultNumber,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      resultSummary,
                      style: KResultSammary,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: BottomButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: "RE-CALCULATE YOUR BMI",
            ),
          )
        ],
      ),
    );
  }
}
