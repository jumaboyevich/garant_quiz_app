part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GetQuizzesEvent extends QuizEvent {
  const GetQuizzesEvent();
}

class SetQuizAnswerEvent extends QuizEvent {
  final int index;
  final QuizEntity item;
  final OptionEntity selectedOption;
  const SetQuizAnswerEvent(
      {required this.index, required this.item, required this.selectedOption});
}

class SetSpendedTimeEvent extends QuizEvent {
  final int time;
  const SetSpendedTimeEvent({
    required this.time,
  });
}
