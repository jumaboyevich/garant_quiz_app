// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class QuizResultEntity extends Equatable {
  final int totalQuestions;
  final int totalBall;
  final int correctAnswers;
  final int incorrectAnswers;
  final int totalTime;
  final int spendedTime;

  const QuizResultEntity({
    this.totalQuestions = 0,
    this.totalBall = 0,
    this.correctAnswers = 0,
    this.incorrectAnswers = 0,
    this.totalTime = 0,
    this.spendedTime = 0,
  });

  String get calculateSpendedTime => formattedTime(timeInSecond: spendedTime);

  String get calculateTotalTime => formattedTime(timeInSecond: totalTime);

  String formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
  }

  @override
  List<Object> get props {
    return [
      totalQuestions,
      totalBall,
      correctAnswers,
      incorrectAnswers,
      totalTime,
      spendedTime,
    ];
  }
}
