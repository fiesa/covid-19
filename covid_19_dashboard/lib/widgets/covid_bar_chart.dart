import 'package:covid_19_dashboard/config/styles.dart';
import 'package:covid_19_dashboard/data/data.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  const CovidBarChart({@required this.covidCases});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            margin: const EdgeInsets.only(bottom: 5.0),
            child: BarChart(
              BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 16.0,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      rotateAngle: 35.0,
                      margin: 10.0,
                      showTitles: true,
                      textStyle: Styles.chartLabesTextStyle,
                      getTitles: (double value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'August 20';
                          case 1:
                            return 'August 21';
                          case 2:
                            return 'August 22';
                          case 3:
                            return 'August 23';
                          case 4:
                            return 'August 24';
                          case 5:
                            return 'August 25';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      textStyle: Styles.chartLabesTextStyle,
                      getTitles: (value) {
                        if (value == 0) {
                          return '0';
                        } else if (value % 3 == 0) {
                          return '${value ~/ 3 * 5}K';
                        }
                        return '';
                      },
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    checkToShowHorizontalLine: (value) => value % 3 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.black12,
                        strokeWidth: 1.0,
                        dashArray: [5]),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: covidUSADailyNewCases
                      .asMap()
                      .map(
                        (key, value) => MapEntry(
                          key,
                          BarChartGroupData(
                            x: key,
                            barRods: [
                              BarChartRodData(y: value, color: Colors.red),
                            ],
                          ),
                        ),
                      )
                      .values
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }
}
