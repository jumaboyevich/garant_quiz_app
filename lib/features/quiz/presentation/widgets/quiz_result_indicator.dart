import 'package:flutter/material.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_result_entity.dart';

class QuizResultIndicator extends StatefulWidget {
  const QuizResultIndicator({super.key, required this.result});
  final QuizResultEntity result;
  @override
  State<QuizResultIndicator> createState() => _QuizResultIndicatorState();
}

class _QuizResultIndicatorState extends State<QuizResultIndicator> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 128,
          width: 128,
          decoration: BoxDecoration(
            border: Border.all(color: hawkesBlue, width: 6),
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  "${resultPercent.toInt().toString()}%",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: resultColor),
                ),
              ),
              Positioned.fill(
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                      begin: 0.0, end: resultPercentIndicatorValue),
                  duration: const Duration(seconds: 1),
                  builder: (context, value, _) => RotationTransition(
                    turns: const AlwaysStoppedAnimation(90 / 360),
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      value: value,
                      valueColor: AlwaysStoppedAnimation<Color>(resultColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Color get resultColor {
    if (resultPercent < 50) {
      return flamingo;
    }
    if (resultPercent < 90) {
      return orange;
    }
    return greenHex00D856;
  }

  double get resultPercent => resultPercentIndicatorValue * 100;

  double get resultPercentIndicatorValue =>
      widget.result.correctAnswers / widget.result.totalQuestions;
}
