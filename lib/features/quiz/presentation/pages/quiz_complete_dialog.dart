import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/assets/constants/icons.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_result_entity.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:garant_test/features/quiz/presentation/pages/quiz_result_page.dart';

class QuizCompleteDialog extends StatelessWidget {
  const QuizCompleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 18),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          backgroundColor: white,
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppIcons.caution),
                const SizedBox(
                  height: 18,
                ),
                const Text(
                  "Haqiqatda ham testni\nyakunlashni hohlaysizmi?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: grayHex8192A5),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  "Belgilanmagan test javoblari\nxato deb hisobga olinadi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: grayHex8192A5),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    calcelButton(context),
                    const SizedBox(
                      width: 12,
                    ),
                    completeButton(context)
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget calcelButton(BuildContext context) => Expanded(
        child: Material(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          color: grayHexF1F3F7,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Text(
                "Qaytish",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: grayHex8192A5,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      );

  Widget completeButton(BuildContext context) => Expanded(
        child: Material(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          color: flamingo,
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onTap: () {
              List<QuizEntity> items = context.read<QuizBloc>().state.data;

              final totalQuestions = items.length;
              final spendedTime = context.read<QuizBloc>().state.spendedTime;
              final totalTime = context.read<QuizBloc>().state.totalTime;
              final correctAnswers =
                  items.where((obj) => obj.isCorrectAnswer).length;
              final incorrectAnswers = items
                  .where(
                    (element) => element.selectedItem != null,
                  )
                  .where((obj) => !obj.isCorrectAnswer)
                  .length;

              QuizResultEntity result = QuizResultEntity(
                  spendedTime: spendedTime,
                  totalTime: totalTime,
                  totalBall: 0,
                  incorrectAnswers: incorrectAnswers,
                  correctAnswers: correctAnswers,
                  totalQuestions: totalQuestions);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => QuizResultPage(
                            result: result,
                          )));
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: const Text(
                "Yakunlash",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: white, fontSize: 15, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      );
}
