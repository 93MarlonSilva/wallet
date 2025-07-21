import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wallet/constants.dart';
import 'package:wallet/models/transaction.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  int _selectedPeriodIndex = 0;
  int _selectedTabIndex = 1; // 0 = Income, 1 = Outcome

  final List<String> _periods = ['Week', 'Month', 'Year'];
  final List<String> _tabs = ['Income', 'Outcome'];

  // Placeholder for transactions list (replace with your actual data source)
  List<Transaction> transactions = []; // Define or fetch your transactions here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradients.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingLarge),
                  child: Text(
                    'Statistics',
                    style: TextStyle(
                       color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20), // Balance the back button

                // Time Period Selection
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                    ),
                    child: Row(
                      children: List.generate(
                        _periods.length,
                        (index) => Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _selectedPeriodIndex = index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                                gradient: _selectedPeriodIndex == index
                                    ? const LinearGradient(
                                        colors: [AppColors.primary, AppColors.blue],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      )
                                    : null,
                              ),
                              child: Text(
                                _periods[index],
                                style: TextStyle(
                                  color: _selectedPeriodIndex == index
                                      ? Colors.white
                                      : AppColors.textSecondary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.paddingLarge),

                // Total Spendings
                const Text(
                  'Total Spendings',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '3658.26',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: AppSizes.paddingLarge),

                // Income/Outcome Tabs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: Row(
                    children: List.generate(
                      _tabs.length,
                      (index) => Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTabIndex = index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: _selectedTabIndex == index
                                      ? AppColors.blue
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                            ),
                            child: Text(
                              _tabs[index],
                              style: TextStyle(
                                color: _selectedTabIndex == index
                                    ? AppColors.blue
                                    : AppColors.textSecondary,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.paddingLarge),

                // Overview Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Overview',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                        ),
                        child: const Text(
                          '-\$1234.45',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.paddingMedium),

                // Line Chart
                Container(
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: _buildLineChart(),
                ),

                // Message Box
                Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingLarge),
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.paddingLarge),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                      border: Border.all(
                        color: AppColors.blue.withOpacity(0.3),
                        width: 1,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          AppColors.blue.withOpacity(0.1),
                          AppColors.primary.withOpacity(0.1),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Text(
                      'Your spending decreased from 5% the last week. Good job!',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.paddingLarge),

                // Pie Chart Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Spending by Category',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.paddingMedium),

                // Pie Chart
                Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: _buildPieChart(),
                ),

                const SizedBox(height: AppSizes.paddingLarge),

                // Bar Chart Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Monthly Comparison',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.paddingMedium),

                // Bar Chart
                Container(
                  height: 300,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
                  child: _buildBarChart(),
                ),

                const SizedBox(height: AppSizes.paddingLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    final weekData = _getWeekData();

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                if (value.toInt() >= 0 && value.toInt() < days.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      days[value.toInt()],
                      style: TextStyle(
                        color: value.toInt() == 5 // Saturday
                            ? AppColors.blue
                            : AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: value.toInt() == 5 ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
              interval: 1,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: weekData,
            isCurved: true,
            color: AppColors.blue,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  AppColors.blue.withOpacity(0.3),
                  AppColors.blue.withOpacity(0.1),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 1000,
      ),
    );
  }

  List<FlSpot> _getWeekData() {
    // Generate sample data based on transactions
    final incomeTransactions = transactions.where((t) => t.value > 0).toList();
    final outcomeTransactions = transactions.where((t) => t.value < 0).toList();

    // Calculate daily totals for the week
    final dailyData = List.generate(7, (index) {
      double total = 0;

      if (_selectedTabIndex == 0) {
        // Simulate income data
        total = 200 + (index * 50) + (index % 2 == 0 ? 100 : 0);
      } else {
        // Simulate outcome data based on actual transactions
        total = 150 + (index * 30) + (index % 3 == 0 ? 200 : 0);
      }

      return FlSpot(index.toDouble(), total);
    });

    return dailyData;
  }

  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 65,
        sections: [
          PieChartSectionData(
            color: AppColors.primary,
            value: 35,
            title: '35%',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: AppColors.blue,
            value: 25,
            title: '25%',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: AppColors.accent,
            value: 20,
            title: '20%',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          PieChartSectionData(
            color: Colors.orange,
            value: 20,
            title: '20%',
            radius: 60,
            titleStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 2000,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                if (value.toInt() >= 0 && value.toInt() < months.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      months[value.toInt()],
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '\$${value.toInt()}',
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 1200,
                color: AppColors.secondary,
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 1800,
                color: AppColors.blue,
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 1400,
                color: AppColors.accent,
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 1600,
                color: Colors.orange,
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 1900,
                color: AppColors.primary,
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 1500,
                color: AppColors.blue,
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}