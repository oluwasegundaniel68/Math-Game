import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_game/constants/constants.dart';
import 'package:math_game/constants/number_pad.dart';
import 'package:math_game/constants/results_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];

  int numberA =1;
  int numberB =1;

  String userAnswer = '';
  void buttonTapped(String button){
    setState(() {
      if(button == '='){
        checkResult();
      }
      else if (button == 'C'){
        userAnswer = '';
      }else if(button == 'DEL'){
        if(userAnswer.isNotEmpty)
          userAnswer = userAnswer.substring(0, userAnswer.length-1);
      }else if(userAnswer.length <3 ){
        userAnswer +=  button;
      }

    });
  }
  void checkResult(){
    if(numberA + numberB == int.parse(userAnswer) ){
      showDialog(context: context, builder: (context){
        return ResultMessage(
            message: 'Correct!',
            onTap: goToNextQuestion,
            icon: Icons.arrow_forward
        );
      });
    }
    else{
      showDialog(context: context, builder: (context){
        return ResultMessage(
            message: 'Try Again OLODO',
            onTap: goBackToQuestion,
            icon: Icons.rotate_left);
      });
    }
  }
  var randomNumber = Random();
  void goToNextQuestion(){
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
    });

    numberA = randomNumber.nextInt(100);
    numberB = randomNumber.nextInt(100);
  }

  void goBackToQuestion(){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[300],
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('MATH QUIZ',
                        style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Center(
                        child: Icon(Icons.calculate_outlined,
                          size: 44,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              height: 160,
              color: Colors.deepPurple,
            ),
            Expanded(
                child: Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(numberA.toString() + ' + ' + numberB.toString() + ' = ',
                          style: whiteTextStyle,
                        ),

                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[400],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(userAnswer,
                              style: whiteTextStyle,
                            ),
                          ) ,
                        )
                      ],
                    ),
                  ),
                )
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  itemCount: numberPad.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return MyButton(onTap:() => buttonTapped(numberPad[index]),
                        child: numberPad[index]);
                  },
                ),
              ),
            ),
          ],
        )
    );
  }
}