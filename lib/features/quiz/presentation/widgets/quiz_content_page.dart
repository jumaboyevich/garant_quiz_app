import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';

class QuizContentPage extends StatelessWidget {
  const QuizContentPage({super.key, required this.item, required this.index});
  final int index;
  final QuizEntity item;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      shrinkWrap: true,
      children: [
        QuestionBar(item: item),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Javoblar:",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: grayHex8192A5),
          ),
        ),
        ListView.separated(
          primary: false,
          separatorBuilder: (context, index) => const SizedBox(
            height: 12,
          ),
          shrinkWrap: true,
          itemCount: item.options.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.only(
                right: 6.23, left: 18, top: 18, bottom: 18),
            decoration: BoxDecoration(
                color: item.optionsBackroundColor(item.options[index]),
                borderRadius: BorderRadius.circular(8)),
            child: InkWell(
              onTap: () {
                context.read<QuizBloc>().add(SetQuizAnswerEvent(
                    index: this.index,
                    item: item,
                    selectedOption: item.options[index]));
              },
              child: Row(
                children: [
                  Text(
                    item.options[index].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500, color: blue),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Text(item.options[index].content,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: gray14)),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class QuestionBar extends StatelessWidget {
  const QuestionBar({
    super.key,
    required this.item,
  });

  final QuizEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: blue, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Savol:",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: gray14),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            item.question,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w400, color: gray14),
          ),
        ],
      ),
    );
  }
}
