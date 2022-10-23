import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 50;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      onPress: () =>
                          setState(() => selectedGender = Gender.male),
                      colour: selectedGender == Gender.male
                          ? kActiveCardBgColor
                          : kInactiveCardBgColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      onPress: () =>
                          setState(() => selectedGender = Gender.female),
                      colour: selectedGender == Gender.female
                          ? kActiveCardBgColor
                          : kInactiveCardBgColor,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'FEMALE',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                colour: kActiveCardBgColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kTextStyle2,
                        ),
                        const Text(
                          'cm',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kBottomConatinerBgColor,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kInActiveSliderColor,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayColor: kBottomConatinerBgColor.withAlpha(0x29),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        min: 120,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() => height = newValue.round());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      colour: kActiveCardBgColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'WEIGHT',
                            style: kTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onClick: () {
                                  if (weight > 0) {
                                    setState(() {
                                      weight--;
                                    });
                                  }
                                },
                              ),
                              SizedBox(width: 10),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onClick: () {
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
                    child: ReuseableCard(
                      colour: kActiveCardBgColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kTextStyle2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onClick: () {
                                  if (age > 0) {
                                    setState(() {
                                      age--;
                                    });
                                  }
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundedIconButton(
                                icon: FontAwesomeIcons.plus,
                                onClick: () {
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
                  )
                ],
              ),
            ),
            BottomButton(
              text: 'CALCULATE',
              onClick: () {
                BMICalculator calculator =
                    BMICalculator(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiValue: calculator.calculateBMI(),
                      bmiResult: calculator.getResult(),
                      bmiInterpretation: calculator.getInterpretation(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData.light(),
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     child: const Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
