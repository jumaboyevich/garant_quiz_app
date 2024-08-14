import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/core/singletons/service_locator.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:garant_test/features/quiz/presentation/pages/quiz_page.dart';
import 'package:garant_test/features/quiz/presentation/widgets/quiz_app_bar.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static Widget screen() {
    return BlocProvider(
      create: (context) =>
          serviceLocator<QuizBloc>()..add(const GetQuizzesEvent()),
      child: const QuizScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayHexF1F3F7,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            const QuizAppBar(),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: BlocBuilder<QuizBloc, QuizState>(
                // buildWhen: (previous, current) => previous.status!=current.status || previous.data!=current.data,
                builder: (context, state) {
                  if (state.status.isInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.status.isFailure) {
                    return Center(
                      child: Text(state.message!.errorMessage),
                    );
                  }
                  if (state.status.isSuccess) {
                    return QuizPage(
                      items: state.data,
                    );
                  }
                  return const Center();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
