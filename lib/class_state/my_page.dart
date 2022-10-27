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
    TextEditingController myController = TextEditingController();
    int a = 34;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: 250,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.edit),
                    hintText: "Enter Value here",
                    labelText: "Enter Value",
                  ),
                  controller: myController,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => context
                  .read<CounterModel>()
                  .changeTo(int.parse(myController.text.trim())),
              child: const Text("Change To"),
            )
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
