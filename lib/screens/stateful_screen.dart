import 'package:app/screens/notifier_state_screen.dart';
import 'package:app/util/app_colors.dart';
import 'package:app/util/context_extensions.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  const StatefulScreen({super.key});

  @override
  State<StatefulWidget> createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int counter = 0;
  Color color = AppColors.green;

  final colorPool = <Color>[AppColors.green, AppColors.blue, AppColors.pink, AppColors.purple];

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'State',
      child: Column(
        crossAxisAlignment: .center,
        children: [
          // Counter demo
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              _buildCounterButton(Icons.remove, () => setState(() => counter--)),
              CircleAvatar(
                minRadius: 75,
                child: Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 50),
                ),
              ),
              _buildCounterButton(Icons.add, () => setState(() => counter++)),
            ],
          ),
          SizedBox(height: 32),

          // Color demo
          GestureDetector(
            onTap: () {
              colorPool.shuffle();
              setState(() => color = colorPool.first);
            },
            child: AnimatedContainer(
              curve: Curves.decelerate,
              height: 300,
              width: double.infinity,
              color: color,
              duration: Duration(milliseconds: 500),
            ),
          ),
          SizedBox(height: 32),
          Button(
            label: 'Neste side',
            onPressed: () => context.push(ChangeNotifierStateScreen()),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Icon(icon, size: 24),
      ),
    );
  }
}
