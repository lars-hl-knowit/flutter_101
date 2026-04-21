import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class ThemeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Theme',
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          _buildThemedRow(context, Colors.green),
          SizedBox(height: 32),
          _buildThemedRow(context, Colors.blue),
          SizedBox(height: 32),
          _buildThemedRow(context, Colors.pink),
          SizedBox(height: 32),
          _buildThemedRow(context, Colors.orange),
          SizedBox(height: 32),
          _buildThemedRow(context, Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildThemedRow(BuildContext context, Color color) => Theme(
    data: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: color, onTertiary: Colors.black)),
    child: Builder(
      builder: (innerContext) {
        return Wrap(
          spacing: 16,
          children: [
            _buildBox(
              Theme.of(innerContext).colorScheme.primary,
              Theme.of(innerContext).colorScheme.onPrimary,
              'Primary',
            ),
            _buildBox(
              Theme.of(innerContext).colorScheme.secondary,
              Theme.of(innerContext).colorScheme.onSecondary,
              'Secondary',
            ),
            _buildBox(
              Theme.of(innerContext).colorScheme.tertiary,
              Theme.of(innerContext).colorScheme.onTertiary,
              'Tertiary',
            ),
          ],
        );
      },
    ),
  );

  Container _buildBox(Color surfaceColor, Color onSurfaceColor, String label) => Container(
    height: 100,
    width: 100,
    color: surfaceColor,
    child: Center(
      child: Text(
        label,
        style: TextStyle(color: onSurfaceColor),
      ),
    ),
  );
}
