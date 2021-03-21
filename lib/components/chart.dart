import 'package:despesas/components/chart_bar.dart';
import 'package:despesas/models/trasaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTrasactions {
    return List.generate(
      7,
      (index) {
        final weekday = DateTime.now().subtract(
          Duration(days: index),
        );

        double totalSum = 0.0;

        for (var i = 0; i < recentTransaction.length; i++) {
          bool sameDay = recentTransaction[i].date.day == weekday.day;
          bool sameMonth = recentTransaction[i].date.month == weekday.month;
          bool sameYear = recentTransaction[i].date.year == weekday.year;

          if (sameDay && sameMonth && sameDay) {
            totalSum += recentTransaction[i].value;
          }
        }

        return {
          'day': DateFormat.E().format(weekday)[0],
          'value': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTrasactions.fold(0.0, (sum, tr) {
      return sum + tr['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTrasactions;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(1, 20, 1, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTrasactions.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: ChartBar(
                label: tr['day'],
                value: tr['value'],
                percentage: (tr['value'] as double) / _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
