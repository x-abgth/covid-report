import 'package:covid_report/data/models/previous_covid_report_model.dart';
import 'package:covid_report/data/repositories/chart_line_titles_repository.dart';
import 'package:covid_report/logic/world_report_api_bloc/world_report_api_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreenWorldWideChart extends StatelessWidget {
  final Map<String, int> state;
  // late List<FlSpot> values;
  // var lastDataPoint;

  HomeScreenWorldWideChart({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Cases : ${state["1/23/20"]}");

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 3,
        minY: 0,
        maxY: 7,
        titlesData: ChartLineTitlesRepository.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey,
              strokeWidth: 0.3,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey,
              strokeWidth: 0.3,
            );
          },
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
              spots: [
                // values = state.previousData.cases.map<String, double>((data) => print("")).toList();
                // state.previousData.cases.forEach((date) {
                //   if (lastDataPoint) {
                //     return FlSpot(
                //         date, state.previousData.cases[date] - lastDataPoint);
                //   }
                //   lastDataPoint = state.previousData.cases[date];
                // }),
                FlSpot(0, 3),
                FlSpot(0.5, 1.5),
                FlSpot(1, 4),
                FlSpot(1.5, 3.5),
                FlSpot(2, 2),
                FlSpot(2.5, 0),
                FlSpot(3, 0.8),
                FlSpot(3, 0.8),
                FlSpot(3, 0.8),
                FlSpot(3, 0.8),
              ],
              isCurved: true,
              color: Colors.red,
              barWidth: 3,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.red.withOpacity(0.3),
              )),
        ],
      ),
    );
  }
}




  // }

  // abc() {
  //   state.previousData.cases.forEach(
  //     (key, value) {
  //       FlSpot(2, value.toDouble());
  //     },
  //   );
  // }