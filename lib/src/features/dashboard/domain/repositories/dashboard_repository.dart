import '../entities/account.dart';
import '../entities/dashboard_summary.dart';

abstract class DashboardRepository {
  Future<List<String>> fetchAvailableMonths();
  Future<List<Account>> fetchAccounts();
  Future<DashboardSummary> fetchDashboardSummary({
    required String monthLabel,
    required String accountId,
  });
}
