import 'package:flutter/material.dart';
import 'package:knt/models/exercise_model.dart';

import '../constants.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget(
    this.exercise, {
    Key? key,
  }) : super(key: key);

  final Exercise exercise;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.play_arrow,
            color: colors[0],
          ),
        ],
      ),
    );
  }
}
