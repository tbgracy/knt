import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knt/constants.dart';
import 'package:knt/models/exercise_model.dart';

import 'play_button_widget.dart';

class WorkoutTile extends ConsumerWidget {
  const WorkoutTile({
    super.key,
    required this.exercise,
  });

  final _height = 200.0;
  final _width = 300.0;
  final _imageBackgroundSize = 170.0;

  final Exercise exercise;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: _width,
      height: _height,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: _imageBackgroundSize,
                  height: _imageBackgroundSize,
                  decoration: BoxDecoration(
                    color: colors[3],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Image.asset(
                  '$exercisesImagePath${exercise.imageFilename}',
                  width: _imageBackgroundSize,
                  height: _imageBackgroundSize,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: PlayButtonWidget(exercise),
                ),
              ],
            ),
            Text(exercise.name),
          ],
        ),
      ),
    );
  }
}
