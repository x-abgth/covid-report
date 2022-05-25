import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartLineTitlesRepository {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(sideTitles: bottomitles),
        leftTitles: AxisTitles(sideTitles: leftTitles),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );
}

SideTitles get leftTitles => SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );

SideTitles get bottomitles => SideTitles(
      showTitles: true,
      interval: 1,
      reservedSize: 15,
      getTitlesWidget: bottomTitleWidgets,
    );

Widget bottomTitleWidgets(double val, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );
  // TODO:
  return const Text("i", style: style, textAlign: TextAlign.center);
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0';
      break;
    case 1:
      text = '1m';
      break;
    case 2:
      text = '2m';
      break;
    case 3:
      text = '3m';
      break;
    case 4:
      text = '4m';
      break;
    case 5:
      text = '5m';
      break;
    case 6:
      text = '6m';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}
