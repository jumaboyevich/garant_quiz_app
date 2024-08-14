import 'package:garant_test/core/utils/either.dart';
import 'package:garant_test/core/utils/failures.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<QuizEntity>>> getQuizzes();
}
