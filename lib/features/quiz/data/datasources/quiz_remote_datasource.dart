import 'package:garant_test/features/quiz/data/models/quiz_model.dart';
import 'package:garant_test/temp/quizzes_sample_response.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuizModel>> getQuizzes();
}

class QuizRemoteDataSourceImpl extends QuizRemoteDataSource {
  QuizRemoteDataSourceImpl();

  @override
  Future<List<QuizModel>> getQuizzes() async {
    return (quizzesSampleResponse["data"] as List)
        .map((e) => QuizModel.fromJson(e))
        .toList();
  }
}
