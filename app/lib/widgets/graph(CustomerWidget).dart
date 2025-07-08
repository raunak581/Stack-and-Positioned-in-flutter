import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              '1.8%',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF2C3D63),
              ),
            ),
            SizedBox(width: 30),
            Icon(Icons.arrow_upward, size: 25, color: Colors.green),
          ],
        ),
        const SizedBox(height: 6),
        Expanded(
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  spots: const [
                    FlSpot(0, 1),
                    FlSpot(1, 1.3),
                    FlSpot(2, 3),
                    FlSpot(3, 2),
                    FlSpot(4, 1.8),
                  ],
                  isStrokeCapRound: true,
                  color: Colors.green,
                  barWidth: 2,
                  belowBarData: BarAreaData(
                    show: true,
                    // ignore: deprecated_member_use
                    color: Colors.green.withOpacity(0.3),
                  ),
                  dotData: const FlDotData(show: false),
                )
              ],
              minX: 0,
              maxX: 4,
              minY: 0,
              maxY: 3,
            ),
          ),
        ),
      ],
    );
  }
}
