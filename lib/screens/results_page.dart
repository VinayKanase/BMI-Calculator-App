import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key,
      required this.bmiValue,
      required this.bmiResult,
      required this.bmiInterpretation})
      : super(key: key);
  final String bmiValue;
  final String bmiResult;
  final String bmiInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTextStyle2,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ReuseableCard(
                colour: kActiveCardBgColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiResult,
                      style: kTextStyle4,
                    ),
                    Text(
                      bmiValue,
                      style: kTextStyle5,
                    ),
                    Text(
                      bmiInterpretation,
                      style: kTextStyle.copyWith(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            onClick: () {
              Navigator.pop(context);
            },
            text: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
