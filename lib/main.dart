import 'package:flutter/material.dart';
import 'package:garant_test/core/singletons/service_locator.dart';
import 'package:garant_test/features/quiz/presentation/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, fontFamily: "Golos"),
      home: QuizScreen.screen(),
    );
  }
}
