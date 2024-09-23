// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ExerciseRoutine3 extends StatefulWidget {
  const ExerciseRoutine3({super.key});

  @override
  _ExerciseRoutineState3 createState() => _ExerciseRoutineState3();
}

class _ExerciseRoutineState3 extends State<ExerciseRoutine3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Routine - 3 (Leg Extension)'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Monday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nEasy run: 20 minutes\nCool-down: 5-minute easy jog\nSquats: 3 sets of 10 reps\nLunges: 3 sets of 10 reps (per leg)'),
          ),
          ListTile(
            title: Text('Tuesday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nInterval training: 5 rounds of 1-minute sprint and 2-minute walk\nCool-down: 5-minute easy jog\nLeg Press: 3 sets of 12 reps\nCalf Raises: 3 sets of 15 reps'),
          ),
          ListTile(
            title: Text('Wednesday'),
            subtitle: Text('Rest day'),
          ),
          ListTile(
            title: Text('Thursday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nHill repeats: 5 rounds of 1-minute uphill run and 2-minute walk\nCool-down: 5-minute easy jog\nDeadlifts: 3 sets of 10 reps\nLeg Extensions: 3 sets of 12 reps'),
          ),
          ListTile(
            title: Text('Friday'),
            subtitle: Text('Rest day'),
          ),
          ListTile(
            title: Text('Saturday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nSteady state run: 25 minutes\nCool-down: 5-minute easy jog\nLeg Press: 3 sets of 12 reps\nCalf Raises: 3 sets of 15 reps'),
          ),
          ListTile(
            title: Text('Sunday'),
            subtitle: Text('Long slow run: 30-40 minutes\nSquats: 3 sets of 10 reps\nLunges: 3 sets of 10 reps (per leg)'),
          ),
        ],
      ),
    );
  }
}