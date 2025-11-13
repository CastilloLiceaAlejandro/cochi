import 'dart:async';

import '../../domain/entities/account.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../../domain/repositories/dashboard_repository.dart';

class InMemoryDashboardRepository implements DashboardRepository {
  InMemoryDashboardRepository()
      : _accounts = const [
          Account(
            id: 'account_main',
            name: 'Cuenta principal',
            type: AccountType.debit,
            balance: 25430.0,
            colorValue: 0xFF0078D4,
            bank: 'Cochi Bank',
            isPrimary: true,
          ),
          Account(
            id: 'credit_blue',
            name: 'Tarjeta crédito azul',
            type: AccountType.credit,
            balance: -1250.0,
            colorValue: 0xFF1565C0,
            bank: 'BlueCard',
            creditLimit: 15000,
          ),
          Account(
            id: 'savings_vacations',
            name: 'Cuenta ahorro vacaciones',
            type: AccountType.savings,
            balance: 5750.0,
            colorValue: 0xFF2E7D32,
          ),
        ];

  final List<Account> _accounts;

  static const List<String> _months = <String>[
    'Septiembre 2025',
    'Octubre 2025',
    'Noviembre 2025',
    'Diciembre 2025',
  ];

  @override
  Future<List<String>> fetchAvailableMonths() async {
    return Future<List<String>>.delayed(
      const Duration(milliseconds: 150),
      () => _months,
    );
  }

  @override
  Future<List<Account>> fetchAccounts() async {
    return Future<List<Account>>.delayed(
      const Duration(milliseconds: 150),
      () => _accounts,
    );
  }

  @override
  Future<DashboardSummary> fetchDashboardSummary({
    required String monthLabel,
    required String accountId,
  }) async {
    final account = _accounts.firstWhere((acc) => acc.id == accountId);

    const baseIncome = 18200.0;
    const baseExpense = 12450.0;

    final monthIndex = _months.indexOf(monthLabel).clamp(0, _months.length - 1);
    final modifier = 1 + (monthIndex * 0.02);

    final income = baseIncome * modifier;
    final expenses = baseExpense * modifier;
    final projectedSavings = income - expenses + (account.balance > 0 ? account.balance * 0.05 : 0);

    return Future<DashboardSummary>.delayed(
      const Duration(milliseconds: 200),
      () => DashboardSummary(
        totalBalance: account.balance + projectedSavings,
        monthlyIncome: income,
        monthlyExpenses: expenses,
        projectedSavings: projectedSavings,
        lastUpdated: DateTime.now().subtract(const Duration(hours: 6)),
        accountName: account.name,
        monthLabel: monthLabel,
      ),
    );
  }
}
