import 'package:flutter/material.dart';

class RepCounterWidget extends StatelessWidget {
  const RepCounterWidget(
    this.currentReps, {
    Key? key,
  }) : super(key: key);

  final int currentReps;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
        ),
        Text(
          '$currentReps',
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 60,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
