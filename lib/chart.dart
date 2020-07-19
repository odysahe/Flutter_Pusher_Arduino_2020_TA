import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedBarChart extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  _StackedBarChartState createState() => _StackedBarChartState();

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('DHT 1', 5),
      new OrdinalSales('DHT 3', 25),
      new OrdinalSales('DHT 4', 20),
      new OrdinalSales('DHT 5', 75),
      new OrdinalSales('DHT 6', 45),
      new OrdinalSales('Air', 67),
    ];

    // final tableSalesData = [
    //   new OrdinalSales('Januari', 25),
    //   new OrdinalSales('Februari', 50),
    //   new OrdinalSales('Maret', 10),
    //   new OrdinalSales('April', 20),
    // ];

    // final mobileSalesData = [
    //   new OrdinalSales('Januari', 10),
    //   new OrdinalSales('Februari', 15),
    //   new OrdinalSales('Maret', 50),
    //   new OrdinalSales('April', 45),
    // ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      // new charts.Series<OrdinalSales, String>(
      //   id: 'Tablet',
      //   domainFn: (OrdinalSales sales, _) => sales.year,
      //   measureFn: (OrdinalSales sales, _) => sales.sales,
      //   data: tableSalesData,
      // ),
      // new charts.Series<OrdinalSales, String>(
      //   id: 'Mobile',
      //   domainFn: (OrdinalSales sales, _) => sales.year,
      //   measureFn: (OrdinalSales sales, _) => sales.sales,
      //   data: mobileSalesData,
      // ),
    ];
  }
}

class _StackedBarChartState extends State<StackedBarChart> {
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      widget.seriesList,
      animate: widget.animate,
      barGroupingType: charts.BarGroupingType.stacked,
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
