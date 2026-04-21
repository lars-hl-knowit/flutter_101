import 'package:app/widgets/screen_scaffold.dart';
import 'package:flutter/material.dart';

class _CounterNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class ChangeNotifierStateScreen extends StatefulWidget {
  const ChangeNotifierStateScreen({super.key});

  @override
  State<ChangeNotifierStateScreen> createState() => _ChangeNotifierStateScreenState();
}

class _ChangeNotifierStateScreenState extends State<ChangeNotifierStateScreen> {
  final _counter = _CounterNotifier();

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Delt tilstand',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            'ChangeNotifier',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Én notifier – flere lyttere. Begge widgetene deler samme '
            'instans og rebuildes når notifyListeners() kalles.',
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _CounterDisplay(counter: _counter, label: 'Widget A'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _CounterDisplay(counter: _counter, label: 'Widget B'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: _counter.decrement,
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 16),
              FilledButton(
                onPressed: _counter.increment,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CounterDisplay extends StatelessWidget {
  const _CounterDisplay({required this.counter, required this.label});

  final _CounterNotifier counter;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: counter,
      builder: (context, _) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  '${counter.count}',
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
