import 'package:flutter_bloc_app_complete/models/exercise.dart';
import 'package:equatable/equatable.dart';

class Workout extends Equatable {
  Workout({
    required this.title,
    required this.exercises,
  });
  final String? title;
  final List<Excercise> exercises;
  factory Workout.fromJson(Map<String, dynamic> json) {
    List<Excercise> exercises = [];
    int index = 0;
    int startTime = 0;
    for (var ex in json['exercises'] as Iterable) {
      exercises.add(Excercise.fromJson(ex, index, startTime));
      index++;
      startTime += exercises.last.prelude! + exercises.last.duration!;
    }
    return Workout(title: json['title'] as String?, exercises: exercises);
  }
  Map<String, dynamic> toJson() => {'title': title, 'exercises': exercises};

  @override
  // TODO: implement props
  List<Object?> get props => [title, exercises];

  @override
  bool get stringify => true;
}
