import 'package:flchart_demo/pie_chart_sample1.dart';
import 'package:flchart_demo/pie_chart_sample2.dart';
import 'package:flchart_demo/pie_chart_sample3.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatelessWidget {
  const PieChartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pie Chart Demo",
          style: TextStyle(
            color: Colors.amber
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PieChartSample1()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Sample 1",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PieChartSample2()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Sample 2",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PieChartSample3()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const StadiumBorder(),
              ),
              child: const Text(
                "Sample 3",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
