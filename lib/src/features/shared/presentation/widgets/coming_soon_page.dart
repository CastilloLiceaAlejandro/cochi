import 'package:fluent_ui/fluent_ui.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    return ScaffoldPage.withPadding(
      header: PageHeader(title: Text(title, style: theme.typography.titleLarge)),
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(FluentIcons.rocket,
                size: 56, color: theme.accentColor),
            const SizedBox(height: 16),
            Text(
              '$title en construcción',
              style: theme.typography.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Estamos trabajando para habilitar esta sección muy pronto.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
