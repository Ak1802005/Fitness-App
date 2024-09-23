import 'package:flutter/material.dart';

class ExerciseRoutine2 extends StatefulWidget {
  const ExerciseRoutine2({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciseRoutineState2 createState() => _ExerciseRoutineState2();
}

class _ExerciseRoutineState2 extends State<ExerciseRoutine2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise Routine - 2 (Push - Up)'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Monday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nEasy run: 20 minutes\nCool-down: 5-minute easy jog\nPush-ups: 3 sets of 10 reps'),
          ),
          ListTile(
            title: Text('Tuesday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nInterval training: 5 rounds of 1-minute sprint and 2-minute walk\nCool-down: 5-minute easy jog\nPush-ups: 3 sets of 12 reps'),
          ),
          ListTile(
            title: Text('Wednesday'),
            subtitle: Text('Rest day'),
          ),
          ListTile(
            title: Text('Thursday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nHill repeats: 5 rounds of 1-minute uphill run and 2-minute walk\nCool-down: 5-minute easy jog\nPush-ups: 3 sets of 10 reps'),
          ),
          ListTile(
            title: Text('Friday'),
            subtitle: Text('Rest day'),
          ),
          ListTile(
            title: Text('Saturday'),
            subtitle: Text('Warm-up: 5-minute easy jog\nSteady state run: 25 minutes\nCool-down: 5-minute easy jog\nPush-ups: 3 sets of 12 reps'),
          ),
          ListTile(
            title: Text('Sunday'),
            subtitle: Text('Long slow run: 30-40 minutes\nPush-ups: 3 sets of 10 reps'),
          ),
        ],
      ),
    );
  }
}