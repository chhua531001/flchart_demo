import 'dart:ui';

class PieChartItemData {
  final Color color;
  double? value;
  double? radius;
  String? title;
  double? titlePositionPercentageOffset;
  String? indicatorTitle;
  String? iconPath;

  PieChartItemData({this.title, required this.color, this.radius, this.value, this.titlePositionPercentageOffset, this.indicatorTitle, this.iconPath});
}