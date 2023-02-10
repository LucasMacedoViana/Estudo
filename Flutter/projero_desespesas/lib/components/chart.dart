import 'package:flutter/material.dart';
import 'package:projero_desespesas/components/chart_bar.dart';
import 'package:projero_desespesas/models/transaction.dart';
import 'package:intl/intl.dart';
import 'chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransections;

  Chart(this.recentTransections);

  List<Map<String, Object>> get groupedTransections {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < recentTransections.length; i++) {
        bool sameDay = recentTransections[i].date.day == weekDay.day;
        bool sameMounth = recentTransections[i].date.month == weekDay.month;
        bool sameYear = recentTransections[i].date.year == weekDay.year;

        if (sameDay && sameMounth && sameYear) {
          totalSum += recentTransections[i].value;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue{
    return groupedTransections.fold(0.0, (sum, tr){
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransections.map((tr) {
            return Flexible(
              fit: FlexFit.tight,

              child: ChartBar(
                label: (tr['day'] as String),
                value: (tr['value'] as double),
                percentage: (tr['value'] as double)/ _weekTotalValue,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
