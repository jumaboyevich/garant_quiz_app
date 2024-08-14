import 'package:garant_test/core/singletons/service_locator.dart';
import 'package:garant_test/features/quiz/data/datasources/quiz_remote_datasource.dart';
import 'package:garant_test/features/quiz/data/repositories/quiz_repository_impl.dart';
import 'package:garant_test/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:garant_test/features/quiz/domain/use_cases/get_quizzes_usecase.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';

initQuizInjections() {
  //Quizzes
  serviceLocator.registerSingleton<QuizRemoteDataSource>(
      QuizRemoteDataSourceImpl());
  serviceLocator.registerSingleton<QuizRepository>(
      QuizRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerSingleton<GetQuizzesUseCase>(
      GetQuizzesUseCase(repository: serviceLocator()));
  serviceLocator.registerFactory<QuizBloc>(
    () => QuizBloc(getQuizzesUseCase: serviceLocator()),
  );
 }
