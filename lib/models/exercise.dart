import 'package:equatable/equatable.dart';

class Excercise extends Equatable {
  final String? title;
  final int? prelude;
  final int? duration;
  final int? index;
  final int startTime;

  Excercise({
    required this.title,
    required this.prelude,
    required this.duration,
    required this.index,
    required this.startTime,
  });

  factory Excercise.fromJson(
    Map<String, dynamic> json,
    int index,
    int startTime,
  ) =>
      Excercise(
        title: json["title"],
        prelude: json["prelude"],
        duration: json["duration"],
        index: index,
        startTime: startTime,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "prelude": prelude,
        "duration": duration,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [title, prelude, duration, index, startTime];
  @override
  bool get stringify => true;
}
