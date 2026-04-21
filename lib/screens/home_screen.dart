import 'package:app/screens/animations_screen.dart';
import 'package:app/screens/notifier_state_screen.dart';
import 'package:app/screens/theme_screen.dart';
import 'package:app/screens/widgets_screen.dart';
import 'package:app/screens/stateful_screen.dart';
import 'package:app/util/context_extensions.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/screen_scaffold.dart';
import 'package:app/screens/layout_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Hjem',
      child: Column(
        crossAxisAlignment: .center,
        spacing: 16,
        children: [
          SizedBox(height: 16),
          Button(
            label: 'Layout',
            onPressed: () async => await context.push(LayoutScreen()),
          ),
          Button(
            label: 'Widgets',
            onPressed: () async => await context.push(WidgetsScreen()),
          ),
          Button(
            label: 'State',
            onPressed: () async => await context.push(StatefulScreen()),
          ),
          Button(
            label: 'Delt tilstand',
            onPressed: () async => await context.push(ChangeNotifierStateScreen()),
          ),
          Button(
            label: 'Animasjon',
            onPressed: () async => await context.push(AnimationsScreen()),
          ),
          Button(
            label: 'Theme',
            onPressed: () async => await context.push(ThemeScreen()),
          ),
        ],
      ),
    );
  }
}
