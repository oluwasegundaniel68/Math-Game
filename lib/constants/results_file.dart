import 'package:flutter/material.dart';

import 'constants.dart';

class ResultMessage extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  final icon;

  const ResultMessage({super.key,
    required this.message,
    required this.onTap,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(message,
              style: whiteTextStyle,
            ),

            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[300]
                ),
                child: Center(
                  child: Icon(icon,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );();
  }
}
