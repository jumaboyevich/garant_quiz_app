import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:garant_test/core/usecases/usecase.dart';
import 'package:garant_test/core/utils/failures.dart';
import 'package:garant_test/features/quiz/domain/entities/option_entity.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:garant_test/features/quiz/domain/use_cases/get_quizzes_usecase.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetQuizzesUseCase getQuizzesUseCase;

  QuizBloc({required this.getQuizzesUseCase}) : super(QuizState.initial()) {
    on<GetQuizzesEvent>(getGetQuizzes);
    on<SetQuizAnswerEvent>(setQuizAnswer);
    on<SetSpendedTimeEvent>(setSpendedTime);
  }

  Future<void> getGetQuizzes(
      GetQuizzesEvent event, Emitter<QuizState> emit) async {
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    final result = await getQuizzesUseCase(NoParams());

    if (result.isRight) {
      emit(state.copyWith(
        status: FormzSubmissionStatus.success,
        data: result.right,
      ));
    } else {
      emit(state.copyWith(
          status: FormzSubmissionStatus.failure, message: result.left));
    }
  }

  void setQuizAnswer(SetQuizAnswerEvent event, Emitter<QuizState> emit) async {
  
      List<QuizEntity> items = state.data;

      items.removeAt(event.index);
      items.insert(event.index, event.item.copyWith(selectedItem: event.selectedOption));

      emit(state.copyWith(data: items));
  }

  void setSpendedTime(SetSpendedTimeEvent event, Emitter<QuizState> emit) async {
  
      emit(state.copyWith(spendedTime: event.time));
  }
}
