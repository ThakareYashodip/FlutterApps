import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChartWithMarker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCircularChart(
        title: ChartTitle(text: 'Sales by Category'),
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
            dataSource: getChartData(),
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          ),
        ],
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 30),
                  Text(
                    'Marker Pointer',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            radius: '40%',
            angle: 60, // Angle to place the marker pointer
          ),
        ],
      ),
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('Electronics', 35),
      ChartData('Fashion', 28),
      ChartData('Grocery', 34),
      ChartData('Home & Furniture', 32),
    ];
  }
}

class ChartData {
  final String category;
  final double value;

  ChartData(this.category, this.value);
}