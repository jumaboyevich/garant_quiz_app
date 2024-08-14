import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/assets/constants/icons.dart';
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
          IconButton(onPressed: () {}, icon: SvgPicture.asset(AppIcons.logOut)),
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
