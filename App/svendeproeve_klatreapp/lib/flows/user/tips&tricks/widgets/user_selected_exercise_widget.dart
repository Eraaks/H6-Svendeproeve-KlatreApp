import 'package:flutter/material.dart';
import 'package:svendeproeve_klatreapp/flows/app_side_bar/app_side_bar.dart';
import 'package:svendeproeve_klatreapp/flows/app_top_bar/app_top_bar.dart';
import 'package:svendeproeve_klatreapp/global/constants.dart';
import 'package:svendeproeve_klatreapp/models/exercise_model.dart';

class SelectedExercisePage extends StatefulWidget {
  final ExerciseModel exercise;
  const SelectedExercisePage({required this.exercise, super.key});

  @override
  State<SelectedExercisePage> createState() => _SelectedExercisePageState();
}

class _SelectedExercisePageState extends State<SelectedExercisePage> {
  void _setsIncrementCounter() {
    setState(() {
      widget.exercise.sets++;
    });
  }

  void _setsDecrementCounter() {
    setState(() {
      widget.exercise.sets--;
    });
  }

  void _repsIncrementCounter() {
    setState(() {
      widget.exercise.reps++;
    });
  }

  void _repsDecrementCounter() {
    setState(() {
      widget.exercise.reps--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackgroundColor,
      appBar: const Topbar(),
      drawer: const Sidebar(),
      body: Column(
        children: [
          Container(
            color: mainBackgroundColor,
            padding: const EdgeInsets.only(top: 5, left: 15),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                size: 26,
                color: topBackgroundColor,
              ),
            ),
          ),
          Text(
            widget.exercise.name,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 700,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(12),
              itemCount: 1,
              separatorBuilder: (context, index) {
                return const SizedBox(width: 12);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(widget.exercise.name);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            widget.exercise.assetLocation,
                            height: 400,
                            width: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _setsCounter(),
                            _repsCounter(),
                            const Text(
                              'Description:',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text('HowTo Link goes here:'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _setsCounter() {
    return FittedBox(
      child: Row(
        children: [
          Text('Sets: '),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => setState(() => widget.exercise.sets != 0
                ? widget.exercise.sets--
                : widget.exercise.sets),
          ),
          Text('${widget.exercise.sets}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() => widget.exercise.sets++),
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => setState(() => widget.exercise.sets = 0),
          )
        ],
      ),
    );
  }

  Widget _repsCounter() {
    return FittedBox(
      child: Row(
        children: [
          Text('Reps:'),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () => setState(() => widget.exercise.reps != 0
                ? widget.exercise.reps--
                : widget.exercise.reps),
          ),
          Text('${widget.exercise.reps}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => setState(() => widget.exercise.reps++),
          ),
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => setState(() => widget.exercise.reps = 0),
          )
        ],
      ),
    );
  }
}
