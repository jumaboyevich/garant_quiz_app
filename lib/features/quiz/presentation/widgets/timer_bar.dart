import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/assets/constants/icons.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';

class TimerBar extends StatefulWidget {
  const TimerBar({super.key});

  @override
  State<TimerBar> createState() => _TimerBarState();
}

class _TimerBarState extends State<TimerBar> {
  final StreamController<int> _countDownStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();

    if (!_countDownStreamController.isClosed) {
      _countDownStreamController.addStream(periodic(1200));
    }
  }

  Stream<int> periodic(int time) =>
      Stream.periodic(const Duration(seconds: 1), (i) => time - 1 - i)
          .take(time);

  String formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xffF1F3F7),
                        borderRadius: BorderRadius.circular(34)),
                    
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.stopwatch),
          const SizedBox(
            width: 3,
          ),
          StreamBuilder<int>(
              stream: _countDownStreamController.stream,
              builder: (_, snapshot) {
                int time = snapshot.data ?? -1;
                context.read<QuizBloc>().add(SetSpendedTimeEvent(time: time));
                return Text(
                  formattedTime(timeInSecond: time),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400, color: gray14),
                );
              })
        ],
      ),
    );
  }
}
