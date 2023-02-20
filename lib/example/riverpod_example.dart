import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(primaryColor: Colors.blue),
      home: MyHome(),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHome extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Value: $value',
          style: Theme.of(context).textTheme.headlineMedium
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.state).state++,
              child: const Icon(Icons.add),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.state).state--,
              child: const Icon(Icons.remove),
            )
          ],
        )
      ),
    );
  }
}
