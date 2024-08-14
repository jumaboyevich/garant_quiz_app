import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/assets/constants/icons.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_result_entity.dart';
import 'package:garant_test/features/quiz/presentation/quiz_screen.dart';

class QuizResultPage extends StatefulWidget {
  const QuizResultPage({super.key, required this.result});

  final QuizResultEntity result;

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grayHexF1F3F7,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: white),
          margin: const EdgeInsets.all(18.0),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Yakunlandi",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: gray14)),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Afsuski sizga ball taqdim etilmadi",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w400, color: davsGrey),
              ),
              Text(
                "Ja’mi to’plangan ballaringiz soni: ${widget.result.totalBall} ta",
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: grayHex8192A5),
              ),
              const SizedBox(
                height: 12,
              ),
              Text("Umumiy testlar soni: ${widget.result.totalQuestions}"),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                          color: cosmicLatte,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Text(
                            "${widget.result.correctAnswers}",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: greenHex00D856),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "To’g’ri javob",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: greenHex00D856),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      decoration: BoxDecoration(
                          color: grayHexFFE6E6,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Text(
                            "${widget.result.incorrectAnswers}",
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: flamingo),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "To’g’ri javob",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: flamingo),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.stopwatch),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.result.calculateTotalTime,
                    style: const TextStyle(
                        color: orange,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  const Text(
                    "/",
                    style: TextStyle(
                        color: hawkesBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    widget.result.calculateSpendedTime,
                    style: const TextStyle(
                        color: orange,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              QuizScreen.screen()));
                },
                child: SizedBox(
                  height: 56,
                  child: Material(
                      color: blue,
                      borderRadius: BorderRadius.circular(8),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.refresh,
                            color: white,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            "Qayta urinish",
                            style: TextStyle(
                                color: white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 56,
                  child: Material(
                    color: grayHexF1F3F7,
                    borderRadius: BorderRadius.circular(8),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Chiqish",
                          style: TextStyle(
                              color: grayHex8192A5,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
