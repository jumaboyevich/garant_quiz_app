import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/assets/constants/icons.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_result_entity.dart';
import 'package:garant_test/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:garant_test/features/quiz/presentation/pages/quiz_result_page.dart';
import 'package:garant_test/features/quiz/presentation/widgets/quiz_content_page.dart';
import 'package:garant_test/features/quiz/presentation/widgets/quiz_counter_indicators.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.items});
  final List<QuizEntity> items;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.items.length, vsync: this, initialIndex: 0)
          ..addListener(
            () {
              setState(() {});
            },
          );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuizCounterIndicators(
          tabController: _tabController,
          items: widget.items,
        ),
        Expanded(
          child: TabBarView(
              controller: _tabController,
              children: mapIndexed(
                widget.items,
                (index, item) => QuizContentPage(item: item, index: index),
              ).toList()),
        ),
        _tabController.index == _tabController.length - 1
            ? Padding(
                padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                child: InkWell(
                  onTap: () {
                    List<QuizEntity> items =
                        context.read<QuizBloc>().state.data;

                    if (items
                        .where(
                          (element) => element.selectedItem == null,
                        )
                        .isNotEmpty) {
                      int emptyAnswerItem = items.indexWhere(
                        (element) => element.selectedItem == null,
                      );
                      _tabController.animateTo(emptyAnswerItem);
                      return;
                    }

                    final totalQuestions = items.length;
                    final spendedTime =
                        context.read<QuizBloc>().state.spendedTime;
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
                  child: SizedBox(
                    height: 56,
                    child: Material(
                        color: blue,
                        borderRadius: BorderRadius.circular(8),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Natijani ko'rsatish",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        )),
                  ),
                ),
              )
            : Row(
                key: UniqueKey(),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: _tabController.index == 0
                          ? null
                          : () {
                              _tabController
                                  .animateTo(_tabController.index - 1);
                            },
                      icon: SvgPicture.asset(AppIcons.arrowLeft)),
                  Text(
                    "${_tabController.index + 1}/${_tabController.length}",
                    style: const TextStyle(
                        color: grayHex8192A5,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  IconButton(
                      onPressed:
                          _tabController.index == _tabController.length - 1
                              ? null
                              : () {
                                  _tabController
                                      .animateTo(_tabController.index + 1);
                                },
                      icon: SvgPicture.asset(AppIcons.arrowRight))
                ],
              )
      ],
    );
  }
}

Iterable<E> mapIndexed<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;

  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}
