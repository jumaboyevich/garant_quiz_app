import 'package:garant_test/core/usecases/usecase.dart';
import 'package:garant_test/core/utils/either.dart';
import 'package:garant_test/core/utils/failures.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:garant_test/features/quiz/domain/repositories/quiz_repository.dart';

class GetQuizzesUseCase extends UseCase<List<QuizEntity>, NoParams> {
  final QuizRepository repository;

  GetQuizzesUseCase({required this.repository});
  @override
  Future<Either<Failure, List<QuizEntity>>> call(NoParams params) async {
    return await repository.getQuizzes();
  }
}
