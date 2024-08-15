import 'package:flutter/material.dart';
import 'package:garant_test/assets/colors/colors.dart';
import 'package:garant_test/features/quiz/domain/entities/quiz_entity.dart';

class QuizCounterIndicators extends StatelessWidget {
  const QuizCounterIndicators(
      {super.key, required this.tabController, required this.items});
  final List<QuizEntity> items;
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: DefaultTabController(
        length: items.length,
        child: TabBar(
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          dividerColor: Colors.transparent,
          tabs: mapIndexed(
            items,
            (index, item) => AnimatedBuilder(
                animation: tabController.animation!,
                builder: (context, snapshot) {
                  return Tab(
                    iconMargin: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: tabController.index == index
                          ? blue
                          : Colors.transparent,
                    ),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                            color: item.tabIndicatorColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          "${index + 1}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  !item.initialSelectedAnswer ? white : gray14),
                        ))),
                  );
                }),
          ).toList(),
          labelPadding: const EdgeInsets.symmetric(horizontal: 5),
          controller: tabController,
          indicatorColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
      ),
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
