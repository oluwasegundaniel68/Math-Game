import 'package:flutter/material.dart';

import 'constants.dart';

class MyButton extends StatelessWidget {
  final String child;
  final VoidCallback onTap;
  var buttonColor =   Colors.deepPurple[400];

   MyButton({super.key,
    required this.child,
     required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    if (child == 'C'){
      buttonColor = Colors.green;
    } else if (child == 'DEL'){
      buttonColor = Colors.red;
    } else if(child == '='){
      buttonColor = Colors.deepPurple;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:BorderRadius.circular(6)
          ),
          child: Center(
            child: Text(
              child,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
