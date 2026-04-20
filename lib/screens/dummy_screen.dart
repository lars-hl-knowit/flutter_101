import 'package:app/widgets/button.dart';
import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'En ny side',
      child: Center(
        child: Button(
          label: 'Modal',
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Text('En BottomSheet'),
                  Button(label: 'Lukk', onPressed: () => Navigator.pop(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
