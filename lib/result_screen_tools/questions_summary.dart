import 'package:flutter/material.dart';
import 'package:adv_basics2/result_screen_tools/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Column(
                children: [
                  SummaryItem(itemData: data),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
