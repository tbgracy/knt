import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knt/models/exercise_model.dart';
import 'package:knt/widgets/drawer_widget.dart';
import 'package:knt/widgets/workout_tile.dart';

import '../models/counttype_enum.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final exercises = [
    Exercise(
        name: 'Squats',
        imageFilename: 'squats.png',
        countType: CountType.repetition),
    Exercise(
        name: 'Pushups',
        imageFilename: 'pushups.png',
        countType: CountType.repetition),
    Exercise(
        name: 'Body Plank',
        imageFilename: 'plank.png',
        countType: CountType.duration),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            // TODO : Open drawer
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select\nWorkout',
            style: Theme.of(context).textTheme.headline1,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: exercises.length,
            itemBuilder: (context, index) =>
                WorkoutTile(exercise: exercises[index]),
          ),
        ],
      ),
    );
  }
}
