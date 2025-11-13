import 'package:flutter/foundation.dart';

@immutable
class DashboardSummary {
  const DashboardSummary({
    required this.totalBalance,
    required this.monthlyIncome,
    required this.monthlyExpenses,
    required this.projectedSavings,
    required this.lastUpdated,
    required this.accountName,
    required this.monthLabel,
  });

  final double totalBalance;
  final double monthlyIncome;
  final double monthlyExpenses;
  final double projectedSavings;
  final DateTime lastUpdated;
  final String accountName;
  final String monthLabel;
}
