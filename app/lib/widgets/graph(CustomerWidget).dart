import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key});

  @override
  Widget build(BuildContext context) {
    double hei = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return Container(
      width: wid * 0.25, // Adjusted width
      height: hei * 0.15, // Consistent height
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min, // prevent Row from taking full width
            children: [
              Flexible(
                child: Text(
                  '1.8%',
                  style: TextStyle(
                    fontSize: hei * 0.025,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3D63),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              Icon(Icons.arrow_upward, size: hei * 0.025, color: Colors.green),
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
                      FlSpot(2, 2.2),
                      FlSpot(3, 2),
                      FlSpot(4, 1.8),
                    ],
                    isStrokeCapRound: true,
                    color: Colors.green,
                    barWidth: 1.5,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.green.withOpacity(0.2),
                    ),
                    dotData: const FlDotData(show: false),
                  ),
                ],
                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
