import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app_complete/bloc/workout_cubit.dart';
import 'package:flutter_bloc_app_complete/bloc/workouts_cubit.dart';
import 'package:flutter_bloc_app_complete/models/workout.dart';
import 'package:flutter_bloc_app_complete/screens/home_page.dart';
import 'package:flutter_bloc_app_complete/states/workout_states.dart';

void main() => runApp(WorkoutTime());

class WorkoutTime extends StatelessWidget {
  const WorkoutTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Workouts',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      // home: BlocProvider<WorkoutsCubit>(
      //   create: (BuildContext context) {
      //     WorkoutsCubit workoutsCubit = WorkoutsCubit();
      //     if (workoutsCubit.state.isEmpty) {
      //       workoutsCubit.getWorkOuts();
      //     }
      //     return workoutsCubit;
      //   },
      //   child: BlocBuilder<WorkoutsCubit, List<Workout>>(
      //     builder: (context, state) {
      //       return HomePage();
      //     },
      //   ),
      // ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WorkoutsCubit>(
            create: (BuildContext context) {
              WorkoutsCubit workoutsCubit = WorkoutsCubit();
              if (workoutsCubit.state.isEmpty) {
                print('...loading json since the state is empty');
                workoutsCubit.getWorkOuts();
              } else {
                print('the state is not empty...');
              }
              return workoutsCubit;
            },
          ),
          BlocProvider<WorkoutsCubit>(
              create: (BuildContext context) => WorkoutsCubit())
        ],
        child: BlocBuilder<WorkoutCubit, WorkoutState>(
          builder: (context, state) {
            if (state is WorkoutInitial) {
              return const HomePage();
            } else if (state is WorkoutEditing) {
              return Container();
            }
            return Container();
          },
        ),
      ),
    );
  }
}
