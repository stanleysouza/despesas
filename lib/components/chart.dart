import 'package:despesas/models/trasaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          'value': 9.99,
        };
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: [
          Column(),
        ],
      ),
    );
  }
}
