// const Text(context.watch<CounterModel>().getCount.toString()),
// context.read<CounterModel>().increment()
import 'package:flutter/material.dart';
import 'package:mid_practice/class_state/model.dart';
import 'package:mid_practice/class_state/screen_two.dart';
import 'package:provider/provider.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterModel>().count.toString(),
              style: const TextStyle(
                fontSize: 35,
                color: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenTwo()),
                );
              },
              child: const Text("Navigate"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<CounterModel>().increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
