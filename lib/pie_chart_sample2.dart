import 'package:fl_chart/fl_chart.dart';
import 'package:flchart_demo/pie_chart_item_data.dart';
import 'package:flchart_demo/presentation/resources/app_colors.dart';
import 'package:flchart_demo/presentation/widgets/indicator.dart';
import 'package:flutter/material.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  List<PieChartItemData> myData = [
    PieChartItemData(
      color: AppColors.contentColorBlue,
      title: "40%",
      value: 40,
      indicatorTitle: "First",
    ),
    PieChartItemData(
      color: AppColors.contentColorYellow,
      title: "30%",
      value: 30,
      indicatorTitle: "Second",
    ),
    PieChartItemData(
      color: AppColors.contentColorPink,
      title: "15%",
      value: 15,
      indicatorTitle: "Third",
    ),
    PieChartItemData(
      color: AppColors.contentColorGreen,
      title: "15%",
      value: 15,
      indicatorTitle: "Fourth",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Sample 2"),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.3,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 18,
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
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: myData.map((item) {
                        int index = myData.indexOf(item);
                        final isTouched = index == touchedIndex;
                        final fontSize = isTouched ? 25.0 : 16.0;
                        final radius = isTouched ? 60.0 : 50.0;
                        const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                        return PieChartSectionData(
                          color: item.color,
                          value: item.value,
                          title: item.title,
                          radius: radius,
                          titleStyle: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainTextColor1,
                            shadows: shadows,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: myData.map((item) => Column(
                    children: [
                      Indicator(
                        color: item.color,
                        text: item.indicatorTitle!,
                        isSquare: true,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  )).toList(),
              ),
              const SizedBox(
                width: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
