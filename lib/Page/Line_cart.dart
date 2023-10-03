import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class line extends StatelessWidget {
  List<SalesData> data1 = [
    SalesData('jan', 35),
    SalesData('feb', 20),
    SalesData('mar', 32),
    SalesData('apr', 34),
    SalesData('may', 40),
  ];

  List<SalesData> data2 = [
    SalesData('jan', 20),
    SalesData('feb', 25),
    SalesData('mar', 18),
    SalesData('apr', 30),
    SalesData('may', 28),
  ];
  List<SalesData> data3 = [
    SalesData('jan', 40),
    SalesData('feb', 35),
    SalesData('mar', 8),
    SalesData('apr', 20),
    SalesData('may', 38),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphic'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icon tombol kembali
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Bagian pertama dari grafik
          Container(
            height: 330, // Atur tinggi grafik
            margin:
                EdgeInsets.only(bottom: 20), // Tambahkan margin di bagian bawah
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Data Ambengan 1'),
              legend: Legend(
                isVisible: true,
              ),
              series: <ChartSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  dataSource: data1,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Data 1',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                LineSeries<SalesData, String>(
                  dataSource: data2,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Data 2',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                LineSeries<SalesData, String>(
                  dataSource: data3,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Data 3',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
          // Bagian kedua dari grafik
          Container(
            height: 330, // Atur tinggi grafik
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Data Ambengan 2'),
              legend: Legend(
                isVisible: true,
              ),
              series: <ChartSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  dataSource: data1,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Data 1',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
                LineSeries<SalesData, String>(
                  dataSource: data2,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  name: 'Data 2',
                  dataLabelSettings: DataLabelSettings(isVisible: true),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, this.sales);
}
