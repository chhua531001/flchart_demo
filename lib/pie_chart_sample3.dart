import 'package:fl_chart/fl_chart.dart';
import 'package:flchart_demo/pie_chart_item_data.dart';
import 'package:flchart_demo/presentation/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PieChartSample3 extends StatefulWidget {
  const PieChartSample3({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;

  List<PieChartItemData> myData = [
    PieChartItemData(
      color: AppColors.contentColorBlue,
      title: "40%",
      value: 40,
      iconPath: 'assets/icons/ophthalmology-svgrepo-com.svg',
    ),
    PieChartItemData(
      color: AppColors.contentColorYellow,
      title: "30%",
      value: 30,
      iconPath: 'assets/icons/librarian-svgrepo-com.svg',
    ),
    PieChartItemData(
      color: AppColors.contentColorPink,
      title: "15%",
      value: 15,
      iconPath: 'assets/icons/fitness-svgrepo-com.svg',
    ),
    PieChartItemData(
      color: AppColors.contentColorGreen,
      title: "15%",
      value: 15,
      iconPath: 'assets/icons/worker-svgrepo-com.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Sample 3"),
      ),
      body: Center(
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    // touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: myData.map((item) {
              int index = myData.indexOf(item);
              final isTouched = index == touchedIndex;
              final fontSize = isTouched ? 20.0 : 16.0;
              final radius = isTouched ? 110.0 : 100.0;
              final widgetSize = isTouched ? 55.0 : 40.0;
              const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
              return PieChartSectionData(
                color: item.color,
                value: item.value,
                title: item.title,
                radius: radius,
                titleStyle: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: shadows,
                ),
                badgeWidget: _Badge(
                  item.iconPath!,
                  size: widgetSize,
                  borderColor: AppColors.contentColorBlack,
                ),
                badgePositionPercentageOffset: .98,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.svgAsset, {
    required this.size,
    required this.borderColor,
  });
  final String svgAsset;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
        ),
      ),
    );
  }
}
