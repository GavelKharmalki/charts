import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';
import 'individual_bar.dart';

class MyBarGraph extends StatelessWidget {
  //final List weeklySummary;
  const MyBarGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IndividualBar> barData = [
      IndividualBar(date: DateTime(2023, 9, 10), amount: 4000),
      IndividualBar(date: DateTime(2023, 9, 11), amount: 2000),
      IndividualBar(date: DateTime(2023, 9, 12), amount: 4007),
      IndividualBar(date: DateTime(2023, 9, 13), amount: 1209),
      IndividualBar(date: DateTime(2023, 9, 14), amount: 1406),
      IndividualBar(date: DateTime(2023, 9, 15), amount: 1306),
      IndividualBar(date: DateTime(2023, 9, 16), amount: 5005),
    ];

    //initialized bar data
    double maxAmount =
        barData.map((bar) => bar.amount).reduce((a, b) => a > b ? a : b);
    return BarChart(BarChartData(
      barTouchData: barTouchData,
      maxY: maxAmount,
      minY: 0,
      gridData: FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
            showTitles: true,
            //getTitlesWidget: getBottomTitles,
          ))),
      barGroups: barData
          .map(
            (data) => BarChartGroupData(
                showingTooltipIndicators: [0],
                x: data.date.day,
                barRods: [
                  BarChartRodData(
                      toY: data.amount,
                      color: Colors.grey[800],
                      width: 35,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: maxAmount + 500,
                        color: Colors.grey[200],
                      ))
                ]),
          )
          .toList(),
    ));
  }
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            const TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );

// Widget getBottomTitles(double value, TitleMeta meta) {
//   const style = TextStyle(
//     color: Colors.grey,
//     fontWeight: FontWeight.bold,
//     fontSize: 14,
//   );
//
//   Widget text;
//   switch (value.toInt()) {
//     case 0:
//       text = const Text('S', style: style);
//       break;
//     case 1:
//       text = const Text('M', style: style);
//       break;
//     case 2:
//       text = const Text('T', style: style);
//       break;
//     case 3:
//       text = const Text('W', style: style);
//       break;
//     case 4:
//       text = const Text('T', style: style);
//       break;
//     case 5:
//       text = const Text('F', style: style);
//       break;
//     case 6:
//       text = const Text('S', style: style);
//       break;
//     default:
//       text = const Text('', style: style);
//       break;
//   }
//
//   return SideTitleWidget(axisSide: meta.axisSide, child: text);
// }
