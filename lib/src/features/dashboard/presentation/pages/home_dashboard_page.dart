import 'package:fluent_ui/fluent_ui.dart';
import 'package:intl/intl.dart';

import '../../data/repositories/in_memory_dashboard_repository.dart';
import '../../domain/entities/account.dart';
import '../../domain/entities/dashboard_summary.dart';
import '../../domain/repositories/dashboard_repository.dart';

class HomeDashboardPage extends StatefulWidget {
  HomeDashboardPage({
    DashboardRepository? repository,
    super.key,
  }) : repository = repository ?? InMemoryDashboardRepository();

  final DashboardRepository repository;

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardPageState();
}

class _HomeDashboardPageState extends State<HomeDashboardPage> {
  late final NumberFormat _currencyFormat;
  late final DateFormat _dateFormat;

  List<String> _months = const [];
  List<Account> _accounts = const [];
  String? _selectedMonth;
  Account? _selectedAccount;
  DashboardSummary? _summary;
  bool _isLoadingInitial = true;
  bool _isLoadingSummary = true;

  @override
  void initState() {
    super.initState();
    _currencyFormat = NumberFormat.currency(locale: 'es_MX', symbol: r'$');
    _dateFormat = DateFormat("d 'de' MMM, HH:mm", 'es_MX');
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      final months = await widget.repository.fetchAvailableMonths();
      final accounts = await widget.repository.fetchAccounts();

      final Account? initialAccount = accounts.isEmpty
          ? null
          : accounts.firstWhere(
              (acc) => acc.isPrimary,
              orElse: () => accounts.first,
            );

      setState(() {
        _months = months;
        _accounts = accounts;
        _selectedMonth = months.isNotEmpty ? months.last : null;
        _selectedAccount = initialAccount;
      });

      await _loadSummary();
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingInitial = false;
        });
      }
    }
  }

  Future<void> _loadSummary() async {
    final month = _selectedMonth;
    final account = _selectedAccount;
    if (month == null || account == null) {
      setState(() {
        _summary = null;
        _isLoadingSummary = false;
      });
      return;
    }

    setState(() {
      _isLoadingSummary = true;
    });

    final summary = await widget.repository.fetchDashboardSummary(
      monthLabel: month,
      accountId: account.id,
    );

    if (!mounted) return;

    setState(() {
      _summary = summary;
      _isLoadingSummary = false;
    });
  }

  void _handleMonthChanged(String month) {
    setState(() {
      _selectedMonth = month;
    });
    _loadSummary();
  }

  void _handleAccountChanged(Account account) {
    setState(() {
      _selectedAccount = account;
    });
    _loadSummary();
  }

  @override
  Widget build(BuildContext context) {
    final typography = FluentTheme.of(context).typography;

    return ScaffoldPage.withPadding(
      header: PageHeader(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Resumen general', style: typography.titleLarge),
            const SizedBox(height: 4),
            Text(
              _selectedAccount != null && _selectedMonth != null ? '${_selectedAccount!.name} · $_selectedMonth' : 'Visualiza el estado de tus cuentas, ahorros y gastos proyectados.',
              style: typography.body,
            ),
          ],
        ),
      ),
      content: _isLoadingInitial
          ? const Center(child: ProgressRing())
          : Column(
              children: [
                _DashboardFilters(
                  months: _months,
                  selectedMonth: _selectedMonth,
                  onMonthChanged: _handleMonthChanged,
                  accounts: _accounts,
                  selectedAccount: _selectedAccount,
                  onAccountChanged: _handleAccountChanged,
                ),
                const SizedBox(height: 20),
                _DashboardCardsGrid(
                  summary: _summary,
                  account: _selectedAccount,
                  isLoading: _isLoadingSummary,
                  currencyFormat: _currencyFormat,
                  dateFormat: _dateFormat,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Row(
                    children: const [
                      Expanded(child: _DashboardChartPlaceholder(title: 'Estado de cuenta')),
                      SizedBox(width: 16),
                      Expanded(child: _DashboardChartPlaceholder(title: 'Distribución por categoría')),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _DashboardFilters extends StatelessWidget {
  const _DashboardFilters({
    required this.months,
    required this.selectedMonth,
    required this.onMonthChanged,
    required this.accounts,
    required this.selectedAccount,
    required this.onAccountChanged,
  });

  final List<String> months;
  final String? selectedMonth;
  final ValueChanged<String> onMonthChanged;
  final List<Account> accounts;
  final Account? selectedAccount;
  final ValueChanged<Account> onAccountChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 24,
          runSpacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SizedBox(
              width: 260,
              child: InfoLabel(
                label: 'Mes y año',
                child: ComboBox<String>(
                  value: selectedMonth,
                  items: months.map((m) => ComboBoxItem<String>(value: m, child: Text(m))).toList(),
                  isExpanded: true,
                  placeholder: const Text('Selecciona un mes'),
                  onChanged: months.isEmpty
                      ? null
                      : (value) {
                          if (value != null) onMonthChanged(value);
                        },
                ),
              ),
            ),
            SizedBox(
              width: 260,
              child: InfoLabel(
                label: 'Cuenta',
                child: ComboBox<Account>(
                  value: selectedAccount,
                  items: accounts.map((acc) => ComboBoxItem<Account>(value: acc, child: Text(acc.name))).toList(),
                  isExpanded: true,
                  placeholder: const Text('Selecciona una cuenta'),
                  onChanged: accounts.isEmpty
                      ? null
                      : (value) {
                          if (value != null) onAccountChanged(value);
                        },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardCardsGrid extends StatelessWidget {
  const _DashboardCardsGrid({
    required this.summary,
    required this.account,
    required this.isLoading,
    required this.currencyFormat,
    required this.dateFormat,
  });

  final DashboardSummary? summary;
  final Account? account;
  final bool isLoading;
  final NumberFormat currencyFormat;
  final DateFormat dateFormat;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
        height: 180,
        child: Center(child: ProgressRing()),
      );
    }

    if (summary == null) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text('Selecciona un mes y una cuenta para ver el resumen.')),
      );
    }

    final tiles = [
      _DashboardTile(
        title: 'Saldo total estimado',
        value: currencyFormat.format(summary!.totalBalance),
        subtitle: 'Saldo actual + ahorro proyectado',
        icon: FluentIcons.money,
      ),
      _DashboardTile(
        title: 'Ingresos del mes',
        value: currencyFormat.format(summary!.monthlyIncome),
        subtitle: 'Actualizado ${dateFormat.format(summary!.lastUpdated)}',
        icon: FluentIcons.payment_card,
      ),
      _DashboardTile(
        title: 'Egresos del mes',
        value: currencyFormat.format(summary!.monthlyExpenses),
        subtitle: 'Incluye pagos recurrentes confirmados',
        icon: FluentIcons.bulleted_list,
      ),
      _DashboardTile(
        title: 'Ahorro proyectado',
        value: currencyFormat.format(summary!.projectedSavings),
        subtitle: account != null ? 'Cuenta base: ${account!.name}' : '',
        icon: FluentIcons.trending12,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        final crossAxisCount = isWide ? 4 : 2;
        final itemWidth = (constraints.maxWidth - (16 * (crossAxisCount - 1))) / crossAxisCount;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: tiles
              .map(
                (tile) => SizedBox(
                  width: itemWidth,
                  child: tile,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _DashboardTile extends StatelessWidget {
  const _DashboardTile({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28, color: theme.accentColor),
            const SizedBox(height: 12),
            Text(title, style: theme.typography.bodyStrong),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.typography.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: theme.typography.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardChartPlaceholder extends StatelessWidget {
  const _DashboardChartPlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.typography.subtitle),
            const Spacer(),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FluentIcons.chart,
                    size: 48,
                    color: theme.accentColor,
                  ),
                  const SizedBox(height: 8),
                  const Text('Aquí podrás visualizar la gráfica correspondiente.'),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
