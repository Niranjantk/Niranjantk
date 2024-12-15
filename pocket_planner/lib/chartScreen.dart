import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressChartScreen extends StatefulWidget {
  const ProgressChartScreen({Key? key}) : super(key: key);

  @override
  _ProgressChartScreenState createState() => _ProgressChartScreenState();
}

class _ProgressChartScreenState extends State<ProgressChartScreen> {
  // For handling chart data
  int _selectedFilter = 0; // Default filter: Month

  List<double> _chartData = [10, 20, 30, 25, 18, 22, 35];

  // Progress indicator value (from 0 to 100)
  final double _progress = 0.5;

  // Function to handle chart filter change
  void _onFilterChanged(int index) {
    setState(() {
      _selectedFilter = index;
      // Update chart data based on selected filter (Month, Week, Year)
      if (index == 0) {
        _chartData = [10, 20, 30, 25, 18, 22, 35]; // Month data
      } else if (index == 1) {
        _chartData = [5, 10, 15, 10, 20, 25]; // Week data
      } else {
        _chartData = [100, 200, 300, 250, 150]; // Year data
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Progress',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 10, 43, 69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Filter buttons for chart
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildFilterButton('Month', 0),
                  const SizedBox(width: 1),
                  _buildFilterButton('Week', 1),
                  const SizedBox(width: 1),
                  _buildFilterButton('Year', 2),
                ],
              ),
              const SizedBox(height: 20),

              // Line Chart
              SizedBox(
                height: 250,
                child: LineChart(
                  LineChartData(
                    backgroundColor: Colors.black26,
                    // gridData: FlGridData(show: true),
                    titlesData: const FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(
                          sideTitles:
                              SideTitles(reservedSize: 30, showTitles: false)),
                      rightTitles: AxisTitles(
                          sideTitles:
                              SideTitles(reservedSize: 30, showTitles: false)),
                    ),
                    borderData: FlBorderData(show: true),
                    lineBarsData: [
                      LineChartBarData(
                        spots: _chartData
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        color: const Color.fromARGB(255, 10, 43, 69),
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Card(
                color: const Color.fromARGB(255, 220, 234, 245),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  color: Colors.green,
                                  value: 50, // Total income
                                  title: 'Income',
                                  radius: 50,
                                ),
                                PieChartSectionData(
                                  color: Colors.red,
                                  value: 50, // Total expense
                                  title: 'Expenses',
                                  radius: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 8),
                                const Text('Income: 70%'),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 8),
                                const Text('Expenses: 30%'),
                              ],
                            ),
                          ],
                        ),
                      ],
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

  // Helper method to create the filter buttons
  Widget _buildFilterButton(String label, int index) {
    return InkWell(
      onTap: () {
        _onFilterChanged(index);
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: _selectedFilter == index
              ? const Color.fromARGB(255, 10, 43, 69)
              : Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
