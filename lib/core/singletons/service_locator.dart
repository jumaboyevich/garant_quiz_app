import 'dart:async';

import 'package:garant_test/features/quiz/quiz_injections.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  initQuizInjections();
}
