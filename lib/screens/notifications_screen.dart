import 'package:app/widgets/button.dart';
import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Overlays',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          const SizedBox(height: 16),
          Button(
            label: 'BottomSheet',
            onPressed: () => _showBottomSheet(context),
          ),
          Button(
            label: 'Snackbar',
            onPressed: () => _showSnackbar(context),
          ),
          Button(
            label: 'Dialog',
            onPressed: () => _showDialog(context),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text('Bottom Sheet', style: Theme.of(context).textTheme.headlineSmall),
            Text('Dette er et standard Material bottom sheet. Det glir opp fra bunnen og kan lukkes ved å sveipe ned eller trykke utenfor.'),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Lukk'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Dette er en snackbar!'),
        action: SnackBarAction(
          label: 'Angre',
          onPressed: () {},
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Dialog'),
        content: const Text('Dette er en standard Material AlertDialog. Bruk den til bekreftelser eller viktige meldinger.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Avbryt'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekreft'),
          ),
        ],
      ),
    );
  }
}
