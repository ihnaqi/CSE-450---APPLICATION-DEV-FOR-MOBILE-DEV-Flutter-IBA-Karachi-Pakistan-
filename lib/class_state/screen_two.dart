import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Second Screen with increment Counter",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${context.watch<CounterModel>().count}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterModel>().increment,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
