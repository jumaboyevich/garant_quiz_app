import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/assets/constants/icons.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:garant_test/features/quiz/presentation/pages/quiz_complete_dialog.dart';
import 'package:garant_test/features/quiz/presentation/widgets/timer_bar.dart';

class QuizAppBar extends StatelessWidget {
  const QuizAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      height: 52,
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => BlocProvider.value(
                    value: context.read<QuizBloc>(),
                    child: const QuizCompleteDialog(),
                  ),
                );
              },
              icon: SvgPicture.asset(AppIcons.logOut)),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.messagesCaution)),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AppIcons.nightMode)),
          const TimerBar()
        ],
      ),
    );
  }
}
