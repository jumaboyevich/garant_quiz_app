import 'package:garant_test/core/utils/either.dart';
import 'package:garant_test/core/utils/failures.dart';
import 'package:garant_test/features/quiz/data/datasources/quiz_remote_datasource.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:garant_test/features/quiz/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  final QuizRemoteDataSource remoteDataSource;

  QuizRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<QuizEntity>>> getQuizzes() async {
    try {
      return Right((await remoteDataSource.getQuizzes())
          .map(
            (e) => e.toEntity(),
          )
          .toList());
    } catch (e) {
      return Left(ParsingFailure(e.toString()));
    }
  }
}
