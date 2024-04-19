import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc_app_complete/models/workout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsCubit extends Cubit<List<Workout>> {
  WorkoutsCubit() : super([]);

  getWorkOuts() async {
    final List<Workout> workouts = [];
    final workOutJson =
        jsonDecode(await rootBundle.loadString('assets/workouts.json'));
    for (var el in workOutJson as Iterable) {
      workouts.add(Workout.fromJson(el));
    }
    emit(workouts);
  }
}
