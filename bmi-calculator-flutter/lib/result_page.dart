
import 'package:flutter/material.dart';
import 'button_class.dart';
import 'constants.dart';
import 'reusable_card.dart';


class Result extends StatelessWidget {
  Result({@required this.bmiResult,@required this.calcMessage,@required this.calcInterpretation});

  final String bmiResult;
  final String calcMessage;
  final String calcInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Result',
        style:kTitleTextStyle,

        ),
        ),
        ),
    Expanded(
        flex:5,
        child:ReusableCard(colour: kColorExpandedWidget,
    cardChild: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.center,


    children: <Widget>[
      Text(calcMessage,
    style: kResultTextStyle,

    ),
    Text(
    bmiResult,
    style: kBmiTextStyle,
    ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(calcInterpretation,style: kBodyTextStyle,),
      ),
    ],
    ),
        ),
        ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ],
        ),
      );
  }
}
