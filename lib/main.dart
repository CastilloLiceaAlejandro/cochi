import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const CochiApp());
}

class CochiApp extends StatelessWidget {
  const CochiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Cochi',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: const AccentColor('accent', {
          'normal': Color(0xFF0078D4),
        }),
      ),
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        accentColor: const AccentColor('accent', {
          'normal': Color(0xFF46A3FF),
        }),
      ),
      home: const _CochiShell(),
    );
  }
}

class _CochiShell extends StatefulWidget {
  const _CochiShell();

  @override
  State<_CochiShell> createState() => _CochiShellState();
}

class _CochiShellState extends State<_CochiShell> {
  int _selectedIndex = 0;

  static final List<_PaneSection> _sections = [
    const _PaneSection('Home', FluentIcons.home),
    const _PaneSection('Cuentas', FluentIcons.account_management),
    const _PaneSection('Categorías', FluentIcons.category_classification),
    const _PaneSection('Pagos recurrentes', FluentIcons.repeat_all),
    const _PaneSection('Préstamos', FluentIcons.money),
    const _PaneSection('Ahorros', FluentIcons.wallet),
    const _PaneSection('Movimientos', FluentIcons.transfer_call),
    const _PaneSection('Configuración', FluentIcons.settings),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        title: () => const Text('Cochi'),
      ),
      pane: NavigationPane(
        selected: _selectedIndex,
        onChanged: (index) => setState(() => _selectedIndex = index),
        displayMode: PaneDisplayMode.auto,
        items: [
          for (final section in _sections)
            PaneItem(
              icon: Icon(section.icon),
              title: Text(section.title),
              body: _PagePlaceholder(title: section.title),
            ),
        ],
      ),
    );
  }
}

class _PaneSection {
  const _PaneSection(this.title, this.icon);

  final String title;
  final IconData icon;
}

class _PagePlaceholder extends StatelessWidget {
  const _PagePlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return NavigationBody(
      index: 0,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FluentIcons.construction_worker,
                size: 48,
                color: FluentTheme.of(context).accentColor,
              ),
              const SizedBox(height: 16),
              Text(
                '$title (En construcción)',
                style: FluentTheme.of(context)
                    .typography
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text(
                'Próximamente podrás interactuar con esta sección.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
