import 'package:fluent_ui/fluent_ui.dart';

import 'features/dashboard/presentation/pages/home_dashboard_page.dart';
import 'features/shared/presentation/widgets/coming_soon_page.dart';

class CochiApp extends StatefulWidget {
  const CochiApp({super.key});

  @override
  State<CochiApp> createState() => _CochiAppState();
}

class _CochiAppState extends State<CochiApp> {
  int _selectedIndex = 0;

  static final List<_PaneSection> _sections = [
    _PaneSection(
      title: 'Home',
      icon: FluentIcons.home,
      builder: (_) => HomeDashboardPage(),
    ),
    _PaneSection(
      title: 'Cuentas',
      icon: FluentIcons.contact_list,
      builder: (_) => const ComingSoonPage(title: 'Cuentas'),
    ),
    _PaneSection(
      title: 'Categorías',
      icon: FluentIcons.category_classification,
      builder: (_) => const ComingSoonPage(title: 'Categorías'),
    ),
    _PaneSection(
      title: 'Pagos recurrentes',
      icon: FluentIcons.recurring_event,
      builder: (_) => const ComingSoonPage(title: 'Pagos recurrentes'),
    ),
    _PaneSection(
      title: 'Préstamos',
      icon: FluentIcons.money,
      builder: (_) => const ComingSoonPage(title: 'Préstamos'),
    ),
    _PaneSection(
      title: 'Ahorros',
      icon: FluentIcons.bank,
      builder: (_) => const ComingSoonPage(title: 'Ahorros'),
    ),
    _PaneSection(
      title: 'Movimientos',
      icon: FluentIcons.transfer_call,
      builder: (_) => const ComingSoonPage(title: 'Movimientos'),
    ),
    _PaneSection(
      title: 'Configuración',
      icon: FluentIcons.settings,
      builder: (_) => const ComingSoonPage(title: 'Configuración'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Cochi',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.blue,
      ),
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.blue,
      ),
      home: NavigationView(
        appBar: NavigationAppBar(
          title: const Text('Cochi'),
        ),
        pane: NavigationPane(
          selected: _selectedIndex,
          displayMode: PaneDisplayMode.auto,
          onChanged: (index) => setState(() => _selectedIndex = index),
          items: [
            for (final section in _sections)
              PaneItem(
                icon: Icon(section.icon),
                title: Text(section.title),
                body: section.builder(context),
              ),
          ],
        ),
      ),
    );
  }
}

class _PaneSection {
  _PaneSection({
    required this.title,
    required this.icon,
    required this.builder,
  });

  final String title;
  final IconData icon;
  final WidgetBuilder builder;
}
