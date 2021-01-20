import 'dart:ui';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_page.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'result_page.dart';
import 'button_class.dart';
import 'round_button.dart';
import 'calculator_brain.dart';
enum Gender{
  male,female,
}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height=180;
  int weight=60;
  int age=20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:ReusableCard(
                onPress:(){
                  setState(() {
                    gender=Gender.male;
                  });
                },
                colour: gender==Gender.male ? kColorExpandedWidget : kInactiveColor,
                cardChild: IconContent(icon:FontAwesomeIcons.mars,label:'MALE'),
              ),
              ),
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    gender=Gender.female;
                  });
                },
                colour: gender==Gender.female ? kColorExpandedWidget : kInactiveColor,
                  cardChild: IconContent(icon:FontAwesomeIcons.venus,label:'FEMALE'),
              ),
              ),
            ],
          ),),
          Expanded(child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style:kSty),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(height.toString(),style:kNumberTextStyle),
                    Text('cm',style:kSty)
                  ],
                ),
                SliderTheme(
                  data:SliderTheme.of(context).copyWith(
                   overlayShape: RoundSliderOverlayShape (overlayRadius: 30.0),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x15EB1555),
                    activeTrackColor: Color(0xFFFFFFFF),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max:220.0,
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            colour: kColorExpandedWidget,
          ),
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: kColorExpandedWidget,
              cardChild: Column(
                children: <Widget>[
              Text(
                'WEIGHT',style:kSty,
              ),
                  Text(
                    weight.toString(),style:kNumberTextStyle,
                  ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RoundIconButton(icon:FontAwesomeIcons.plus,onPressed:
        (){
        setState(() {
          weight++;
        });
        },
        ),
    SizedBox(
    width:10.0,
    ),
   RoundIconButton(icon:FontAwesomeIcons.minus,onPressed: (){
   setState(() {
     weight--;
   });
   },
   ),
      ],
    ),

                ],
              ),),
              ),
              Expanded(child: ReusableCard(colour:kColorExpandedWidget,
              cardChild: Column(
                children: <Widget>[
                  Text('AGE',style:kSty,
                  ),
                  Text(age.toString(),style: kNumberTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon:FontAwesomeIcons.minus,onPressed: (){
                        setState(() {
                          age--;
                        });
                      },),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIconButton(icon:FontAwesomeIcons.plus,onPressed: (){
                        setState(() {
                          age++;
                        });
                      },)
                    ],
                  ),
                ],
              ),),
              ),
            ],
          ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap:(){
              CalculatorBrain calc =CalculatorBrain(height:height,weight: weight );
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Result(
                  bmiResult: calc.calculateBMI(),
                  calcMessage: calc.getResults(),
                  calcInterpretation: calc.getInterpretation(),
                ),
                ),
                );
              },
          ),
        ],
      ),
    );
  }
}







