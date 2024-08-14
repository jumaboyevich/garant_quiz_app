part of 'quiz_bloc.dart';

class QuizState {
  final FormzSubmissionStatus status;
  final Failure? message;
  final List<QuizEntity> data;
  final int spendedTime;
  final int totalTime;

  QuizState._({
    this.status = FormzSubmissionStatus.initial,
    this.message,
    this.data = const [],
    this.spendedTime = 0,
    this.totalTime = 1200,
  });

  QuizState.initial() : this._();

  QuizState copyWith(
      {FormzSubmissionStatus? status,
      Failure? message,
      List<QuizEntity>? data,
      int? spendedTime,
      int? totalTime}) {
    return QuizState._(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
      spendedTime: spendedTime ?? this.spendedTime,
      totalTime: totalTime ?? this.totalTime,
    );
  }
}
