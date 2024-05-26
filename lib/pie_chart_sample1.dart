import 'package:fl_chart/fl_chart.dart';
import 'package:flchart_demo/pie_chart_item_data.dart';
import 'package:flchart_demo/presentation/resources/app_colors.dart';
import 'package:flchart_demo/presentation/widgets/indicator.dart';
import 'package:flutter/material.dart';

class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;

  List<PieChartItemData> myData = [
    PieChartItemData(
      color: AppColors.contentColorBlue,
      radius: 80,
      titlePositionPercentageOffset: 0.55,
      indicatorTitle: "One",
    ),
    PieChartItemData(
      color: AppColors.contentColorYellow,
      radius: 65,
      titlePositionPercentageOffset: 0.55,
      indicatorTitle: "Two",
    ),
    PieChartItemData(
      color: AppColors.contentColorPink,
      radius: 60,
      titlePositionPercentageOffset: 0.6,
      indicatorTitle: "Three",
    ),
    PieChartItemData(
      color: AppColors.contentColorGreen,
      radius: 70,
      titlePositionPercentageOffset: 0.55,
      indicatorTitle: "Four",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text("Sample 1"),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: myData.map((item) {
                    final index = myData.indexOf(item);
                  return Indicator(
                    color: item.color,
                    text: item.indicatorTitle!,
                    isSquare: false,
                    size: touchedIndex == index ? 18 : 16,
                    textColor: touchedIndex == index
                        ? AppColors.mainTextColor1
                        : AppColors.mainTextColor3,
                  );
                }).toList()
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 1,
                      centerSpaceRadius: 0,
                      sections: myData.map((item) {
                        final index = myData.indexOf(item);
                        final isTouched = index == touchedIndex;
                        return PieChartSectionData(
                          color: item.color,
                          value: 25,
                          title: '',
                          radius: item.radius,
                          titlePositionPercentageOffset:
                              item.titlePositionPercentageOffset,
                          borderSide: isTouched
                              ? const BorderSide(
                                  color: AppColors.contentColorWhite, width: 6)
                              : BorderSide(
                                  color: AppColors.contentColorWhite
                                      .withOpacity(0)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
